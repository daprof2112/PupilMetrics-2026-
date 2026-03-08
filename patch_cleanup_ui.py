#!/usr/bin/env python3
"""
PATCH: Clean up zone overlay UI
1. Remove chart preset dropdown (single chart only)
2. Fix slider layout — tooltips next to their sliders
"""

import os, sys, shutil
from datetime import datetime

DART_PATH = os.path.join('lib', 'presentation', 'analysis_screen.dart')
if not os.path.exists(DART_PATH):
    print(f"ERROR: {DART_PATH} not found.")
    sys.exit(1)

backup = DART_PATH + f'.backup_cleanup_{datetime.now().strftime("%Y%m%d_%H%M%S")}'
shutil.copy2(DART_PATH, backup)
print(f"Backup: {backup}")

with open(DART_PATH, 'r', encoding='utf-8') as f:
    content = f.read()

changes = 0

# =========================================================================
# CHANGE 1: Remove the chart preset dropdown
# Find the Container with DropdownButton and replace with nothing
# =========================================================================

# The dropdown is inside: if (showChart) Container(padding:... DropdownButton...)
# It's a large block. Let's find and remove it.

DROPDOWN_START = """                    if (showChart)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF00D9FF).withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: chartPreset,
                            dropdownColor: const Color(0xFF1D1E33),
                            style: const TextStyle(color: Colors.white),
                            items: const [
                              DropdownMenuItem(value: 'Angerer',   child: Text('Angerer')),
                              DropdownMenuItem(value: 'Bourdiol',  child: Text('Bourdiol')),
                              DropdownMenuItem(value: 'Vida-Deck', child: Text('Vida-Deck')),
                              DropdownMenuItem(value: 'Jensen',    child: Text('Jensen')),
                              DropdownMenuItem(value: 'Gunter',    child: Text('Gunter')),
                              DropdownMenuItem(value: 'Jausas',    child: Text('Jausas')),
                              DropdownMenuItem(value: 'Roberts',   child: Text('Roberts')),
                              DropdownMenuItem(value: 'Velchover', child: Text('Velchover')),
                            ],
                            onChanged: (v) {
                              setLocalState(() {
                                chartPreset = v ?? 'Velchover';
                                loadedZoneData = null;
                                polarZoneData = null;  // v5.3.1
                                hoveredZoneName = '';
                                hoveredZoneSystem = '';
                              });
                              loadZoneData(chartPreset, isRightEye, setLocalState);
                            },
                          ),
                        ),
                      ),"""

if DROPDOWN_START in content:
    content = content.replace(DROPDOWN_START, '', 1)
    changes += 1
    print("  [1/3] Removed chart preset dropdown")
else:
    # Try without the v5.3.1 comment
    ALT_DROPDOWN = DROPDOWN_START.replace("                                polarZoneData = null;  // v5.3.1\n", "                                polarZoneData = null;\n")
    if ALT_DROPDOWN in content:
        content = content.replace(ALT_DROPDOWN, '', 1)
        changes += 1
        print("  [1/3] Removed chart preset dropdown (alt)")
    else:
        print("  [1/3] Could not find dropdown — may need manual removal")
        print("         Search for 'DropdownButton<String>' and delete the whole Container block")

# =========================================================================
# CHANGE 2: Set default chartPreset to 'Jensen' (since it's our only chart)
# =========================================================================

OLD_PRESET = "String chartPreset = 'Velchover';"
NEW_PRESET = "String chartPreset = 'Jensen';  // Single chart — Integrative Iridology"

if OLD_PRESET in content:
    content = content.replace(OLD_PRESET, NEW_PRESET, 1)
    changes += 1
    print("  [2/3] Default preset changed to Jensen")
else:
    # Maybe already Jensen
    if "String chartPreset = 'Jensen'" in content:
        print("  [2/3] Already set to Jensen")
    else:
        print("  [2/3] Could not find chartPreset default")

# =========================================================================
# CHANGE 3: Fix slider layout — compact the ring size controls
# Replace the ring slider section with a cleaner layout
# =========================================================================

OLD_RING_SLIDERS = """                    if (showIris || showPupil || showANW) ...[
                      const SizedBox(width: 8),
                      Tooltip(
                        message: 'Iris limbus ring size',
                        preferBelow: false,
                        child: Icon(Icons.circle_outlined, color: const Color(0xFF00D9FF), size: 14),
                      ),
                      SizedBox(
                        width: 72,
                        child: Slider(
                          value: irisLimbusScale, min: 0.5, max: 2.0, divisions: 30,
                          activeColor: const Color(0xFF00D9FF), inactiveColor: Colors.white12,
                          onChanged: (v) => setLocalState(() => irisLimbusScale = v),
                        ),
                      ),
                      Tooltip(
                        message: 'Pupil ring size',
                        preferBelow: false,
                        child: Icon(Icons.radio_button_unchecked, color: Colors.greenAccent, size: 14),
                      ),
                      SizedBox(
                        width: 72,
                        child: Slider(
                          value: pupilRingScale, min: 0.5, max: 2.0, divisions: 30,
                          activeColor: Colors.greenAccent, inactiveColor: Colors.white12,
                          onChanged: (v) => setLocalState(() => pupilRingScale = v),
                        ),
                      ),
                      Tooltip(
                        message: 'ANW / collarette ring size',
                        preferBelow: false,
                        child: Icon(Icons.adjust, color: Colors.orangeAccent, size: 14),
                      ),
                      SizedBox(
                        width: 72,
                        child: Slider(
                          value: anwRingScale, min: 0.5, max: 2.5, divisions: 40,
                          activeColor: Colors.orangeAccent, inactiveColor: Colors.white12,
                          onChanged: (v) => setLocalState(() => anwRingScale = v),
                        ),
                      ),
                    ],"""

NEW_RING_SLIDERS = """                    if (showIris || showPupil || showANW) ...[
                      const SizedBox(width: 4),
                      const Text('Iris', style: TextStyle(color: Color(0xFF00D9FF), fontSize: 10)),
                      SizedBox(width: 60, child: Slider(value: irisLimbusScale, min: 0.5, max: 2.0, divisions: 30, activeColor: const Color(0xFF00D9FF), inactiveColor: Colors.white12, onChanged: (v) => setLocalState(() => irisLimbusScale = v))),
                      const Text('Pupil', style: TextStyle(color: Colors.greenAccent, fontSize: 10)),
                      SizedBox(width: 60, child: Slider(value: pupilRingScale, min: 0.5, max: 2.0, divisions: 30, activeColor: Colors.greenAccent, inactiveColor: Colors.white12, onChanged: (v) => setLocalState(() => pupilRingScale = v))),
                      const Text('ANW', style: TextStyle(color: Colors.orangeAccent, fontSize: 10)),
                      SizedBox(width: 60, child: Slider(value: anwRingScale, min: 0.5, max: 2.5, divisions: 40, activeColor: Colors.orangeAccent, inactiveColor: Colors.white12, onChanged: (v) => setLocalState(() => anwRingScale = v))),
                    ],"""

if OLD_RING_SLIDERS in content:
    content = content.replace(OLD_RING_SLIDERS, NEW_RING_SLIDERS, 1)
    changes += 1
    print("  [3/3] Compact ring sliders with inline labels")
else:
    print("  [3/3] Could not find ring slider block — may need manual edit")

with open(DART_PATH, 'w', encoding='utf-8') as f:
    f.write(content)

print(f"\nDone! {changes} changes applied.")
print("Run: flutter clean && flutter pub get")
