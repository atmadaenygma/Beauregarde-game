# BEAUREGARDE CONSTRUCTION KIT — MASTER GUIDE

> **Recovery reference.** This file documents how the Construction Kit and the game
> connect. If the kit ever breaks, gets reverted, or needs rebuilding, this is the
> source of truth for how every system is *supposed* to work. Keep it in sync with the
> in-app guide (the ◉ GUIDE button).

- **Kit file:** `project/construction_kit.html` — node editor (React via Babel-in-browser, single file)
- **Game file:** `project/Beauregarde Quest 1.html` — the game itself
- **Bridge:** `project/beauregarde_data.json` — exported by the kit, loaded by the game at startup

---

## 1. THE BIG PICTURE

The kit is a **node-based editor**. You build the game's content as nodes on canvases,
wire them together with typed ports, then **EXPORT TO GAME**, which writes
`beauregarde_data.json`. The game loads that file on boot and merges it over its
hardcoded defaults. If the JSON is missing, the game uses its built-in defaults.

```
construction_kit.html  ──EXPORT──▶  beauregarde_data.json  ──fetch on load──▶  Beauregarde Quest 1.html
```

**Design principle (do not violate):** few node types, rich fields, one universal
condition/effect grammar driven by VARIABLES. New gameplay = new *variables and
fields*, NOT new node types and NOT new game code.

---

## 2. CANVAS BASICS

- **Master canvas** — top-level world graph: characters, quests, scenes, levels, items.
- **Sub-canvases** — characters, dialogue trees, and quests each have their own inner
  canvas. Open with the **↗** button on a node header, or double-click. Navigate back
  with the breadcrumb bar.
- **Wiring** — drag a port dot to another port dot. Ports are colour-typed; mismatched
  types won't connect. Click a connected input dot to disconnect.
- **Pan/zoom** — scroll to zoom, middle-click or Alt+drag to pan.
- **Edit a node** — double-click it (opens its popover) or use the right-click menu.
- **Graph tabs** — each master tab is a separate canvas. Use multiple for organisation.
- Everything auto-saves to `localStorage` (`beauregarde_kit_v4`). **SAVE** forces it.

---

## 3. SYSTEMS & SIDEBAR SECTIONS

Each sidebar section has a **?** badge that expands an inline tip.

| Section | What it is |
|---|---|
| NODE GRAPHS | All master canvases (tabs). |
| OCTAVIA | The protagonist node. |
| CHARACTERS | Every NPC. Profile, trust, alignment, combat, loot, portrait, 360 video. |
| DIALOGUE TREES | Conversations. Each is its own node graph. |
| GAME DIALOGUE | Override hardcoded game conversation keys (✓ = kit version exists). |
| QUESTS | Quest metadata + step graph + world wiring. |
| ITEMS | Item registry — every key item, referenced everywhere. |
| **VARIABLES** | **The world's memory — flags, ints, enums, keywords. (see §7)** |
| TOOLS | SCENE, SPAWN_POINT, INVENTORY, TRIGGER, ITEM, LEVEL drag-out nodes. |
| NODE LIBRARY | Every node placed across all graphs, re-draggable. |

---

## 4. NODE TYPES

**Master canvas:** OCTAVIA, CHARACTER, QUEST, DIALOGUE_TREE, SCENE, SPAWN_POINT,
INVENTORY, TRIGGER, ITEM, LEVEL_CONNECTOR.

**Dialogue sub-canvas:** STATEMENT, QUESTION, THOUGHTS, ITEMS, OUTFIT_CHECK, LOOP,
DEAD_END, END_CONVO.

**Quest sub-canvas:** QUEST_INFO (root), QUEST_STEP, QUEST_COLLECTABLE,
QUEST_CONDITION, QUEST_END.

**Character sub-canvas:** CHAR_DETAIL, CHAR_DIALOGUE_REF, CHAR_QUEST_REF.

Port colours: character `#40c080`, dialogue `#c47a10`, quest `#d4a020`, place `#4080c0`,
flow `#7a7090`, item `#a06890`, trigger `#e05030`, exit `#e0a020`.

---

## 5. SCENE NODE — POPOVER TABS

The SCENE node's popover (`ScenePopover`) shows up to four tabs depending on
the scene's settings:

- **INFO** — always shown. Scene ID (dropdown of `KNOWN_SCENES`),
  atmosphere/fog text, Octavia spawn `worldX`, optional trigger `worldX`,
  **SCENE TYPE** (neutral / store / combat / elevator — elevator adds a FLOOR
  field), **MUSIC CUE** (pick from the audio registry), and **SCENE MODE**
  (map / cinematic).
