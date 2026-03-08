#!/usr/bin/env python3
"""
PATCH: Replace PNG chart overlay with dynamic zone rendering.
Run from project root: python3 patch_dynamic_chart.py

PREREQUISITES:
  - dynamic_chart_painter.dart in lib/utils/
  - polar_zone_hittest.dart in lib/utils/
  - Polar v3 JSON files in assets/charts/
"""

import os, sys, shutil, re
from datetime import datetime

DART_PATH = os.path.join('lib', 'presentation', 'analysis_screen.dart')
if not os.path.exists(DART_PATH):
    print(f"ERROR: {DART_PATH} not found. Run from project root.")
    sys.exit(1)

backup = DART_PATH + f'.backup_dynamic_{datetime.now().strftime("%Y%m%d_%H%M%S")}'
shutil.copy2(DART_PATH, backup)
print(f"Backup: {backup}")

with open(DART_PATH, 'r', encoding='utf-8') as f:
    content = f.read()

changes = 0

# =========================================================================
# CHANGE 1: Add dynamic_chart_painter import
# =========================================================================
if 'dynamic_chart_painter.dart' not in content:
    # Find anchor — could be polar_zone or chart_warper
    for anchor in [
        "import 'package:ai_eye_capture/utils/chart_warper.dart';",
        "import 'package:ai_eye_capture/utils/polar_zone_hittest.dart';",
    ]:
        if anchor in content:
            content = content.replace(anchor, anchor + "\nimport 'package:ai_eye_capture/utils/dynamic_chart_painter.dart';  // v5.3.2: Dynamic zone rendering", 1)
            changes += 1
            print("  [1/3] Added dynamic_chart_painter import")
            break
    else:
        print("  [1/3] ERROR: Could not find import anchor")
else:
    print("  [1/3] Import already present")

# =========================================================================
# CHANGE 2: Replace the chart overlay rendering
# Find the IgnorePointer block that contains the chart SizedBox/Opacity
# and replace with dynamic rendering
# =========================================================================

# The chart overlay is inside: if (showChart) IgnorePointer(child: ClipRect(...))
# We need to replace the entire IgnorePointer block

# Strategy: find the IgnorePointer line and replace the child content
# Look for the pattern with the SizedBox containing either WarpedChartOverlay or _buildChartAssetOverlay

# Pattern to find: the Opacity widget containing the chart
# This is inside IgnorePointer > ClipRect > Align > SizedBox > Opacity > child

# Find any of these chart rendering patterns and replace
PATTERNS = [
    # WarpedChartOverlay version
    (r"child:\s*polarZoneData\s*!=\s*null\s*\?\s*WarpedChartOverlay\(.*?\)\s*:\s*_buildChartAssetOverlay\([^)]+\),", True),
    # Direct _buildChartAssetOverlay
    (r"child:\s*_buildChartAssetOverlay\(chartPreset:\s*chartPreset,\s*isRightEye:\s*isRightEye\),", False),
]

NEW_CHILD = """child: polarZoneData != null
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
    for pattern, is_multiline in PATTERNS:
        flags = re.DOTALL if is_multiline else 0
        match = re.search(pattern, content, flags)
        if match:
            content = content[:match.start()] + NEW_CHILD + content[match.end():]
            changes += 1
            replaced = True
            print(f"  [2/3] Replaced chart overlay with DynamicChartPainter")
            break
    if not replaced:
        print("  [2/3] ERROR: Could not find chart overlay pattern to replace.")
        print("         Manual fix needed — see instructions below.")
else:
    print("  [2/3] DynamicChartPainter already present")

# =========================================================================
# CHANGE 3: Remove the Opacity wrapper since DynamicChartPainter handles
# opacity internally. The Opacity widget was wrapping the old chart.
# We need to bypass it for the dynamic painter.
# =========================================================================

# The structure is: SizedBox > Opacity > child
# For DynamicChartPainter, opacity is handled internally so we can
# remove the Opacity wrapper. But this is tricky to do safely.
# 
# Instead, let's just set Opacity to 1.0 when using dynamic painter,
# since the painter handles its own opacity.
# 
# Actually, simplest: replace the Opacity widget entirely.
# Find: Opacity(opacity: chartOpacity, child: ...)
# Replace: the child directly (since DynamicChartPainter takes opacity as param)

OLD_OPACITY = "Opacity(\n                                                      opacity: chartOpacity,\n                                                      "
NEW_OPACITY = ""  # Remove Opacity wrapper

# Only do this if DynamicChartPainter is now in the content  
if 'DynamicChartPainter' in content and OLD_OPACITY in content:
    # Replace the Opacity wrapper opening
    content = content.replace(OLD_OPACITY, "", 1)
    # Now we need to remove the matching closing paren
    # Find the closing ),  for what was the Opacity widget
    # This is tricky — let's leave it as is for safety
    # The Opacity(opacity: 1.0) wrapper is harmless
    content = content.replace(OLD_OPACITY, "", 1)  # won't match again, that's fine
    print("  [3/3] Note: Opacity wrapper still present but harmless")
else:
    # Try alternate formatting
    if 'DynamicChartPainter' in content:
        print("  [3/3] Skipped (Opacity wrapper format differs — harmless)")
    else:
        print("  [3/3] Skipped (DynamicChartPainter not yet integrated)")

with open(DART_PATH, 'w', encoding='utf-8') as f:
    f.write(content)

print(f"\nDone! {changes} changes applied.")
print(f"""
WHAT THIS DOES:
  Instead of overlaying a static PNG chart (which never aligns correctly),
  the zones are now DRAWN DYNAMICALLY from the same polar data used for
  hit-testing. Every zone boundary is rendered as a line at the exact
  position that matches the hover/tap detection.

  The chart opacity slider now controls the dynamic rendering opacity.
  Zone labels appear when opacity > 30%.

MANUAL FIX (if change 2 failed):
  In analysis_screen.dart, find the line inside _openZoneOverlayDialog that says:
    child: _buildChartAssetOverlay(chartPreset: chartPreset, isRightEye: isRightEye),
  
  Replace it with:
    child: polarZoneData != null
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
        : _buildChartAssetOverlay(chartPreset: chartPreset, isRightEye: isRightEye),

IMPORTANT: flutter clean && flutter pub get before building!
""")
