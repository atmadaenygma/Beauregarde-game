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
| **VARIABLES** | **The world's memory — flags, ints, enums, keywords. (see §6)** |
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

## 5. MEDIA / FILE PATHS

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

## 6. VARIABLES — THE CORE OF SCALE

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

## 7. CONDITION GRAMMAR

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

## 8. QUESTS (three layers)

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

## 9. EXPORT — `beauregarde_data.json` SCHEMA

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

## 10. AI ASSISTANT (✦ AI)

- Slide-in panel. Needs an Anthropic API key (stored in localStorage only).
- **REFERENCES** tab: upload `.txt/.md/.csv` (excerpted into context) or `.pdf` (sent
  natively, read in full). All saved to a local IndexedDB library.
- **HISTORY** tab: every chat auto-saves; restore or delete past sessions.

---

## 11. ROADMAP (agreed direction)

The goal: Disco Elysium-scale conversations + Shadowrun-style keyword questing, kept
minimalist. Order matters — each depends on the last.

1. ✅ **Variable / flag system + condition grammar** ← *this update*
2. **Per-option & per-statement conditions + effects** (DE skill-voice lines, gated
   replies, choices that *set* variables)
3. **CHECK node** (White/Red skill checks, difficulty, modifiers) — the DE core
4. **Inline text editing in dialogue nodes + Tab-to-create** (authoring at scale)
5. **Viewport culling + memo** (10× node capacity)
6. **List/outline view toggle** (writing prose at volume)
7. **Generalise OUTFIT → Thoughts/modifiers**; retire absorbed node types

> When tempted to add a node type, ask: *"Is this a new field or condition on an existing
> node?"* Usually yes. The tool should get **smaller** as it gets more capable.
