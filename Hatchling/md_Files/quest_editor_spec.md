# Hatchling Quest Editor — Redesign Spec
> Design reference for Figma prototype + implementation plan

---

## Overview

The Quest Editor is rebuilt as a **two-column tool**:

- **Left column** — Accordion selector. Browse and manage all entities (Characters, Places, Dialogue Trees, Quests). Clicking or dragging an item sends it to the right canvas as a node.
- **Right column** — Node connector canvas. Wire nodes together to build quest logic, dialogue flows, and place structures.

---

## Page Layout

```
┌─────────────────────────────────────────────────────────────────────┐
│  NAV BAR: HATCHLING QUEST EDITOR          [EXPORT TO GAME]  [···] │
├──────────────────────────┬──────────────────────────────────────────┤
│  LEFT COLUMN             │  RIGHT COLUMN                            │
│  (340px, fixed)          │  (flex, fills remaining width)           │
│                          │                                          │
│  ┌────────────────────┐  │  ┌──────────────────────────────────┐   │
│  │ ▼ CHARACTERS       │  │  │                                  │   │
│  │   [+ ADD]          │  │  │        NODE CANVAS               │   │
│  │   · Octavia        │  │  │        (pan / zoom)              │   │
│  │   · Raymond        │  │  │                                  │   │
│  │   · Diego          │  │  │   [ nodes appear here when       │   │
│  │   · Pharmacist     │  │  │     dragged / added from left ]  │   │
│  │   · ...            │  │  │                                  │   │
│  ├────────────────────┤  │  │                                  │   │
│  │ ▶ PLACES           │  │  └──────────────────────────────────┘   │
│  ├────────────────────┤  │                                          │
│  │ ▶ DIALOGUE TREES   │  │                                          │
│  ├────────────────────┤  │                                          │
│  │ ▶ QUESTS           │  │                                          │
│  └────────────────────┘  │                                          │
└──────────────────────────┴──────────────────────────────────────────┘
```

---

## Nav Bar

```
┌──────────────────────────────────────────────────────────────────────┐
│  ◈ HATCHLING QUEST EDITOR          [PALETTE ▾]  [EXPORT TO GAME]  │
└──────────────────────────────────────────────────────────────────────┘
```

- **EXPORT TO GAME** — writes current editor state to `hatchling_data.json` and immediately updates the game's character/quest data (replaces the old manual download flow)
- **PALETTE** — theme switcher (Void / Chalk / Northside / Chromakopia)

---

## Left Column — Accordion Sections

Each section is a collapsible accordion header. Only one can be open at a time. Items inside can be **dragged onto the canvas** or **clicked** to open a quick-edit form below the list.

---

### 1. CHARACTERS

> No changes to the data structure. The left column is just the display + entry point.

```
▼ CHARACTERS                              [+ ADD CHARACTER]
──────────────────────────────────────────
  ┌─────────────────────────────────────┐
  │  ◉ OCTAVIA           protagonist    │  ← drag to canvas
  │  ◉ RAYMOND           store clerk    │
  │  ◉ DIEGO             street vendor  │
  │  ◉ PHARMACIST        network med    │
  │  ◉ DR. CHEN          mod medic      │
  │  ◉ COLLETTE LEEKS    missing        │
  │  ◉ CHARLIE WINSTON   archivist      │
  │  ◉ [new character]   ...            │
  └─────────────────────────────────────┘
```

**[+ ADD CHARACTER]** — opens a new Character Node on the canvas pre-filled with empty fields.

**Character list item** — shows name + role. Click to open inline quick-view. Drag onto canvas to place as a **CHARACTER node**.

**Character node on canvas** (read reference — connect to quests/dialogue):
```
┌─────────────────────────┐
│  ◉ CHARACTER            │
│  ─────────────────────  │
│  Name: Raymond          │
│  Role: Store Clerk      │
│  Trust: 0 ──────── 4   │
│  Tags: [network] [food] │
│  ○──────────────────●   │  ← output port (drag to connect)
└─────────────────────────┘
```

---

### 2. PLACES

> Places use a **node creator** — each place is a parent node with child nodes for its sub-components.

