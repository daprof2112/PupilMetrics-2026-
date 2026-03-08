#!/usr/bin/env python3
"""
PATCH SCRIPT: Upgrades analysis_screen.dart from v5.3.0 to v5.3.1
Adds polar zone hit-testing support.

USAGE:
  1. Place this script in your Flutter project root directory
  2. Run: python3 patch_analysis_screen.py
  3. Your file will be updated in-place (backup created automatically)

PREREQUISITES:
  - polar_zone_hittest.dart already in lib/utils/
  - Polar zone JSON files already in assets/charts/
"""

import os
import sys
import shutil
from datetime import datetime

# Find the file
DART_PATH = os.path.join('lib', 'presentation', 'analysis_screen.dart')
if not os.path.exists(DART_PATH):
    print(f"ERROR: Could not find {DART_PATH}")
    print("Make sure you run this script from your Flutter project root directory.")
    sys.exit(1)

# Create backup
backup_path = DART_PATH + f'.backup_{datetime.now().strftime("%Y%m%d_%H%M%S")}'
shutil.copy2(DART_PATH, backup_path)
print(f"Backup created: {backup_path}")

# Read original
with open(DART_PATH, 'r', encoding='utf-8') as f:
    content = f.read()

original_len = len(content)
changes_made = 0

# ============================================================================
# CHANGE 1: Add import for polar_zone_hittest.dart
# ============================================================================
IMPORT_ANCHOR = "import 'package:ai_eye_capture/models/patient_info.dart';"
IMPORT_NEW = """import 'package:ai_eye_capture/models/patient_info.dart';
import 'package:ai_eye_capture/utils/polar_zone_hittest.dart';  // v5.3.1: Polar zone lookup"""

if 'polar_zone_hittest.dart' not in content:
    if IMPORT_ANCHOR in content:
        content = content.replace(IMPORT_ANCHOR, IMPORT_NEW, 1)
        changes_made += 1
        print("  [1/5] ✓ Added polar_zone_hittest import")
    else:
        print("  [1/5] ✗ Could not find import anchor line")
else:
    print("  [1/5] ○ Import already present (skipped)")

# ============================================================================
# CHANGE 2: Update version comment
# ============================================================================
OLD_VER = '// VERSION 5.3.0'
NEW_VER = '// VERSION 5.3.1'
if OLD_VER in content:
    content = content.replace(OLD_VER, NEW_VER, 1)
    changes_made += 1
    print("  [2/5] ✓ Updated version to 5.3.1")
else:
    print("  [2/5] ○ Version already updated or not found (skipped)")

# ============================================================================
# CHANGE 3: Replace loadZoneData function inside _openZoneOverlayDialog
# The old version only loads Cartesian grid. New version tries polar first.
# ============================================================================

OLD_LOAD = """    Future<void> loadZoneData(String preset, bool rightEye, void Function(void Function()) setState) async {
      try {
        final side = rightEye ? 'od' : 'os';
        // File names use underscores (vida_deck not vida-deck)
        final prefix = preset.toLowerCase().replaceAll(' ', '_').replaceAll('-', '_');
        final assetPath = 'assets/charts/${prefix}_${side}_zones.json';
        final jsonStr = await rootBundle.loadString(assetPath);
        final decoded = json.decode(jsonStr) as Map<String, dynamic>;
        // DEBUG: print first 3 grid values to confirm which JSON version is loaded
        debugPrint('LOADED: ' + assetPath);
        setState(() { loadedZoneData = decoded; });
      } catch (_) {
        setState(() { loadedZoneData = null; });
      }
    }"""

NEW_LOAD = """    // v5.3.1: Load polar zone data first (anatomy-adaptive), fallback to old grid
    Future<void> loadZoneData(String preset, bool rightEye, void Function(void Function()) setState) async {
      final polar = await PolarZoneData.load(preset, rightEye);
      if (polar != null) {
        setState(() { polarZoneData = polar; loadedZoneData = null; });
        debugPrint('LOADED POLAR: ${preset}_${rightEye ? "od" : "os"}');
        return;
      }
      try {
        final side = rightEye ? 'od' : 'os';
        final prefix = preset.toLowerCase().replaceAll(' ', '_').replaceAll('-', '_');
        final assetPath = 'assets/charts/${prefix}_${side}_zones.json';
        final jsonStr = await rootBundle.loadString(assetPath);
        final decoded = json.decode(jsonStr) as Map<String, dynamic>;
        debugPrint('LOADED CARTESIAN FALLBACK: ' + assetPath);
        setState(() { loadedZoneData = decoded; polarZoneData = null; });
      } catch (_) {
        setState(() { loadedZoneData = null; polarZoneData = null; });
      }
    }"""

if OLD_LOAD in content:
    content = content.replace(OLD_LOAD, NEW_LOAD, 1)
    changes_made += 1
    print("  [3/5] ✓ Replaced loadZoneData with polar-first version")
else:
    print("  [3/5] ✗ Could not find original loadZoneData (may need manual edit)")
    print("         Look for 'Future<void> loadZoneData' in _openZoneOverlayDialog")

# ============================================================================
# CHANGE 4: Add PolarZoneData variable and update zone data null checks
# ============================================================================