- **CHARACTERS** — always shown. Per-character `worldX` spawn; alignment is
  read-only, taken from the character's own profile.
- **STORE** — shown only when SCENE TYPE = store. See below.
- **VIDEO** — shown only when SCENE MODE = cinematic. See below.

### STORE tab — SHOPPING MODE
Pick how the player buys here (`storeMode`):
- **POINT & CLICK** (`pointclick`) — items sit on screen at `x`/`y`; the
  player hovers a shelf item → popover → add to cart (StoreBrowse).
- **TALK TO CLERK** (`clerk`, default) — dialogue-driven purchase menu
  (pharmacy-style). Each item has a `location`: `counter` (stealable) or
  `clerk` (NPC-held), plus a `worldX`.
- **BOTH** — both interaction styles; fill in all fields per item.

Every store item also has a **PRICE** (`price`, integer).

### VIDEO tab — cinematic scenes
Shown when SCENE MODE = cinematic:
- **VIDEO — REGULAR** (`cinematicClips.cyber_octavia`) and **VIDEO — HOODIE**
  (`cinematicClips.hoodie`, falls back to the regular clip if blank) — one
  video file per outfit.
- **VIDEO CUES** (`cinematicCues[]`) — named time ranges `{name, from, to}` in
  seconds (use DevTools: pause the video, read `video.currentTime`).
  `from === to` holds on that frame.

> ⚠ **Not yet wired to export.** `storeMode`, `sceneMode`, `cinematicClips`,
> `cinematicCues`, and the per-scene `musicCue` are saved on the SCENE node
> (and persist via `localStorage`/kit save) but **EXPORT TO GAME currently does
> not copy them into `scenesOut`** — they don't reach `beauregarde_data.json`
> yet. `storeItems[]` (with `price`/`location`/`worldX`/`x`/`y`) IS exported,
> since it's passed through as-is. Until the export mapping is updated, the
> game can't read SCENE MODE, cinematic clips/cues, shopping mode, or
> per-scene music cues.

---

## 6. MEDIA / FILE PATHS

Any media field (portraits, HUD icons, level backgrounds, masks, 360 videos) uses the
**MediaPicker**. Paste a full Windows path, e.g.:

```
L:\Beauregarde_game\underneath\graphics\characters\cyberOctavia\cyber_octavia_360.webm
```

The kit auto-converts it to a relative path the game can load
(`../graphics/characters/cyberOctavia/cyber_octavia_360.webm`) and shows a live preview.
The **📁** button opens a picker for visual confirmation only — you still paste the path.

- **Portrait** (PNG/JPEG) → HUD people grid
- **Portrait 360** (WebM) → HUD detail view, mouse-scrub
- **Item icon** (PNG) → HUD inventory tab
- **Level background / mask** (PNG/JPEG)

---

## 7. VARIABLES — THE CORE OF SCALE

**This is the most important system.** It is what makes a large reactive narrative
possible without the game growing new code for every story beat.

### Types
- **flag** — boolean. `told_raymond_about_collette`, `met_charlie`, `chose_violence`.
- **int** — number. `bureau_suspicion`, `signal_fragments`. Compare `≥ > ≤ < = ≠`.
- **enum** — one of named states. `faction_standing` = ally / neutral / hostile.
- **keyword** — a topic Octavia collects and can ask anyone about (Shadowrun-style). A
  flag with reach.

### Authoring flow
1. **VARIABLES** sidebar → **+ ADD**. Name in snake_case, pick type + initial value.
2. In a dialogue tree's **PLAY CONDITIONS**, add a condition of type **VAR**, choose the
   variable and the test (e.g. `bureau_suspicion ≥ 3`).
3. The game evaluates it against one shared state object, `window.__beau_vars`.

### The runtime contract (how the game reads them)
- On load, the game seeds `window.__beau_vars[key] = initial` for every exported var
  (existing session values are preserved, never overwritten).
- Keywords with `initial:true` also go into `window.__beau_keywords` (a Set).
- The condition evaluator (`window.evalTriggerConditions`) handles a `var` condition with
  **one generic branch** — it never needs editing when you add variables:
  ```js
  // c = {type:'var', varKey, op, value, negate}
  // ops: is_true, is_false, eq, neq, gte, gt, lte, lt
  ```
- Scenes/scripts mutate vars with `window.setVar(key, value)` and read with
  `window.getVar(key)`.

