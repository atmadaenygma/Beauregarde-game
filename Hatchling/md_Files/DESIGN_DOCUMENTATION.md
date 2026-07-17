# HATCHLING — Design Documentation

Complete reference for color palettes, UI sizing, and game features.

> 📋 **Cross-reference:** [ITEMS_AND_LOCATIONS.md](ITEMS_AND_LOCATIONS.md) tracks every item, pickup location, store price, and scene interactable. **Keep both files in sync** — update ITEMS_AND_LOCATIONS.md whenever items move, prices change, or new pickups are added.

---

## COLOR PALETTES

All UI elements (HUD, prompts, dialogue, buttons) pull colors from a single `C` object. The player can switch presets in the HUD SYS tab. Four presets available:

### 1. TEAL (Default)
**Name:** `default` | **Theme:** Cool teal background + cream-yellow active + lime-green accent

| Element | Hex | Usage |
|---------|-----|-------|
| **bg** | `#08191a` | Main background, panel backgrounds |
| **panel** | `#0e2226` | Dialogue boxes, UI panels |
| **border** | `#285054` | Borders, dividers, grid lines |
| **text** | `#d8e8e4` | Main text, readable content |
| **dim** | `#6f9290` | Dimmed/secondary text, inactive state |
| **gold** | `#fff0c0` | Active tab, highlight, cursor, selected text |
| **red** | `#88e030` | Selection underline, active button, emphasis (lime-green, not red) |
| **nR** | `#c4f060` | Neon red accent variant |
| **nG** | `#88e030` | Neon green accent variant |
| **danger** | `#d04030` | True red for dangerous/hostile states (rare) |
| **selBg** | `#102e2c` | Selected row background, subtle highlight |

**Inspired by:** `project/uploads/ui_reference.jpg`

---

### 2. HOKUSAI (Navy)
**Name:** `hokusai` | **Theme:** Deep navy + rose — inspired by Japanese Hokusai poster aesthetic

| Element | Hex | Usage |
|---------|-----|-------|
| **bg** | `#0a1628` | Main background |
| **panel** | `#0e1f38` | Dialogue boxes, UI panels |
| **border** | `#1e3a5a` | Borders, dividers |
| **text** | `#f0c0d4` | Main text (rose-tinted cream) |
| **dim** | `#7a4a62` | Dimmed text, secondary |
| **gold** | `#f0d060` | Active state, highlights |
| **red** | `#d84878` | Selection underline, buttons (rose-red) |
| **nR** | `#e060a0` | Neon red accent |
| **nG** | `#50a8e8` | Neon green accent (cyan-blue) |
| **danger** | `#e84848` | Danger state |
| **selBg** | `#122438` | Selected row background |

---

### 3. DRAGON (Lime)
**Name:** `dragon` | **Theme:** Dark olive + toxic lime — inspired by vintage dragon poster

| Element | Hex | Usage |
|---------|-----|-------|
| **bg** | `#0e1208` | Main background (very dark olive) |
| **panel** | `#161a0c` | Dialogue boxes, UI panels |
| **border** | `#2a3612` | Borders, dividers |
| **text** | `#b8cc78` | Main text (pale lime-green) |
| **dim** | `#4a5828` | Dimmed text, secondary |
| **gold** | `#d0c050` | Active state, highlights (pale yellow) |
| **red** | `#78c028` | Selection underline, buttons (bright lime) |
| **nR** | `#e0a020` | Neon red accent (orange) |
| **nG** | `#78c028` | Neon green accent |
| **danger** | `#e05020` | Danger state (orange-red) |
| **selBg** | `#1a2010` | Selected row background |

---

### 4. BADSLEEPWELL (Gold)
**Name:** `badsleepwell` | **Theme:** Near black + amber — inspired by "Bad Sleep Well" (Kurosawa) poster