# 4a: Add polarZoneData variable after loadedZoneData declaration
OLD_ZONEVAR = "    Map<String, dynamic>? loadedZoneData;"
NEW_ZONEVAR = """    Map<String, dynamic>? loadedZoneData;
    PolarZoneData? polarZoneData;  // v5.3.1: Polar zone lookup"""

if 'PolarZoneData? polarZoneData' not in content:
    if OLD_ZONEVAR in content:
        content = content.replace(OLD_ZONEVAR, NEW_ZONEVAR, 1)
        changes_made += 1
        print("  [4a/5] ✓ Added polarZoneData variable")
    else:
        print("  [4a/5] ✗ Could not find loadedZoneData variable")
else:
    print("  [4a/5] ○ polarZoneData variable already present")

# 4b: Update the zone data load trigger check
OLD_TRIGGER = "if (showChart && loadedZoneData == null) {"
NEW_TRIGGER = "if (showChart && loadedZoneData == null && polarZoneData == null) {"
content = content.replace(OLD_TRIGGER, NEW_TRIGGER)

# 4c: Update hover/tap condition checks
OLD_HOVER = "if (showChart && loadedZoneData != null) {"
NEW_HOVER = "if (showChart && (loadedZoneData != null || polarZoneData != null)) {"
content = content.replace(OLD_HOVER, NEW_HOVER)

# 4d: Update the hitTestZone function to use polar data
OLD_HIT_START = "    Map<String, String> hitTestZone(Offset tapPos, Size containerSize, Map<String, dynamic>? zoneData) {"
NEW_HIT_PREFIX = """    // v5.3.1: Hit-test using polar zones (preferred) with old grid fallback
    Map<String, String> hitTestZone(Offset tapPos, Size containerSize, Map<String, dynamic>? zoneData) {
      // Polar lookup (anatomy-adaptive) — preferred path
      if (polarZoneData != null) {
        return polarZoneData!.hitTest(
          tapPos: tapPos, containerSize: containerSize,
          pupilIrisRatio: result.pupilIrisRatio,
          anwRingScale: anwRingScale,
          irisRadiusFraction: irisRadiusFraction * scaleAdjust,
        );
      }
      // Old Cartesian grid fallback"""

if OLD_HIT_START in content and 'polarZoneData!.hitTest' not in content:
    content = content.replace(OLD_HIT_START, NEW_HIT_PREFIX, 1)
    changes_made += 1
    print("  [4b/5] ✓ Added polar hit-test to hitTestZone")
else:
    if 'polarZoneData!.hitTest' in content:
        print("  [4b/5] ○ Polar hit-test already present")
    else:
        print("  [4b/5] ✗ Could not find hitTestZone function start")

# 4e: Update preset change handler to clear polar data
OLD_PRESET = """                                loadedZoneData = null;
                                hoveredZoneName = '';"""
NEW_PRESET = """                                loadedZoneData = null;
                                polarZoneData = null;  // v5.3.1
                                hoveredZoneName = '';"""
if 'polarZoneData = null;  // v5.3.1' not in content:
    content = content.replace(OLD_PRESET, NEW_PRESET, 1)
    print("  [4c/5] ✓ Updated preset change handler")

# 4f: Update CustomPaint showChart condition
OLD_PAINT = "showChart: showChart && loadedZoneData == null,"
NEW_PAINT = "showChart: showChart && loadedZoneData == null && polarZoneData == null,"
content = content.replace(OLD_PAINT, NEW_PAINT)

# ============================================================================
# CHANGE 5: Add POLAR badge to dialog title
# ============================================================================
OLD_TITLE_END = """              Expanded(
                child: Text(
                  '\\$label • Zone Overlay',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),"""

NEW_TITLE_END = """              Expanded(
                child: Text(
                  '\\$label • Zone Overlay',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              // v5.3.1: Show which lookup mode is active
              if (showChart)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: polarZoneData != null ? Colors.green.withOpacity(0.3) : Colors.orange.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    polarZoneData != null ? 'POLAR' : (loadedZoneData != null ? 'GRID' : '...'),
                    style: TextStyle(color: polarZoneData != null ? Colors.green : Colors.orange, fontSize: 9, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),"""

if 'POLAR' not in content or "polarZoneData != null ? 'POLAR'" not in content:
    if OLD_TITLE_END in content:
        content = content.replace(OLD_TITLE_END, NEW_TITLE_END, 1)
        changes_made += 1
        print("  [5/5] ✓ Added POLAR/GRID badge to dialog title")
    else:
        print("  [5/5] ✗ Could not find dialog title section")
else:
    print("  [5/5] ○ POLAR badge already present")

# ============================================================================
# WRITE OUTPUT
# ============================================================================
with open(DART_PATH, 'w', encoding='utf-8') as f:
    f.write(content)

new_len = len(content)
print(f"\nDone! {changes_made} changes applied to {DART_PATH}")
print(f"File size: {original_len} → {new_len} chars ({new_len - original_len:+d})")
print(f"Backup: {backup_path}")
print("\nNext steps:")
print("  1. Run 'flutter pub get' (if not already done)")
print("  2. Run your app and test the zone overlay")
print("  3. Select Jensen chart, hover over 7.5 o'clock position")
print("     → Inner iris should show LIVER (not GALLBLADDER)")
print("  4. You should see 'POLAR' badge in the dialog title bar")
