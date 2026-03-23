"""
parse_herbal_db.py
Parses all herbal PDF files in knowledge/herbalbase/ into a single JSON database.
Output: knowledge/herbal_database.json

Run from the project root:
    python knowledge/parse_herbal_db.py

Requires: pdfplumber (already installed)
"""

import os
import re
import json
import pdfplumber
from collections import defaultdict

HERBALBASE_DIR = os.path.join(os.path.dirname(__file__), "herbalbase")
OUTPUT_PATH    = os.path.join(os.path.dirname(__file__), "herbal_database.json")

# ── Regex patterns ────────────────────────────────────────────────────────────
RE_CONDITION = re.compile(
    r'LIST OF HERBS MATCHING:\s*["\u201c\u201d](.+?)["\u201c\u201d]',
    re.IGNORECASE | re.DOTALL
)
# Herb entry line: starts with 1-3 digit count, then the rest
# Example: "6 GARLIC ARTERIOSCLEROSIS"
# Example: " 2 HERBAL UPRISING(PLANETARY F.) BLOATING"
RE_COUNT_LINE = re.compile(r'^\s*(\d{1,3})\s+(.+)$')
# Reference line: "  1) BOOK TITLE ..."
RE_REF_LINE   = re.compile(r'^\s*\d+\)\s+(.+)$')
# Header / skip lines
SKIP_PATTERNS = re.compile(
    r'^(Cnt\s+Herbname|LIST OF HERBS|Herbname:|nce\(s\)|Reference)',
    re.IGNORECASE
)


def extract_text_from_pdf(path: str) -> str:
    """Extract all text from a PDF, joining pages."""
    try:
        with pdfplumber.open(path) as pdf:
            parts = []
            for page in pdf.pages:
                t = page.extract_text()
                if t:
                    parts.append(t)
            return "\n".join(parts)
    except Exception:
        return ""


def parse_herb_text(text: str, filename: str) -> tuple:
    """
    Returns (condition_name, [{ herb, count, refs }])
    Returns (None, []) if file is blank or malformed.

    Strategy for herb/condition split:
    The herb line format is: "{count} {HERB_NAME} {CONDITION_VARIANT}"
    where CONDITION_VARIANT shares a prefix with the known condition.
    We strip the condition text by finding where it starts in the line.
    """
    # Extract condition name from header
    cond_match = RE_CONDITION.search(text)
    if not cond_match:
        return None, []

    condition = re.sub(r'\s+', ' ', cond_match.group(1).strip())
    # The first significant word(s) of the condition — used for stripping herb lines
    # e.g. "ARTERIOSCLEROSIS" -> "ARTERIOSCLEROSIS"
    # e.g. "ANEMIA (HYPOCHROMIC, MICROCYTIC" -> "ANEMIA"
    cond_primary = condition.split('(')[0].split('-')[0].strip().upper()

    herbs = []
    lines = text.split('\n')
    current_herb = None
    skip_header = True  # skip lines before first real herb entry

    for line in lines:
        stripped = line.strip()
        if not stripped:
            continue

        # Skip known header/junk lines
        if SKIP_PATTERNS.match(stripped):
            continue

        # Reference line (must come after a herb entry)
        ref_match = RE_REF_LINE.match(line)
        if ref_match and current_herb is not None:
            ref_text = re.sub(r'\s+', ' ', ref_match.group(1).strip())
            # Filter out junk ref continuations (no meaningful content)
            if len(ref_text) > 3:
                current_herb['refs'].append(ref_text)
            continue

        # Potential herb count line
        count_match = RE_COUNT_LINE.match(line)
        if count_match:
            count = int(count_match.group(1))
            rest  = count_match.group(2).strip()

            # Skip if this looks like a page header or footer
            if re.match(r'^(page|p\.\s*\d)', rest, re.IGNORECASE):
                continue

            # Strip the condition text from the end of the line to get herb name.
            # The condition text starts somewhere after the herb name.
            # Strategy: find the rightmost occurrence of the condition primary word.
            # e.g. "GARLIC ARTERIOSCLEROSIS" -> herb="GARLIC"
            # e.g. "DRINK PURE WATER ARTERIOSCLEROSIS -TO PREVENT" -> herb="DRINK PURE WATER"
            herb_name = rest
            if cond_primary and cond_primary in rest.upper():
                idx = rest.upper().rfind(cond_primary)
                # Walk back past any preceding space/hyphen
                candidate = rest[:idx].rstrip(' -').strip()
                if candidate:
                    herb_name = candidate

            herb_name = re.sub(r'\s+', ' ', herb_name).strip()

            # Skip obvious non-herb entries
            if not herb_name or len(herb_name) < 2:
                continue
            if re.match(r'^(matched|text|refere)', herb_name, re.IGNORECASE):
                continue

            current_herb = {'herb': herb_name, 'count': count, 'refs': []}
            herbs.append(current_herb)
            continue

        # Multi-line continuation of a reference (no leading number)
        # e.g. "GE 150" continuing from "PAGE 1" on prev line
        if current_herb and current_herb['refs'] and len(stripped) > 2:
            # Append to last ref if it looks like a continuation
            if not re.match(r'^\d+\s+', stripped) and not SKIP_PATTERNS.match(stripped):
                last = current_herb['refs'][-1]
                # Only merge if last ref looks incomplete (doesn't end with digit/.)
                if last and not re.search(r'[\d\.\)]$', last):
                    current_herb['refs'][-1] = last + ' ' + stripped

    return condition, herbs


