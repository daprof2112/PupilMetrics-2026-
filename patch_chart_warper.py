#!/usr/bin/env python3
"""
PATCH: Add radial chart warping to analysis_screen.dart
Run from your Flutter project root: python3 patch_chart_warper.py

PREREQUISITES:
  - chart_warper.dart in lib/utils/
  - polar_zone_hittest.dart in lib/utils/ (already installed)
  - Polar JSON files in assets/charts/ (already installed)
  - Previous polar zone patch already applied
"""

import os, sys, shutil
from datetime import datetime

DART_PATH = os.path.join('lib', 'presentation', 'analysis_screen.dart')
if not os.path.exists(DART_PATH):
    print(f"ERROR: {DART_PATH} not found. Run from project root.")
    sys.exit(1)

backup = DART_PATH + f'.backup_warper_{datetime.now().strftime("%Y%m%d_%H%M%S")}'
shutil.copy2(DART_PATH, backup)
print(f"Backup: {backup}")

with open(DART_PATH, 'r', encoding='utf-8') as f:
    content = f.read()

changes = 0

# CHANGE 1: Add chart_warper import
IMPORT_ANCHOR = "import 'package:ai_eye_capture/utils/polar_zone_hittest.dart';"
IMPORT_NEW = """import 'package:ai_eye_capture/utils/polar_zone_hittest.dart';
import 'package:ai_eye_capture/utils/chart_warper.dart';  // v5.3.1: Radial chart warping"""

if 'chart_warper.dart' not in content:
    if IMPORT_ANCHOR in content:
        content = content.replace(IMPORT_ANCHOR, IMPORT_NEW, 1)
        changes += 1
        print("  [1/2] Added chart_warper import")
    else:
        print("  [1/2] ERROR: Could not find polar_zone_hittest import to anchor to")
else:
    print("  [1/2] chart_warper import already present")

# CHANGE 2: Replace chart overlay widget with warped version
# Find the line that builds the chart overlay inside the SizedBox/Opacity
# The current code uses: _buildChartAssetOverlay(chartPreset: chartPreset, isRightEye: isRightEye)
# inside an Opacity widget inside a SizedBox

OLD_CHART = """child: _buildChartAssetOverlay(chartPreset: chartPreset, isRightEye: isRightEye),"""

NEW_CHART = """child: polarZoneData != null
                                                      ? WarpedChartOverlay(
                                                          chartPreset: chartPreset,
                                                          isRightEye: isRightEye,
                                                          realPupilFrac: (result.pupilIrisRatio / 100.0).clamp(0.05, 0.55),
                                                          realCollaretteFrac: ((result.pupilIrisRatio / 100.0) + 0.15 * anwRingScale).clamp(0.20, 0.70),
                                                          chartPupilFrac: polarZoneData!.chartPupilFrac,
                                                          chartCollaretteFrac: polarZoneData!.chartCollaretteFrac,
                                                        )
                                                      : _buildChartAssetOverlay(chartPreset: chartPreset, isRightEye: isRightEye),"""

if 'WarpedChartOverlay' not in content:
    if OLD_CHART in content:
        content = content.replace(OLD_CHART, NEW_CHART, 1)
        changes += 1
        print("  [2/2] Replaced chart overlay with WarpedChartOverlay")
    else:
        # Try alternate whitespace
        import re
        pattern = r'child:\s*_buildChartAssetOverlay\(chartPreset:\s*chartPreset,\s*isRightEye:\s*isRightEye\),'
        match = re.search(pattern, content)
        if match:
            content = content[:match.start()] + NEW_CHART + content[match.end():]
            changes += 1
            print("  [2/2] Replaced chart overlay with WarpedChartOverlay (regex match)")
        else:
            print("  [2/2] ERROR: Could not find _buildChartAssetOverlay call")
            print("         Search for '_buildChartAssetOverlay' in your file and replace manually:")
            print("         REPLACE: child: _buildChartAssetOverlay(chartPreset: chartPreset, isRightEye: isRightEye),")
            print("         WITH the WarpedChartOverlay widget (see INTEGRATION_GUIDE)")
else:
    print("  [2/2] WarpedChartOverlay already present")

with open(DART_PATH, 'w', encoding='utf-8') as f:
    f.write(content)

print(f"\nDone! {changes} changes applied.")
print(f"\nWhat this does:")
print(f"  When polar zone data is loaded (green POLAR badge), the chart PNG")
print(f"  is radially warped to match your eye's actual P/I ratio and collarette")
print(f"  position. Zone boundaries in the chart will now align with the real iris.")
print(f"\nIMPORTANT: Run 'flutter clean && flutter pub get' before building!")
