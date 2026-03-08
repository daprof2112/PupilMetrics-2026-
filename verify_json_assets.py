
import json, os, sys

assets_dir = r"assets\charts"  # Run from project root
if not os.path.exists(assets_dir):
    print(f"ERROR: {assets_dir} not found. Run from Flutter project root!")
    sys.exit(1)

files = sorted(os.listdir(assets_dir))
print(f"Files in {assets_dir}: {len(files)}")

for fname in files:
    if not fname.endswith('.json'):
        continue
    path = os.path.join(assets_dir, fname)
    try:
        with open(path) as f:
            d = json.load(f)
        grid = d.get('grid', [])
        n_zones = len(d.get('idToName', {}))
        # Check system for LIVER zone
        liver_sys = next((v for k,v in d.get('idToSys',{}).items() 
                         if d.get('idToName',{}).get(k,'').upper() == 'LIVER'), 'N/A')
        print(f"  {fname:40s} zones={n_zones:3d} grid_len={len(grid):5d} LIVER_sys={liver_sys}")
    except Exception as e:
        print(f"  {fname}: ERROR {e}")
