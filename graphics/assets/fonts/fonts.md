# FONTS
# Asset Type: Typography System
# Asset ID: beauregarde_fonts
# Parent: assets/

## Primary Font: Blue Screen Personal Use

**Source:** Local file (`Blue Screen Personal Use.ttf`)  
**License:** Personal Use  
**Usage:** ALL UI text (HUD, dialogue, prompts, labels, debug menu, dialogue stamps)

### Font Loading
```css
@font-face {
  font-family: 'Blue Screen';
  src: url('../graphics/assets/fonts/Blue Screen Personal Use.ttf') format('truetype');
  font-weight: normal;
}
```

### Font Stack
```css
font-family: 'Blue Screen', monospace;
```

---

## Font Usage by Component

| Component | Font | Weight | Size | Color |
|-----------|------|--------|------|-------|
| HUD Tab Labels | Space Mono | 400 | 7px | C.text or C.gold (active) |
| HUD Item Names | Space Mono | 400 | 8px | C.text |
| HUD Detail Panel Header | Space Mono | 700 | 10px | C.gold |
| HUD Detail Panel Body | Space Mono | 400 | 7px | C.dim |
| Dialogue Text | Space Mono | 400 | 10px | C.text |
| Dialogue Speaker | Space Mono | 700 | 11px | C.gold |
| [E] Interact Prompt | Space Mono | 400 | 9px | C.gold |
| MoneyHUD / HeartHUD | Space Mono | 700 | 12px | C.text |
| Debug Menu | Space Mono | 400 | 8px | C.dim |
| Scene Titles (Interior/Exterior) | Space Mono | 700 | 16px | C.text |
| Thought Bubbles | Space Mono | 400 | 9px | C.gold |

---

## Local Font Files (Optional)

If self-hosting is needed:
- Place `.woff2`, `.ttf`, or `.otf` files in this directory
- Update import path in HTML to reference local files instead of CDN

```css
@font-face {
  font-family: 'Space Mono';
  src: url('space-mono-regular.woff2') format('woff2');
  font-weight: 400;
}
@font-face {
  font-family: 'Space Mono';
  src: url('space-mono-bold.woff2') format('woff2');
  font-weight: 700;
}
```

---

## Referenced In

- `project/Beauregarde Quest 1.html` — All UI rendering (HUD, dialogue, prompts, debug)
- `project/Beauregarde.html` — Title screen (if used)
- `project/Beauregarde Threads.html` — Thread viewer UI
- `project/Beauregarde Quest Editor.html` — Editor interface

---

## Design Notes

**Why Space Mono:** Monospace + geometric design fits the cyberpunk aesthetic. High legibility at small sizes (5–12px). Works well with the cool teal/green UI palette and noir visual tone.

**Letter spacing:** Most HUD text uses `letterSpacing: 1–3px` for a more technical feel. Dialogue uses `letterSpacing: 0.5px` for natural flow.

**Line height:** HUD lists use compact line-height (1.2–1.4). Dialogue panels use relaxed line-height (1.6) for readability.

---

## Future Customization

The SYS tab will eventually support font selection. Candidates for future inclusion:
- IBM Plex Mono (technical alternative to Blue Screen)
- JetBrains Mono (developer-oriented)
- Roboto Mono (clean, neutral)
- Courier Prime (typewriter aesthetic)
- Space Mono (clean monospace fallback)

To add a new font preset:
1. Add font file(s) to this directory
2. Define a FONT_PRESETS object paralleling COLOR_PRESETS and HUD_SIZE_PRESETS
3. Add @font-face rules for new fonts
4. SYS tab automatically lists presets and shows active font
5. Runtime switching via CSS variables or React Context (same pattern as colors)