def main():
    pdf_files = sorted(
        f for f in os.listdir(HERBALBASE_DIR) if f.lower().endswith('.pdf')
    )
    total = len(pdf_files)
    print(f"Found {total} PDF files in herbalbase/")

    # condition -> herb_name -> entry
    database = defaultdict(dict)

    blank_count  = 0
    parsed_count = 0

    for i, filename in enumerate(pdf_files):
        path = os.path.join(HERBALBASE_DIR, filename)
        text = extract_text_from_pdf(path)

        if not text.strip():
            blank_count += 1
            continue

        condition, herbs = parse_herb_text(text, filename)

        if condition is None or not herbs:
            blank_count += 1
            continue

        for herb_entry in herbs:
            herb_name = herb_entry['herb']
            if herb_name in database[condition]:
                existing = database[condition][herb_name]
                existing['count'] = max(existing['count'], herb_entry['count'])
                existing_set = set(existing['refs'])
                for r in herb_entry['refs']:
                    if r not in existing_set:
                        existing['refs'].append(r)
                        existing_set.add(r)
            else:
                database[condition][herb_name] = herb_entry

        parsed_count += 1

        if (i + 1) % 500 == 0 or i == 0:
            print(f"  Processed {i + 1}/{total}  (parsed={parsed_count}, blank={blank_count})",
                  flush=True)

    # Convert to sorted lists — highest count first
    output = {}
    for condition, herb_dict in sorted(database.items()):
        output[condition] = sorted(
            herb_dict.values(),
            key=lambda h: h['count'],
            reverse=True
        )

    with open(OUTPUT_PATH, 'w', encoding='utf-8') as f:
        json.dump(output, f, indent=2, ensure_ascii=False)

    size_kb = os.path.getsize(OUTPUT_PATH) / 1024
    total_herbs = sum(len(v) for v in output.values())

    print()
    print("Done!")
    print(f"  Parsed:             {parsed_count}")
    print(f"  Blank/skipped:      {blank_count}")
    print(f"  Unique conditions:  {len(output)}")
    print(f"  Total herb entries: {total_herbs}")
    print(f"  Output file:        {OUTPUT_PATH}")
    print(f"  File size:          {size_kb:.1f} KB")


if __name__ == '__main__':
    main()