```
▼ PLACES                                  [+ ADD PLACE]
──────────────────────────────────────────
  ┌─────────────────────────────────────┐
  │  ◈ Corner Store       retail        │
  │  ◈ Pharmacy           safe space    │
  │  ◈ Restaurant         community     │
  │  ◈ Alley Way          hidden        │
  │  ◈ Oakwood Arms       residential   │
  └─────────────────────────────────────┘
```

**Place parent node** — dropped on canvas, expands to show connectable child nodes:

```
┌──────────────────────────────────────┐
│  ◈ PLACE — Corner Store              │
│  Type: Retail / Community Hub        │
│  District: The Veil                  │
│  Access: Public                      │
├──────────────────────────────────────┤
│  CHILD NODES (attach below):         │
│  [SCENE] [SALABLE OBJECTS]           │
│  [PROPRIETOR] [DIALOGUE] [QUESTS]    │
└──────────────────────────────────────┘
```

**Place child node types:**

#### SCENE node
```
┌─────────────────────────┐
│  🎬 SCENE               │
│  ─────────────────────  │
│  Scene ID: corner_store │
│  Atmosphere: ...        │
│  Fog desc: ...          │
│  WorldX range: 0–2400   │
└─────────────────────────┘
```

#### SALABLE OBJECTS node
```
┌─────────────────────────┐
│  🛒 SALABLE OBJECTS     │
│  ─────────────────────  │
│  + Item name            │
│  + Price                │
│  + Category             │
│  [+ ADD ITEM]           │
└─────────────────────────┘
```

#### PROPRIETOR node
```
┌─────────────────────────┐
│  👤 PROPRIETOR          │
│  ─────────────────────  │
│  [ drag CHARACTER here ]│
│  Schedule: ...          │
│  Bark pattern: ...      │
└─────────────────────────┘
```
→ Drop a Character node onto this to link the NPC as the proprietor.

#### DIALOGUE node (place-level)
```
┌─────────────────────────┐
│  💬 DIALOGUE            │
│  ─────────────────────  │
│  [ drag DIALOGUE TREE ] │
│  Context: entering store│
│  Trigger: proximity     │
└─────────────────────────┘
```
→ Drop a Dialogue Tree node here to attach it to this place.

#### QUESTS node (place-level)
> Has its own sub-nodes:

```
┌─────────────────────────────────────┐
│  ◆ QUESTS (for this place)          │
│  ─────────────────────────────────  │
│  Sub-nodes:                         │
│  [SCENE] [COLLECTABLE] [DIALOGUE TREE] │
└─────────────────────────────────────┘
```

- **SCENE sub-node** — the scene context where the quest fires
- **COLLECTABLE sub-node** — an item that can be picked up as part of the quest
- **DIALOGUE TREE sub-node** — dialogue sequence that fires for this quest at this place

---

### 3. DIALOGUE TREES

> Full dialogue flow builder. Each tree has a canvas of connected nodes.

```
▼ DIALOGUE TREES                          [+ NEW TREE]
──────────────────────────────────────────
  ┌─────────────────────────────────────┐
  │  💬 Raymond — First Meeting         │
  │  💬 Diego — Food Offer              │
  │  💬 Pharmacist — Safe Space Intro   │
  └─────────────────────────────────────┘
```

Clicking a tree opens it in the right canvas as a connected node flow.

**Dialogue Tree node types** (palette shown in canvas header when a tree is open):

```
[ STATEMENT ] [ QUESTION ] [ ITEMS ] [ DEAD END ]
[ LOOP ] [ END CONVO ] [ THOUGHTS ]
```

#### NODE: STATEMENT
```
┌─────────────────────────────┐
│  💬 STATEMENT               │
│  ─────────────────────────  │
│  Speaker: [ CHARACTER ▾ ]   │  ← drag/drop or select
│  Text: "..."                │
│  Emotion: neutral           │
│  ○ → (output)               │
└─────────────────────────────┘
```

#### NODE: QUESTION
```
┌─────────────────────────────┐
│  ❓ QUESTION                │
│  ─────────────────────────  │
│  Prompt: "..."              │
│  ○ Option A → [branch]      │
│  ○ Option B → [branch]      │
│  [+ ADD OPTION]             │
└─────────────────────────────┘
```