> **Effects** (dialogue choices that *set* variables) are the next planned step (#2 on the
> roadmap). For now, set variables from scene scripts via `window.setVar`.

---

## 8. CONDITION GRAMMAR

Conditions live on a dialogue tree's PLAY CONDITIONS (per-tree for now; per-option is
roadmap #2). Every condition is `{id, negate, type, ...}`:

| type | fields | meaning |
|---|---|---|
| `var` | `varId` (kit) → `varKey` (export), `op`, `value` | generic variable test |
| `outfit` | `value` | current outfit matches |
| `item` | `value` (item key) | item in inventory |
| `trust` | `charId`, `op` (gte/lt), `value` | NPC trust threshold |
| `scene` | `value` | scene has been visited |
| `quest` | `questId`, `questState` (complete/active/locked) | quest status |

`negate` flips the result. All conditions in a tree must pass (AND).

**On export**, `var` conditions get a stable `varKey` attached (the kit stores `varId`
internally, but the game looks up by the permanent snake_case key).

---

## 9. QUESTS (three layers)

1. **Metadata** (always exports): name, major/minor, category, status, progress (HUD
   status line), description (HUD info paragraph). Plus **item gates**: `requiredItems`
   (must hold to unlock) and `rewardItems` (granted on completion).
2. **World wiring** (master canvas): wire the QUEST node — `ASSIGNED BY` (← character),
   `DIALOGUE` (→ tree), `SCENE` (→ scene), `NEXT QUEST` (→ quest). Exports as
   `assignedBy`, `linkedDialogue`, `linkedScene`, `nextQuest`.
3. **Step graph** (quest sub-canvas): `QUEST_INFO` root → `QUEST_STEP`s → `QUEST_END`.
   Branch with `QUEST_CONDITION`, pick-ups via `QUEST_COLLECTABLE`. Exports as an ordered
   `steps` array (BFS-serialised).

The HUD renders status (colour-coded), progress, the step checklist, REQUIRES (when
locked), and REWARDS.

---

## 10. EXPORT — `beauregarde_data.json` SCHEMA

```jsonc
{
  "people":  [{ id, name, role, handle, status, portrait, portrait360,
                info, discovered, category, trust, tags, alignment,
                enemyType, hitPoints, lootable, lootItems,
                pickpocketable, pickpocketItems, caughtConsequence }],
  "quests":  { "major":[…], "minor":[…] },   // each: id,name,status,progress,info,
             //   category, assignedBy, linkedScene, linkedDialogue, nextQuest,
             //   requiredItems[], rewardItems[], steps[]
  "dialogue":{ "<slug>": { id,name,treeType,outfitCondition,
                           nodes[], playCount, playLimit, conditions[] } },
  "scenes":  [{ id,name,atmosphere,sceneType,octaviaWorldX,elevatorFloor,
                chars[], storeItems[], dialogueTrigger }],
             //   storeItems[] entries: {name,price,location,worldX,x,y} per
             //   the STORE tab's SHOPPING MODE (§5). storeMode, sceneMode,
             //   cinematicClips, cinematicCues, and per-scene musicCue are
             //   authored in the kit but NOT in this export yet (§5).
  "spawns":  [{ id, charId, worldX }],
  "levels":  { "<name>": { background, mapWidth, mapHeight, scale, sceneType,
                           atmosphere, musicCue, playerSpawn, npcSpawns[], exits[] } },
  "items":   [{ id,name,key,category,unique,description,source,icon,restore,equippable }],
  "vars":    [{ id,key,name,type,category,initial,enumValues[],description }],
  "outfits": [{ id,label,badge,color }],
  "audio":   [{ id,label,file,type,loop }]
}
```

### How the game merges it (loader in `Beauregarde Quest 1.html`)
- `people` → replaces `PEOPLE_DB`; seeds `window.__beau_trust` from `trust`.
- `quests` → replaces `QUESTS_DB` buckets, preserving gates/steps/wiring.
- `items` → merged into `ITEM_DEFS` (kit items become real inventory items).
- `vars` → seeds `window.__beau_vars` (+ `window.__beau_keywords`).
- `dialogue` → merged into `CONV` (kit trees override hardcoded; outfit variants keyed `__<outfit>`).
- `scenes` → builds `window.__beau_scene_triggers` (scene → dialogue trigger map).

---

## 11. AI ASSISTANT (✦ AI)

