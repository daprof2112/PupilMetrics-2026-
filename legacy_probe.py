from pathlib import Path
from PIL import Image
import numpy as np

ROOT = Path(r"legacy/iridosoft_raw/Data")
OUT = Path(r"legacy/probe_output")
OUT.mkdir(parents=True, exist_ok=True)

def read_bytes(p):
    b = p.read_bytes()
    print(f"{p.name}: {len(b)} bytes")
    print(" first 32 bytes:", b[:32].hex(" "))
    return b

def try_decode_512x512(payload: bytes, out_png: Path):
    # try as 8-bit grayscale raw
    if len(payload) >= 512 * 512:
        arr = np.frombuffer(payload[:512*512], dtype=np.uint8).reshape((512, 512))
        Image.fromarray(arr, mode="L").save(out_png)
        print(f"  saved grayscale: {out_png}")

def try_decode_bitmask(payload: bytes, out_png: Path):
    # try as 1-bit packed bitmap 512x512 => 512*512/8 = 32768 bytes
    need = 512 * 512 // 8
    if len(payload) >= need:
        bits = np.unpackbits(np.frombuffer(payload[:need], dtype=np.uint8))
        arr = (bits[:512*512].reshape((512, 512)) * 255).astype(np.uint8)
        Image.fromarray(arr, mode="L").save(out_png)
        print(f"  saved bitmask: {out_png}")

def probe(name):
    lev = ROOT / f"{name}.LEV"
    pr  = ROOT / f"{name}.PR"
    if not lev.exists() or not pr.exists():
        print(f"Missing {name}.LEV/.PR")
        return

    b_lev = read_bytes(lev)
    b_pr  = read_bytes(pr)

    # Try whole-file decode
    try_decode_512x512(b_lev, OUT / f"{name}_LEV_gray_whole.png")
    try_decode_512x512(b_pr,  OUT / f"{name}_PR_gray_whole.png")
    try_decode_bitmask(b_lev, OUT / f"{name}_LEV_mask_whole.png")
    try_decode_bitmask(b_pr,  OUT / f"{name}_PR_mask_whole.png")

    # Try skipping small headers (common legacy pattern)
    for skip in [16, 18, 32, 64, 128, 256, 512, 1024]:
        if len(b_lev) > skip:
            try_decode_512x512(b_lev[skip:], OUT / f"{name}_LEV_gray_skip{skip}.png")
            try_decode_bitmask(b_lev[skip:], OUT / f"{name}_LEV_mask_skip{skip}.png")
        if len(b_pr) > skip:
            try_decode_512x512(b_pr[skip:], OUT / f"{name}_PR_gray_skip{skip}.png")
            try_decode_bitmask(b_pr[skip:], OUT / f"{name}_PR_mask_skip{skip}.png")

if __name__ == "__main__":
    for family in ["VELH", "ANGR", "DECK", "ENSN"]:
        print("\n=== probing", family, "===")
        probe(family)

    print("\nDone. Check files in legacy/probe_output/")
