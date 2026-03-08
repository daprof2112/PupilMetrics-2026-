#!/usr/bin/env python3
"""
PATCH: Add zone name translations to the hover display.
Run from project root: python3 patch_zone_translations.py
"""

import os, sys, shutil
from datetime import datetime

DART_PATH = os.path.join('lib', 'presentation', 'analysis_screen.dart')
if not os.path.exists(DART_PATH):
    print(f"ERROR: {DART_PATH} not found.")
    sys.exit(1)

backup = DART_PATH + f'.backup_trans_{datetime.now().strftime("%Y%m%d_%H%M%S")}'
shutil.copy2(DART_PATH, backup)
print(f"Backup: {backup}")

with open(DART_PATH, 'r', encoding='utf-8') as f:
    content = f.read()

changes = 0

# CHANGE 1: Add import
IMPORT_ANCHOR = "import 'package:ai_eye_capture/utils/polar_zone_hittest.dart';"
IMPORT_NEW = IMPORT_ANCHOR + "\nimport 'package:ai_eye_capture/utils/zone_translations.dart';"

if 'zone_translations.dart' not in content:
    if IMPORT_ANCHOR in content:
        content = content.replace(IMPORT_ANCHOR, IMPORT_NEW, 1)
        changes += 1
        print("  [1/2] Added zone_translations import")
    else:
        print("  [1/2] ERROR: Could not find import anchor")
else:
    print("  [1/2] Import already present")

# CHANGE 2: Translate zone names in the hover display
# Find where hoveredZoneName is displayed and wrap with translation
# The display code shows: Text(hoveredZoneName, ...)
# We need to translate it using the current locale

# Find the hover display block
OLD_HOVER = "Text(hoveredZoneName, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold))"
NEW_HOVER = "Text(ZoneTranslations.translate(hoveredZoneName, Localizations.localeOf(ctx).languageCode), style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold))"

if OLD_HOVER in content and 'ZoneTranslations.translate(hoveredZoneName' not in content:
    content = content.replace(OLD_HOVER, NEW_HOVER, 1)
    changes += 1
    print("  [2a/2] Translated zone name in hover display")
else:
    if 'ZoneTranslations.translate(hoveredZoneName' in content:
        print("  [2a/2] Zone name already translated")
    else:
        print("  [2a/2] Could not find hover zone name display")

# Also translate the system name
OLD_SYS = "Text(hoveredZoneSystem, style: const TextStyle(color: Color(0xFF00D9FF), fontSize: 11))"
NEW_SYS = "Text(ZoneTranslations.translateSystem(hoveredZoneSystem, Localizations.localeOf(ctx).languageCode), style: const TextStyle(color: Color(0xFF00D9FF), fontSize: 11))"

if OLD_SYS in content and 'ZoneTranslations.translateSystem' not in content:
    content = content.replace(OLD_SYS, NEW_SYS, 1)
    print("  [2b/2] Translated system name in hover display")
else:
    if 'ZoneTranslations.translateSystem' in content:
        print("  [2b/2] System name already translated")
    else:
        print("  [2b/2] Could not find hover system name display")

with open(DART_PATH, 'w', encoding='utf-8') as f:
    f.write(content)

print(f"\nDone! {changes} changes applied.")
print("Run: flutter clean && flutter pub get")
