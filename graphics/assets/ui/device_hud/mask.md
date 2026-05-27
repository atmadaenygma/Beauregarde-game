# MASK
# Asset Type: UI Overlay (Handheld Device HUD)
# Asset ID: device_hud_frame
# Parent: assets/ui

## Source
# device_frame.png — cracked tactical PDA frame, transparent cutouts where screens go
# Natural Size: 1984 x 2126 px
# Rendered Size: 430 x 461 px (centered in 1280x720 viewport, scales w/ overall game scale)

## Companion File: smartphone_mask_black_white.png
# 1984 x 2126 px black/white image. White pixels = content allowed,
# black pixels = no content. Applied at runtime as a CSS mask on the
# HUD content layer so anything that overflows the screen regions is
# clipped automatically.

## Screen Cutout Regions (auto-detected from mask via python/PIL)
## In rendered-size coordinates (430 x 461 device container)
# - id: top_screen
#   left: 56,  top: 30,  width: 321, height: 167
#   original-image bounds: x 257-1736, y 139-908
#   Use: home screen icon grid, app content (THREADS/PEOPLE/INVENTORY/INTEL list)
#
# - id: bottom_screen
#   left: 53,  top: 263, width: 330, height: 173
#   original-image bounds: x 244-1766, y 1215-2011
#   Use: detail panel for selected list item

## Anchoring (in 1280x720 viewport coordinates)
# Position: bottom-centered
# Container: left=425, top=20, width=430, height=680
# Render order: zIndex 500 (above blur overlay at zIndex 499, below debug HUD at 600)

## Animation
# Open:  hudSlideUp + hudFadeIn  (0.4s ease-out)
# Close: hudSlideDown + hudFadeOut (0.4s ease-in)

## Referenced In
# project/Beauregarde Quest 1.html
#   - const DEVICE_HUD_IMG  (line ~43)
#   - function DeviceHUD    (line ~2204)

## Notes
# - Frame PNG is purely decorative; all interactive content is rendered as React DOM
#   beneath it (the frame sits on top with pointerEvents:none).
# - Screen cutout coords were eyeballed from the frame; recalibrate after any frame
#   redesign so content lines up with the cracked-glass openings.