#### NODE: ITEMS
```
┌─────────────────────────────┐
│  🎒 ITEMS                   │
│  ─────────────────────────  │
│  Action: give / need / check│
│  Item: [ select ▾ ]         │
│  Quantity: 1                │
│  ○ → if met / ○ → if not   │
└─────────────────────────────┘
```

#### NODE: DEAD END COMMENT
```
┌─────────────────────────────┐
│  ✕ DEAD END                 │
│  ─────────────────────────  │
│  NPC line: "Come back later"│
│  (no outputs — ends branch) │
└─────────────────────────────┘
```

#### NODE: LOOPING COMMENT
```
┌─────────────────────────────┐
│  ↺ LOOP                     │
│  ─────────────────────────  │
│  Text: "..."                │
│  Returns to: [ node ▾ ]     │
│  Condition: trust < 2       │
└─────────────────────────────┘
```

#### NODE: END CONVERSATION
```
┌─────────────────────────────┐
│  ◼ END CONVERSATION         │
│  ─────────────────────────  │
│  Closing line: "..."        │
│  Relationship Δ: +1         │
│  (terminal — no outputs)    │
└─────────────────────────────┘
```

#### NODE: THOUGHTS
```
┌─────────────────────────────┐
│  〰 THOUGHTS                 │
│  ─────────────────────────  │
│  Voice: [ FEAR ▾ ]          │
│  Text: "..."                │
│  Trigger: after NPC line    │
│  ○ → continues              │
└─────────────────────────────┘
```

---

**Dialogue tree TYPE** — set at the tree level (header of the tree):

```
Tree type:  ● Quest Dialogue
            ○ Octavia Internal Thought
            ○ Scene Observation
            ○ NPC Bark → [ assign location ▾ ]
```

- **Quest Dialogue** — fires as part of a quest step
- **Octavia Internal Thought** — monologue, no NPC involved
- **Scene Observation** — triggered by entering a location or examining an object
- **NPC Bark** — short one-liner, assigned to a specific location/NPC (no branching)

---

### 4. QUESTS

```
▼ QUESTS                                  [+ ADD QUEST]
──────────────────────────────────────────
  ┌─────────────────────────────────────┐
  │  ◆ [MAJOR] The Signal              │
  │  ◇ [MINOR] Find the Password       │
  │  ◆ [MAJOR] Collette's Trail        │
  └─────────────────────────────────────┘
```

**Quest node on canvas:**

```
┌─────────────────────────────────────┐
│  ◆ QUEST  ●MAJOR  /  ◇ QUEST ○MINOR │
│  ─────────────────────────────────  │
│  Name: "The Signal"                 │
│  Category: mystery                  │
│                                     │
│  [ drag CHARACTER here ]            │  ← this character owns the quest
│  [ drag DIALOGUE TREE here ]        │  ← dialogue becomes theirs
│                                     │
│  Start trigger: overhear / location │
│  Threads: [ + ADD ]                 │
│                                     │
│  ●──── to place ────○               │  ← connect to a Place node
│  ●──── to character ──○             │  ← connect to a Character node
└─────────────────────────────────────┘
```

**Quest type toggle:** MAJOR (filled diamond ◆) / MINOR (outline diamond ◇) — set in the node header.

**Drag & drop targets inside a Quest node:**
- Drop a **Character** → character becomes the quest giver / owner
- Drop a **Dialogue Tree** → tree becomes the quest's dialogue sequence

---

## Right Column — Node Canvas

```
┌──────────────────────────────────────────────────────────────────┐
│  [ current context label ]       🔍 zoom –  +   ⌂ reset view    │
│──────────────────────────────────────────────────────────────────│
│                                                                  │
│                    (infinite pan/zoom canvas)                    │
│                                                                  │
│   ┌──────────┐          ┌──────────┐                            │
│   │ NODE A   │──────────│ NODE B   │                            │
│   └──────────┘          └──────────┘                            │
│                                    │                            │
│                              ┌─────┴────┐                       │
│                              │ NODE C   │                       │
│                              └──────────┘                       │
│                                                                  │
└──────────────────────────────────────────────────────────────────┘
```

