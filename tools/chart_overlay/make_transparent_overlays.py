from pathlib import Path
from PIL import Image
import numpy as np

# -------- CONFIG --------
# Source folder containing original probe output files (whole variants)
SRC_DIR = Path(r"C:\_IridoApp_October\ai_eye_capture_oct\legacy\probe_output")

# Output folder for Flutter assets
OUT_DIR = Path(r"C:\_IridoApp_October\ai_eye_capture_oct\assets\charts")

# Map output name -> source filename (edit these to match your actual files)
MAPPING = {
    "jensen_od_mask.png": "DECK_PR_gray_whole.png",
    "jensen_os_mask.png": "DECK_LEV_gray_whole.png",
    "velchover_od_mask.png": "VELH_PR_gray_whole.png",
    "velchover_os_mask.png": "VELH_LEV_gray_whole.png",
}
# White-background removal threshold (higher => more removed)
WHITE_THRESH = 235

# Keep dark lines; convert near-black to white line with alpha
LINE_THRESH = 180
# ------------------------


def to_transparent_overlay(src_path: Path, out_path: Path):
    img = Image.open(src_path).convert("RGBA")
    arr = np.array(img)

    r = arr[:, :, 0].astype(np.uint8)
    g = arr[:, :, 1].astype(np.uint8)
    b = arr[:, :, 2].astype(np.uint8)

    # 1) Remove near-white background
    is_bg = (r >= WHITE_THRESH) & (g >= WHITE_THRESH) & (b >= WHITE_THRESH)

    # 2) Detect line-like dark content
    lum = (0.299 * r + 0.587 * g + 0.114 * b).astype(np.uint8)
    is_line = lum <= LINE_THRESH

    out = np.zeros_like(arr, dtype=np.uint8)
    # white line color (UI will tint anyway)
    out[:, :, 0] = 255
    out[:, :, 1] = 255
    out[:, :, 2] = 255

    # alpha: keep dark lines, remove background
    alpha = np.where(is_line & (~is_bg), 255, 0).astype(np.uint8)
    out[:, :, 3] = alpha

    out_img = Image.fromarray(out, mode="RGBA")
    out_img.save(out_path)
    print(f"[OK] {src_path.name} -> {out_path}")


def main():
    OUT_DIR.mkdir(parents=True, exist_ok=True)

    for out_name, src_name in MAPPING.items():
        src = SRC_DIR / src_name
        dst = OUT_DIR / out_name
        if not src.exists():
            print(f"[MISS] Source not found: {src}")
            continue
        to_transparent_overlay(src, dst)

    print("\nDone. Generated files are in:", OUT_DIR)


if __name__ == "__main__":
    main()