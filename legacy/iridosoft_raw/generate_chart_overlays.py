#!/usr/bin/env python3
"""Generate transparent iridology chart overlay PNGs + metadata manifest.

Usage:
  python tools/chart_overlay/generate_chart_overlays.py --out assets/overlays --size 2048
"""
from __future__ import annotations

import argparse
import json
import math
from dataclasses import dataclass
from pathlib import Path

try:
    from PIL import Image, ImageDraw
except Exception as exc:  # pragma: no cover
    raise SystemExit(
        "Pillow is required. Install with: pip install pillow\n"
        f"Import error: {exc}"
    )


@dataclass(frozen=True)
class ChartSpec:
    name: str
    sectors: int
    blocks: int


SPECS = [
    ChartSpec(name="Jensen", sectors=24, blocks=10),
    ChartSpec(name="Velchover", sectors=36, blocks=14),
]


def draw_chart(spec: ChartSpec, size: int) -> tuple[Image.Image, dict]:
    cx = cy = size // 2
    r = int(size * 0.45)

    img = Image.new("RGBA", (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)

    stroke = (255, 255, 255, 190)
    ring_radii = [1.0, 0.78, 0.56]

    # rings
    for rr in ring_radii:
        radius = r * rr
        draw.ellipse((cx - radius, cy - radius, cx + radius, cy + radius), outline=stroke, width=2)

    # sectors
    sectors_meta = []
    inner = r * 0.56
    for i in range(spec.sectors):
        angle = (2 * math.pi * i) / spec.sectors
        x1 = cx + math.cos(angle) * inner
        y1 = cy + math.sin(angle) * inner
        x2 = cx + math.cos(angle) * r
        y2 = cy + math.sin(angle) * r
        draw.line((x1, y1, x2, y2), fill=stroke, width=2)
        sectors_meta.append({
            "index": i,
            "start_deg": round((360 * i) / spec.sectors, 3),
            "end_deg": round((360 * (i + 1)) / spec.sectors, 3),
            "ring_inner_ratio": 0.56,
            "ring_outer_ratio": 1.0,
        })

    # decorative blocks
    block_stroke = (255, 255, 255, 165)
    blocks_meta = []
    for i in range(spec.blocks):
        angle = (2 * math.pi * i) / spec.blocks
        rr = r * 0.68
        bx = cx + math.cos(angle) * rr
        by = cy + math.sin(angle) * rr
        w = r * 0.1
        h = r * 0.06
        draw.rectangle((bx - w / 2, by - h / 2, bx + w / 2, by + h / 2), outline=block_stroke, width=2)
        blocks_meta.append({
            "index": i,
            "center_angle_deg": round(math.degrees(angle), 3),
            "radius_ratio": 0.68,
        })

    metadata = {
        "chart": spec.name,
        "size": size,
        "rings_ratio": ring_radii,
        "sectors": sectors_meta,
        "blocks": blocks_meta,
    }
    return img, metadata


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", type=Path, required=True, help="Output directory for PNG + JSON files")
    parser.add_argument("--size", type=int, default=2048, help="Square dimension in pixels")
    args = parser.parse_args()

    args.out.mkdir(parents=True, exist_ok=True)

    manifest = {"charts": {}}
    for spec in SPECS:
        image, metadata = draw_chart(spec, args.size)
        png_path = args.out / f"{spec.name.lower()}_overlay.png"
        json_path = args.out / f"{spec.name.lower()}_overlay.json"

        image.save(png_path)
        json_path.write_text(json.dumps(metadata, indent=2))

        manifest["charts"][spec.name] = {
            "png": png_path.name,
            "metadata": json_path.name,
        }

    (args.out / "chart_manifest.json").write_text(json.dumps(manifest, indent=2))
    print(f"Generated {len(SPECS)} overlays at: {args.out}")


if __name__ == "__main__":
    main()