| Element | Hex | Usage |
|---------|-----|-------|
| **bg** | `#090807` | Main background (nearly black) |
| **panel** | `#100e08` | Dialogue boxes, UI panels |
| **border** | `#3a2c10` | Borders, dividers (warm brown) |
| **text** | `#c8a840` | Main text (amber-gold) |
| **dim** | `#5a4618` | Dimmed text, secondary |
| **gold** | `#c8a840` | Active state, highlights (same as text) |
| **red** | `#c87030` | Selection underline, buttons (orange-gold) |
| **nR** | `#e04818` | Neon red accent |
| **nG** | `#88a020` | Neon green accent (yellow-green) |
| **danger** | `#c82020` | Danger state |
| **selBg** | `#1a1408` | Selected row background |

---

## UI SIZING

### Device HUD (Handheld PDA)

**Scale Presets:**
- `small`: 1.0× = 430 × 461 px
- `medium` (default): 1.3× = **559 × 599 px rendered**
- `large`: 1.6× = 688 × 737 px

> All HUD measurements scale together. Never hardcode pixel values; reference `HUD_SCALE`, `HUD_W`, `HUD_H` in code.

**Base Dimensions (at 1.0× scale):**
```
Device width:  430 px
Device height: 461 px
```

**Screen Regions (within device container):**

| Screen | Left | Top | Width | Height | At 1.3×scale |
|--------|------|-----|-------|--------|--------------|
| **TOP** | 56 px | 30 px | 320 px | 165 px | 73px · 39px · 416px · 215px |
| **BOTTOM** | 57 px | 260 px | 318 px | 163 px | 74px · 338px · 414px · 212px |

> Base values auto-detected from `smartphone_mask_black_white.png` mask image. If mask changes, re-run detection.

**Typography in HUD:**
```
HUD_FONT_SCALE = 1.4

Tab labels:     8px × HUD_FONT_SCALE = ~11px
SubTab labels:  7px × HUD_FONT_SCALE = ~10px
System labels:  8px × HUD_FONT_SCALE = ~11px
List headers:   9px × HUD_FONT_SCALE = ~13px
List items:     7px × HUD_FONT_SCALE = ~10px
```

**Spacing & Padding:**
```
Horizontal padding (lists):      4–14 px × HUD_FONT_SCALE
Vertical padding (items):        3–8 px × HUD_FONT_SCALE
Gap between elements:            1–4 px × HUD_FONT_SCALE
Item border-left (selected):     3px solid C.red
```

**List Item Grid:**
- **Inventory (clothes/food/misc):** 2-column grid, 70×70 px icons
- **People:** 2-column grid, character portrait cards
- **Threads:** Left sidebar (categories) + right list (entries)
- **Intel:** Single column scrolling list

---

### In-Game UI

**Interact Prompt `[E]`:**
```
Font: Space Mono, 7px
Color: C.gold (active text)
Background: C.panel + border: C.border
Padding: 4px 8px
Z-index: VIEWPORT.promptZ = 9999 (always on top)
```

**Dialogue/Thought Boxes:**
```
Font: Space Mono, 8px
Line-height: 1.4
Color: C.text
Background: C.panel
Border: 1px solid C.border
Padding: 12px 16px
Max-width: 600 px
```

**Character Sprite:**
```
Default height: 371 px
Bathroom height: 334 px (10% smaller)
Bathroom Y position: -20% from standard (moved up)
Animation speed: playbackRate = 0.65 (slowed 35%)
```

**MoneyHUD (top-left corner):**
```
Font: Space Mono, 11px
Color: C.gold
Format: "💵 X.XX"
Update: Real-time when inventory changes
```

---

## CHARACTER ANIMATIONS

**Outfit-Based System:**

Octavia has three outfits, each with dedicated animations:

### UNDERWEAR
- **Location:** `../graphics/characters/octavia/underwear/`
- **States:** `idle_left`, `idle_right`, `walk_left`, `walk_right`
- **Format:** WebM video files

### RAGS
- **Location:** `../graphics/characters/octavia/rags/`
- **States:** `idle_left`, `idle_right`, `walk_left`, `walk_right`
- **Format:** WebM video files
- **Notes:** "Tattered clothes. This is what I wear." — visual identity of survival