**Canvas interactions:**
- **Drag from left column** → drops node at release position
- **Drag node header** → move node
- **Click output port (●)** → drag wire → click input port (○) → creates connection
- **Right-click node** → delete / duplicate / open full edit form
- **Scroll** → zoom in/out
- **Middle-click drag / space+drag** → pan
- **Click wire** → delete connection

**Node anatomy:**
```
┌───────────────────────────────┐
│  [TYPE ICON]  NODE TYPE  [✕]  │  ← header (drag handle, delete)
│  ─────────────────────────── │
│  field label   value          │  ← body fields
│  field label   value          │
│                               │
│  ○ input port                 │  ← top-left or left side
│                  output port ● │  ← right side (one or many)
└───────────────────────────────┘
```

---

## Connection Rules (wiring logic)

| From node      | Can connect to              | Meaning                          |
|----------------|-----------------------------|----------------------------------|
| CHARACTER      | QUEST                       | Character owns / triggers quest  |
| CHARACTER      | PROPRIETOR (Place sub-node) | Character is proprietor of place |
| CHARACTER      | STATEMENT (Dialogue)        | Character is the speaker         |
| DIALOGUE TREE  | QUEST                       | Dialogue belongs to this quest   |
| DIALOGUE TREE  | PLACE › DIALOGUE sub-node   | Dialogue fires at this place     |
| QUEST          | PLACE                       | Quest is available at this place |
| PLACE          | QUEST                       | Place triggers this quest        |

---

## Export to Game

**[EXPORT TO GAME]** button in nav bar:

1. Serialises current editor state to `hatchling_data.json`
2. Writes directly to `L:\Beauregarde_game\underneath\project\` (same folder as the game HTML)
3. Game reads this file on load — characters, quests, dialogue all update immediately without a separate import step

> Current behaviour: downloads a JSON file the user manually moves. New behaviour: writes in-place so game reflects changes on next page refresh.

---

## Data Structures (unchanged from current)

No changes to the underlying data models. The new UI is a different way to view/edit the same `data.characters[]`, `data.places[]`, `data.dialogue[]`, `data.dialogueTrees[]`, `data.quests[]`, `data.thoughts[]`.

---

## Implementation Plan

### Files to create
- `L:\Beauregarde_game\underneath\project\construction kit.html` — **new file**, built from scratch (existing Quest Editor left untouched)
- `L:\Beauregarde_game\underneath\project\quest_editor_spec.md` — copy of this spec for the project folder

### What stays the same
- All data structures (`data.*`)
- LocalStorage key (`beau_editor_v1`)
- All form field components (`Field`, `TextInput`, `TextArea`, `Sel`, `TagList`, etc.)
- Color palettes and CSS variable system
- `TabCanvas` component (reused for the node canvas)
- Existing seed data / pre-populated characters

### What changes
1. **Page layout** — replace accordion-only layout with 2-column split (fixed left, flex right)
2. **Left column** — new `Sidebar` component with 4 accordion sections:
   - `CharacterList` (existing data, new display)
   - `PlaceList` (existing data, new display)
   - `DialogueTreeList` (existing data, new display)
   - `QuestList` (existing data, new display)
3. **Right column** — unified `NodeCanvas` component (pan/zoom, drag/drop, port wiring)
4. **Node components** — one per type: `CharacterNode`, `PlaceNode` + child nodes, `DialogueTreeNode` + all 7 dialogue node types, `QuestNode`
5. **Drag/drop system** — drag from sidebar list → drop on canvas → creates node at drop position
6. **Nav bar** — replace EXPORT button with "EXPORT TO GAME" that writes to project folder via File System Access API or download fallback
7. **Canvas state** — `canvasNodes[]` + `canvasConns[]` stored separately from the entity data

### Build order
1. 2-column layout shell + nav bar
2. Sidebar accordion with character list + Add Character
3. Character node on canvas (drag from sidebar)
4. Quest node on canvas (drag from sidebar, drop-target for Character)
5. Dialogue tree node + 7 node types + tree canvas
6. Place node + 5 child node types
7. Wire system (port click → drag → connect)
8. Export to Game