- Slide-in panel. Needs an Anthropic API key (stored in localStorage only).
- **REFERENCES** tab: upload `.txt/.md/.csv` (excerpted into context) or `.pdf` (sent
  natively, read in full). All saved to a local IndexedDB library.
- **HISTORY** tab: every chat auto-saves; restore or delete past sessions.

---

## 12. CUTSCENE SYSTEM

Cutscenes are dialogue trees with `treeType:'cutscene'`. Create one by:
1. Adding a Dialogue Tree in the sidebar and cycling its badge (type) to **C** (CUTSCENE).
2. Opening it with ↗ to enter the cutscene sub-canvas.
3. Placing **CUT_START** first (the entry point), then chaining nodes.

### Node types

| Node | Purpose |
|---|---|
| `CUT_START` | Entry point. Sets default background colour or looping video. |
| `CUT_LINE` | A spoken or narrated line. Speaker + voice channel colour + text. |
| `CUT_CHOICE` | Up to 3 player options, with muted (greyed-out lore) support. |
| `CUT_VIDEO` | Full-screen or background video clip. |
| `CUT_TITLE` | Full-screen title card (e.g. "THE VEIL — 4:17 AM"). |
| `CUT_WAIT` | Timed pause — holds the current frame. |
| `CUT_ACTION` | Fires a game event: goto_scene, set_var, play_music, wake, etc. |

### Effects (all dropdowns, grouped by category: basic / cinematic / unusual)

**Text effects** (16): Instant, Typewriter, Fade In, Word by Word, Glitch, Data Scramble,
Flicker, Declassified (redacted wipe), Broadcast Static, Echo, Whisper, Corruption,
Slide Up, Slide Left, Zoom In, Condense.

**Video effects** (15): Cut, Fade from Black, Burn In, Dissolve, VHS Glitch, Static/Snow,
Zoom Punch, Film Grain, Desaturate, CRT Scanlines, Vignette, Chromatic Aberration,
Pixelate Dissolve, Iris, Venetian Blind.

**Fade/transition effects** (20): None, Fade to Black, Fade from Black, Fade to White,
Fade from White, Flash, Cross-Fade, Dip to Color, Blur Out, Blur In, Static Burst Cut,
Glitch Cut, Iris Close, Iris Open, Venetian Blind Close, Swipe Left, Swipe Right, Shatter.

### Presets (★ SAVE PRESET)

In any node's editor, click **★ SAVE PRESET**, name it, and it appears in the **PRESETS**
accordion in the cutscene sidebar. Drag or click to place a copy instantly. Delete with ✕.
This is how you build a library of favourite node configurations for reuse across scenes.

### Export

Cutscenes export under `"cutscenes"` in `beauregarde_data.json`:
```jsonc
"cutscenes": {
  "opening": {
    "nodes": [
      {"id":"n1","type":"start","background":"#060a08"},
      {"id":"n2","type":"line","speaker":"FEAR","voiceChannel":"FEAR",
       "text":"Sound: water. Loud. Cold.","textEffect":"glitch","autoAdvance":0,"next":"n3"},
      {"id":"n3","type":"choice","opts":[{"t":"Where.","next":"n4"},{"t":"(Not yet.)","next":"n4","muted":true}]},
      {"id":"n4","type":"action","action":"wake"}
    ]
  }
}
```

The game reads this with a `CutscenePlayer` component (planned) that walks the node array
using the same `next` pointer system as dialogue trees, using the existing typewriter,
glitch, fade, and video rendering already built into the game.

---

## 13. ROADMAP (agreed direction)

The goal: Disco Elysium-scale conversations + Shadowrun-style keyword questing, kept
minimalist. Order matters — each depends on the last.

1. ✅ **Variable / flag system + condition grammar**
2. ✅ **Cutscene system** — 7 node types, 47 effects, presets, export
3. **CutscenePlayer component in game** — walk the JSON, replace hardcoded Opening/Nightmare
4. **Per-option & per-statement conditions + effects** (DE skill-voice lines, gated
   replies, choices that *set* variables)
5. **CHECK node** (White/Red skill checks, difficulty, modifiers) — the DE core
6. **Inline text editing in dialogue nodes + Tab-to-create** (authoring at scale)
7. **Viewport culling + memo** (10× node capacity)
8. **List/outline view toggle** (writing prose at volume)
9. **Generalise OUTFIT → Thoughts/modifiers**; retire absorbed node types

> When tempted to add a node type, ask: *"Is this a new field or condition on an existing
> node?"* Usually yes. The tool should get **smaller** as it gets more capable.
