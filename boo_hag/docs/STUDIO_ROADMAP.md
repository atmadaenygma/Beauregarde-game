# STUDIO ROADMAP — Dialogue & Level Construction Kit

**Goal:** upgrade studio.html into a full construction kit for dialogue and levels,
in the vein of Disco Elysium / Shadowrun authoring.
**References:** LR pill-node user-flow map (reading clarity) + color-coded chatbot
flow (role semantics, legend, annotations).

Decisions locked with the designer:
- Tree reads **left → right**
- Node color = **who is speaking** (speaker/role), mechanical type becomes a badge
- **Levels = locations** — the places dialogue happens in (diner, shed, highway…)
- **Ink import comes early** — cold_open.ink / scene_2_shed.ink become the practice sample

---

## Phase 1 — Visual overhaul (the reference look)

1. **Left→right tidy-tree layout.** Depth = x-axis, siblings stack on y.
   Subtree-aware spacing (no overlaps), deterministic ordering.
2. **Compact pill nodes with semantic zoom.** Zoomed out: auto-width pill showing
   speaker color + first ~40 chars. Zoomed in past threshold (or selected):
   full card with text, media, options. One codepath, CSS-driven.
3. **Rounded elbow connectors.** Orthogonal routing with corner radii like the
   reference; edges leave the node's right edge, enter target's left edge.
   Labels (option text, TRUE/FALSE) sit on the horizontal run.
4. **Speaker/role color system + legend.**
   - `speaker` field on every node: `npc` / `player` / `inner` (internal voice,
     narration) / `check` (skill/condition) / `system` (var set, transition)
   - Fixed palette, floating legend widget in the canvas corner
   - Claude's NODE_JSON protocol gains `"speaker"`; system prompt updated
   - Mechanical type (NARRATION/CHOICE/…) shrinks to a small badge on the pill

## Phase 2 — Ink importer

- Parse `.ink`: knots (`=== x ===`), stitches (`= y`), choices (`* [..]`),
  diverts (`-> x`), var ops (`~ calm = 20`), conditionals (`{ calm >= 20: ... }`),
  comments → design notes.
- Import `ink/cold_open.ink` and `ink/scene_2_shed.ink` as scenes — this is the
  practice/sample content for the new tree.
- Round-trip check: import → export should produce structurally equivalent ink.

## Phase 3 — Locations layer (levels)

- **LOCATIONS registry** in the store: id, name, description, region,
  background art slot (media), ambient notes.
- Every **scene is assigned a location**; nodes inherit it.
- **LOC tab** in the Game Bible sidebar: add/edit locations, see which scenes
  play there.
- STORY view can group/badge scenes by location; SCENE_TRANSITION nodes show
  the location change ("diner → highway shoulder").
- Locations feed Claude's context block so it writes location-aware dialogue.

## Phase 4 — Disco Elysium mechanics

- **HUB node type** — conversation hub; exhausted options gray out; loop-back
  edges render as distinct dashed return arcs, not spaghetti.
- **Collapsible subtrees** — collapse a branch into its head pill with a count.
- **CHECK node type** — skill check with white (retryable) / red (one-shot)
  semantics: variable/skill, difficulty, success → / failure → branches.
  PLAY view rolls or thresholds it; TREE renders it diamond-flagged.

## Phase 5 — Quest layer

- **QUEST entities**: id, name, description, objectives[], state
  (inactive / active / complete / failed), location links.
- QUESTS tab in sidebar; nodes that advance an objective get a quest badge.
- PLAY view shows a quest log; consequences (FX) can update quest state.

## Phase 6 — Frames & annotations

- SECTION_LABEL becomes a **frame** — a soft rectangle visually containing its
  nodes (like "I. THE ROAD" boxing its stretch), with playable/cutscene marker.
- **Sticky notes** — free-floating annotation cards (the red "optional steps"
  boxes in the reference).
- **END terminals** — explicit black END pills instead of dangling arrows.

---

## Order of work

Phase 1 → 2 land together as "the new tree" (visual + real content).
Phase 3 next (locations unblock quest + Claude context).
Phases 4–6 in that order unless play-testing reorders them.