### HOODIE
- **Location:** `../graphics/characters/octavia/hoodie/`
- **States:** `idle_left`, `idle_right`, `walk_left`, `walk_right`
- **Format:** WebM video files
- **Notes:** Hides the octopus, provides anonymity in society

**Animation Switching:**
```js
const getCharAnimation = (outfit, facing, action) => {
  const key = `${action}_${facing}`;
  return CHAR_ANIMATIONS[outfit]?.[key] || null;
};
```

When player equips new clothes via HUD or scene interaction, `currentOutfit` state updates and character re-renders with new animation set.

---

## INVENTORY SYSTEM

### Item Categories

| Category | Items | Restore % | Equippable |
|----------|-------|-----------|-----------|
| **CLOTHES** | Underwear, Rags, Black Hoodie | 0% | Yes |
| **FOOD** | Bread, Water | 8–10% | No |
| **INGREDIENTS** | (Reserved for future) | — | — |
| **MISC** | Cracked Phone | 0% | No |

**Special Item: Bandages & Painkillers**
- Currently categorized as FOOD
- Restore: 20% (bandages), 40% (painkillers)
- Should be reclassified to dedicated MEDICINE category

### Item Definitions (Complete List)

```js
const ITEM_DEFS = {
  // CLOTHES
  underwear:    {name:'UNDERWEAR',     category:'clothes', desc:'What I was wearing when I woke up.',restore:0,equippable:true},
  rags:         {name:'RAGS',          category:'clothes', desc:'Tattered clothes. This is what I wear. This is what I am.',restore:0,equippable:true},
  hoodie:       {name:'BLACK HOODIE',  category:'clothes', desc:"An old black hoodie with a huge hood. I may be able to hide my tentacles.",restore:0,equippable:true},
  
  // FOOD & DRINKS
  bread:        {name:'BREAD',         category:'food',    desc:'Enough.',restore:8},
  water:        {name:'WATER',         category:'food',    desc:'Necessary. For both of them.',restore:10},
  
  // MEDICINE (currently FOOD)
  bandages:     {name:'BANDAGES',      category:'food',    desc:'Keeping things covered.',restore:20},
  painkillers:  {name:'PAINKILLERS',   category:'food',    desc:'Chemical numbness. Not ideal but functional.',restore:40},
  
  // MISC
  phone:        {name:'CRACKED PHONE', category:'misc',    desc:'A cracked smartphone. Unlocked. Deliberately wiped. Someone left this for me.',restore:0},
};
```

### Inventory Management

**Keyboard Controls:**
- `I` or `Shift`: Open device HUD
- Arrow Up/Down: Navigate inventory list
- `E`: Use/equip selected item
- `ESC`: Close HUD

**Controller (Virtual Cursor):**
- Left analog stick: Move cursor
- `A` button: Select/confirm
- `B` button or `ESC`: Cancel

---

## DEVICE HUD APPS

### Home Screen (All Platforms)
```
┌─────────────────┐
│  APP GRID (2×4) │
│ [THREADS] [PEOPLE] [INVENTORY] [INTEL]  │
│ [CAMERA] [NEWS]   [CHAT]      [CALL]    │
│                                        │
│  TITLE · VERSION · VITALS              │
└─────────────────┘
```

### App: INVENTORY
**Top Screen:** 2-column grid of item cards
- Icon + name + restore percentage
- Selected = red left border + highlight
- Equippable items show "EQUIP" button on detail screen

