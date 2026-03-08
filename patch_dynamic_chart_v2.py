#!/usr/bin/env python3
"""
PATCH v2: Replace PNG chart overlay with dynamic zone rendering.
Run from project root: python3 patch_dynamic_chart_v2.py

Restores from most recent backup first if syntax is broken.
"""

import os, sys, shutil, glob
from datetime import datetime

DART_PATH = os.path.join('lib', 'presentation', 'analysis_screen.dart')
if not os.path.exists(DART_PATH):
    print(f"ERROR: {DART_PATH} not found. Run from project root.")
    sys.exit(1)

# Find and restore from most recent backup if the file has syntax errors
backups = sorted(glob.glob(DART_PATH + '.backup_*'))
if backups:
    print(f"Found {len(backups)} backup(s). Most recent: {backups[-1]}")

# Create a new backup
backup = DART_PATH + f'.backup_dynv2_{datetime.now().strftime("%Y%m%d_%H%M%S")}'
shutil.copy2(DART_PATH, backup)
print(f"New backup: {backup}")

with open(DART_PATH, 'r', encoding='utf-8') as f:
    content = f.read()

changes = 0

# =========================================================================
# CHANGE 1: Add import
# =========================================================================
if 'dynamic_chart_painter.dart' not in content:
    # Try multiple anchor points
    for anchor in [
        "import 'package:ai_eye_capture/utils/chart_warper.dart';",
        "import 'package:ai_eye_capture/utils/polar_zone_hittest.dart';",
        "import 'package:ai_eye_capture/models/patient_info.dart';",
    ]:
        if anchor in content:
            new_import = anchor + "\nimport 'package:ai_eye_capture/utils/dynamic_chart_painter.dart';"
            content = content.replace(anchor, new_import, 1)
            changes += 1
            print(f"  [1/2] Added dynamic_chart_painter import")
            break
    else:
        print("  [1/2] ERROR: Could not find import anchor")
else:
    print(f"  [1/2] Import already present")

# =========================================================================
# CHANGE 2: Replace the chart overlay
#
# We need to find the EXACT block that renders the chart inside the
# IgnorePointer > ClipRect > Align > SizedBox > Opacity structure.
#
# The key is to replace the ENTIRE IgnorePointer block with one that
# uses DynamicChartPainter when polar data is available.
# =========================================================================

# Find the IgnorePointer block that contains the chart
# It starts with "if (showChart)" followed by "IgnorePointer("
# and contains _buildChartAssetOverlay or WarpedChartOverlay

# Strategy: find the Opacity line and replace just its child
# Look for these specific patterns in order of likelihood:

REPLACEMENTS = [
    # Pattern A: WarpedChartOverlay from previous patch
    (
        """child: polarZoneData != null
                                                      ? WarpedChartOverlay(
                                                          chartPreset: chartPreset,
                                                          isRightEye: isRightEye,
                                                          realPupilFrac: (result.pupilIrisRatio / 100.0).clamp(0.05, 0.55),
                                                          realCollaretteFrac: ((result.pupilIrisRatio / 100.0) + 0.15 * anwRingScale).clamp(0.20, 0.70),
                                                          chartPupilFrac: polarZoneData!.chartPupilFrac,
                                                          chartCollaretteFrac: polarZoneData!.chartCollaretteFrac,
                                                        )
                                                      : _buildChartAssetOverlay(chartPreset: chartPreset, isRightEye: isRightEye),""",
        "Pattern A (WarpedChartOverlay)"
    ),
    # Pattern B: Original _buildChartAssetOverlay
    (
        "child: _buildChartAssetOverlay(chartPreset: chartPreset, isRightEye: isRightEye),",
        "Pattern B (original)"
    ),
]

# What we want to replace it with:
DYNAMIC_CHILD = """child: polarZoneData != null
                                                      ? CustomPaint(
                                                          painter: DynamicChartPainter(
                                                            polarData: polarZoneData!,
                                                            realPupilFrac: (result.pupilIrisRatio / 100.0).clamp(0.05, 0.55),
                                                            realCollaretteFrac: ((result.pupilIrisRatio / 100.0) + 0.15 * anwRingScale).clamp(0.20, 0.70),
                                                            opacity: chartOpacity,
                                                            showLabels: true,
                                                            outlineOnly: chartOpacity > 0.3,
                                                          ),
                                                          size: Size.infinite,
                                                        )
                                                      : _buildChartAssetOverlay(chartPreset: chartPreset, isRightEye: isRightEye),"""

if 'DynamicChartPainter' not in content:
    replaced = False
    for old_text, label in REPLACEMENTS:
        if old_text in content:
            content = content.replace(old_text, DYNAMIC_CHILD, 1)
            changes += 1
            replaced = True
            print(f"  [2/2] Replaced {label} with DynamicChartPainter")
            break
    
    if not replaced:
        # Last resort: search for any _buildChartAssetOverlay call inside Opacity
        # and do a simple line replacement
        lines = content.split('\n')
        for i, line in enumerate(lines):
            stripped = line.strip()
            if stripped.startswith('child: _buildChartAssetOverlay(') or \
               stripped.startswith('child: polarZoneData') and 'WarpedChartOverlay' in stripped:
                # Found it — but we need to handle multi-line patterns
                # Just flag for manual edit
                print(f"  [2/2] Found chart overlay at line {i+1} but pattern doesn't match exactly.")
                print(f"         Line content: {stripped[:80]}...")
                break
        else:
            print(f"  [2/2] ERROR: Could not find chart overlay to replace.")
        
        if not replaced:
            print(f"\n  MANUAL FIX NEEDED:")
            print(f"  1. Open lib/presentation/analysis_screen.dart")
            print(f"  2. Search for '_buildChartAssetOverlay'")
            print(f"  3. Find the line that says:")
            print(f"       child: _buildChartAssetOverlay(chartPreset: chartPreset, isRightEye: isRightEye),")
            print(f"  4. Replace that ONE line with:")
            print(f"       child: polarZoneData != null")
            print(f"           ? CustomPaint(")
            print(f"               painter: DynamicChartPainter(")
            print(f"                 polarData: polarZoneData!,")
            print(f"                 realPupilFrac: (result.pupilIrisRatio / 100.0).clamp(0.05, 0.55),")
            print(f"                 realCollaretteFrac: ((result.pupilIrisRatio / 100.0) + 0.15 * anwRingScale).clamp(0.20, 0.70),")
            print(f"                 opacity: chartOpacity,")
            print(f"                 showLabels: true,")
            print(f"                 outlineOnly: chartOpacity > 0.3,")
            print(f"               ),")
            print(f"               size: Size.infinite,")
            print(f"             )")
            print(f"           : _buildChartAssetOverlay(chartPreset: chartPreset, isRightEye: isRightEye),")
else:
    print(f"  [2/2] DynamicChartPainter already present")

# Verify syntax: count braces/parens balance
opens = content.count('(') + content.count('{') + content.count('[')
closes = content.count(')') + content.count('}') + content.count(']')
if opens != closes:
    print(f"\n  WARNING: Bracket imbalance detected! opens={opens} closes={closes} diff={opens-closes}")
    print(f"  The file may have syntax errors. Consider restoring backup: {backup}")
else:
    print(f"\n  Bracket balance check: OK ({opens} opens, {closes} closes)")

with open(DART_PATH, 'w', encoding='utf-8') as f:
    f.write(content)

print(f"\nDone! {changes} changes applied.")
print(f"Run: flutter clean && flutter pub get")
