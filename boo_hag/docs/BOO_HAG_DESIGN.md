# BOO HAG — DESIGN DOCUMENT

**Status:** IN PROGRESS
**Separate from:** /project/ (Beauregarde/Octavia game)

## Game Overview

Protagonist: unnamed boo hag — possibly Bureau experiment, possibly folkloric, never resolved.
World: rural Louisiana → Beauregarde city. Gullah Geechee cultural foundation.
Core loop: ride / skin / feed / survive / investigate.

## Folder Structure

```
boo_hag/
├── index.html            entry point
├── scenes/               one HTML file per scene
├── ink/                  dialogue scripts (.ink source files)
├── characters/           character bibles (YAML, authoring reference only)
├── docs/                 design documents (this folder)
├── graphics/
│   ├── characters/       protagonist forms, NPCs
│   ├── backgrounds/      scene art
│   └── ui/               HUD, prompts, overlays
├── audio/
│   ├── music/
│   └── sfx/
└── uploads/              working assets / references
```

## Key Design Decisions

See session notes in Claude memory:
- boo_hag_dialogue_style.md — protagonist voice
- project_boo_hag_origin_ambiguity.md — never resolve her true nature
- project_dialogue_authoring_workflow.md — Ink + React, zero runtime AI

## Cold Open — Five Sections

I.   THE ROAD     — cutscene. Bureau truck, crash, two dead men.
II.  THE HUNT     — playable. Hag form tutorial. Float/walk movement.
III. THE ROOM     — the kill and molt. Taking the face.
IV.  THE LEAVING  — walks the body out to sirens.
V.   THE DINER    — fed, clearing, cops arrive. Three-branch fork: RUN / SHED / GO.

## Consciousness Tiers (protagonist voice grades as sanity rises)

Feral    → no words, instinct only
Waking   → groping for language, wrong analogies
Clear    → full sentences, still sparse
Griotte  → authoritative, ancestral register