**Bottom Screen:** Selected item detail
- Name (all caps)
- Description (Octavia's thought)
- Restore percent
- Action button: USE or EQUIP

### App: PEOPLE
**Top Screen:** 2-column grid of character portrait cards
- Portrait (SVG or locked silhouette if unknown)
- Name, role, status badge
- Status colors: `CONTACT`=gold, `LEAD`=dim, `MISSING`=red, `UNKNOWN`=dim+lock

**Bottom Screen:** Selected character detail
- Name, role, handle
- Status indicator
- Full character info text
- Categorize button (if discoverable)

**Discovery System:**
- Characters must be discovered before appearing in phone
- Player assigns categories: ALLIES or SUSPECTS (or custom)
- Once categorized, character is saved to `characterCategories` state

### App: THREADS
**Top Screen:** Dual-pane layout
- Left pane: Thread categories (MONO, CITY, RADIO)
- Right pane: Entries in selected category

**Bottom Screen:** Selected entry detail
- Title, handle
- Status (NEW, CACHED, RESEARCHED)
- Content preview
- Research progress bar (if applicable)

### App: INTEL
**Top Screen:** Single-column scrolling list
- Intel item name
- Type badge (MEDICAL, SAFE HOUSE, ACCESS, etc.)
- Status icon

**Bottom Screen:** Selected intel detail
- Name, type, address
- Hours/availability
- Full info text

### Stub Apps (CAMERA, NEWS, CHAT, CALL)
**Top Screen:**
```
     [SVG ICON]
     // COMING SOON
```
**Bottom Screen:** Empty/dark

---

## VOICE/THOUGHT SYSTEM

**16 Distinct Voice Channels** (Disco Elysium-style internal monologue)

| Voice | Color | Personality |
|-------|-------|-------------|
| **FEAR** | `#c43028` (red) | Anxiety, dread, warnings |
| **BODY** | `#7a7a7a` (grey) | Physical sensation, pain, need |
| **SURVIVAL** | `#d4802a` (orange) | Practical instinct, caution |
| **INSTINCT** | `#2ab840` (green) | Intuition, animal sense, instinct |
| **CONFUSION** | `#8060c0` (purple) | Uncertainty, disorientation |
| **DENIAL** | `#605060` (grey) | Rejection, avoidance |
| **MEMORY** | `#3060b0` (blue) | Recall, trauma flashback |
| **TRAUMA** | `#802020` (dark red) | Pain, distress, wound |
| **GRIEF** | `#2040a8` (dark blue) | Loss, sadness, mourning |
| **RAGE** | `#d05020` (orange-red) | Anger, fury, hostile |
| **GUILT** | `#b09020` (brown-gold) | Shame, regret |
| **ACCEPTANCE** | `#4080c0` (light blue) | Calm, peace, resolution |
| **CURIOSITY** | `#9060d0` (purple-pink) | Interest, inquiry, wonder |
| **NUMBNESS** | `#507080` (blue-grey) | Detachment, dissociation |
| **DISSOCIATION** | `#b0c0d0` (pale blue) | Disconnection, floating |

Each can be rendered as a color-coded thought/bark above Octavia in dialogue scenes.

---

## GAME FEATURES (IMPLEMENTED)

### Core Mechanics ✅
- [x] **Outfit System** — Underwear → Rags → Hoodie, each with unique animations
- [x] **Inventory Management** — Items organized by category (CLOTHES, FOOD, MISC)
- [x] **Vital Points (Health)** — Heart % indicator, restore via food/medicine
- [x] **Money System** — Currency affects NPC availability and dialogue options
- [x] **Character Discovery** — NPCs appear in phone only after meeting them
- [x] **Character Categorization** — Player assigns ALLIES or SUSPECTS
- [x] **Device HUD** — Unified dual-screen handheld PDA interface
- [x] **Virtual Controller Cursor** — Left analog stick + A button navigate menus like mouse
- [x] **Keyboard Input** — Full WASD/arrow movement, I for inventory, E for interact
- [x] **Colour Theme Selection** — Player chooses UI theme from 4 presets

### Scenes ✅
- [x] **Bathroom** — Shower decisions, mirror dialogue, clothes interaction
- [x] **Apartment** — Octavia's room, exploration, ambient sounds
- [x] **Hallway** — Building navigation, door interactions, elevator mystery
- [x] **Street** — Exterior, weather/rain, NPC encounters
- [x] **Store** — Raymond the clerk, conversation trees, money mechanics
- [x] **Pharmacy** — Medicine, Dr. Chen's card, network contact
- [x] **Restaurant** — Diego the vendor, hostel info, relationship building

### NPCs & Dialogue ✅
- [x] **Raymond** — Store clerk, network operative, warnings
- [x] **Diego** — Street vendor, resource provider, 20 years in The Veil
- [x] **Pharmacist** — Medical network, safe space, no questions
- [x] **Dr. Chen** — Clinic hours 6PM–Midnight Wed–Sat, modification specialist
- [x] **Collette Leeks** — Missing person, network founder, octopus connection
- [x] **Red Lipstick Woman** — Unknown identity, mystery contact

### UI Features ✅
- [x] **HUD Scaling** — 3 size presets (small, medium, large)
- [x] **Color Theming** — 4 complete palettes (TEAL, HOKUSAI, DRAGON, BADSLEEPWELL)
- [x] **Interact Prompts** — `[E]` labels for all interactive objects
- [x] **Dialogue System** — Branching conversations with memory state
- [x] **MoneyHUD** — Real-time money display
- [x] **HealthHUD** — Heart % indicator
- [x] **Scanlines/CRT Effect** — Vintage aesthetic overlay
- [x] **Film Grain** — Animated noise texture
- [x] **Vignette** — Subtle corner darkening

### Audio ✅
- [x] **Ambient Sounds** — Shower, dripping water, elevator, radio, conversation, vacuum
- [x] **Sound Triggers** — Play on scene load and interaction
- [x] **Unmute After Autoplay** — Browser autoplay permissions handled
- [x] **Audio Cues** — Environmental storytelling via sound

---

## PLANNED/FUTURE FEATURES

### In Development
- [ ] **Encrypted Folder** — Secret passwords, long-term mystery
- [ ] **Computer Password** — 3 paths (Diego, trash note, router sticky)
- [ ] **360° Character Preview** — Rotate Octavia in people detail screen
- [ ] **Save/Load System** — Wired in HUD, needs backend
- [ ] **Settings Panel** — Font size, brightness, difficulty (stub in HUD)

### Design Phase
- [ ] **Jazz Club** — Primary information hub, resistance coordinator
- [ ] **Bureau NPCs** — Antagonist encounters, surveillance
- [ ] **Modification Mechanics** — Octopus evolution, new abilities
- [ ] **Depth Movement** — Forward/back in interior scenes
- [ ] **Multi-Act Story** — Chapters beyond opening (arrival, integration, mystery)

---

## KEY FILE LOCATIONS

```
project/
  Hatchling Quest 1.html          ← Main game (React/Babel)
  DESIGN_DOCUMENTATION.md            ← This file
  uploads/
    device_hud.png                   ← Device frame image
    smartphone_mask_black_white.png  ← Screen mask (auto-detection source)
    ui_reference.jpg                 ← Original TEAL palette reference
  graphics/
    characters/octavia/
      underwear/                     ← Underwear animations
      rags/                          ← Rags animations
      hoodie/                        ← Hoodie animations
    maps/                            ← Scene backgrounds (44 folders)
  md_Files/
    quests/chapter_opening/          ← Scene documentation
```

---

## DESIGN PRINCIPLES

1. **Single Color System** — `C` object drives all UI colors, never hardcoded hex
2. **Scaled Components** — HUD scaling via `HUD_SCALE`, never hardcoded pixels
3. **Outfit Identity** — Each outfit has unique animations, affects dialogue/NPC reactions
4. **Information Gating** — NPCs discovered, characters unknown until met
5. **No Tutorial** — Player discovers mechanics through Octavia's internal monologue
6. **Vintage Aesthetic** — CRT scanlines, film grain, warm world art + cool UI contrast
7. **Community Over Solo** — Octavia is part of a network, not a lone hero
8. **Permanent Consequences** — One save slot, choices matter

---

**Last Updated:** May 26, 2026
**Game Version:** Quest I — Waking Up (Chapter 1)
