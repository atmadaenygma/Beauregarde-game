# BEAUREGARDE — Debug Menu System

**Purpose:** In-game developer tools for testing, iteration, and world building  
**Access:** Press `D` key to toggle Debug Menu  
**Scope:** Coordinates, map navigation, vertical exploration, graphics, loot, spawn points

---

## Core Debug Menu Structure

### Main Debug Panel

```
┌─────────────────────────────────────────────────┐
│  DEBUG MENU (Press D to close)                  │
├─────────────────────────────────────────────────┤
│                                                 │
│  TABS:                                          │
│  [Current] [Map] [Coords] [Graphics] [Loot]   │
│  [Spawn] [Physics] [Audio] [NPCs] [Quests]    │
│                                                 │
├─────────────────────────────────────────────────┤
│  TAB CONTENT APPEARS BELOW                      │
│                                                 │
└─────────────────────────────────────────────────┘
```

---

## TAB 1: Current State

**What it shows:**
- Current position (coordinates + map name)
- Current velocity
- Current interaction state
- Heart state (color + value)
- Visible NPCs nearby
- Active quests
- Current thoughts

**Display:**

```
CURRENT STATE
═══════════════════════════════════════

Position:
  Map: the_veil_residential_zone_01
  X: 1250.5
  Y: 340.2
  Z: 0 (ground level)
  Elevation: street_level

Velocity:
  Speed: 3.2 (normal walk)
  Direction: 270° (east)
  Jumping: false
  Hanging: false
  Falling: false

Physics State:
  Grounded: true
  Colliding: false
  In_Fog_Tier: 2
  Camera_Following: true

Heart State:
  Color: RED (healthy)
  BPM: 72
  Health: 85%

Visible NPCs (within Fog Tier 2):
  - store_owner (15px away, tier 1)
  - customer_1 (45px away, tier 2)
  - customer_2 (120px away, tier 3)

Active Quest Threads:
  - marcus_investigation (pieces collected: 3/6)

Current Monologue:
  "Store's ahead. I can see it. The blue awning."
```

**Interactive Elements:**
- Copy position to clipboard (click coordinate)
- Teleport to entered coordinates (type → enter)
- Force heart color change (click color)
- Trigger monologue (button)
- Pause/resume time (button)

---

## TAB 2: Map Navigation

**Purpose:** Jump between maps, see all available maps, understand level structure

**Display:**

```
MAP NAVIGATION
═══════════════════════════════════════

Current Map: the_veil_residential_zone_01

All Available Maps:
├── THE VEIL (District)
│   ├── the_veil_residential_zone_01
│   ├── the_veil_commercial_zone_01
│   ├── the_veil_church_interior
│   ├── the_veil_apartment_interior
│   ├── the_veil_market_interior
│   ├── the_veil_jazz_club_interior
│   ├── the_veil_mechanic_workshop
│   └── the_veil_maintenance_access
│
├── COVENANT HILL (White Beauregarde)
│   ├── covenant_hill_corporate_zone_01
│   ├── covenant_hill_government_zone
│   └── covenant_hill_surveillance_center
│
└── THE DRAIN (Underground)
    ├── drain_level_1_infrastructure
    ├── drain_level_2_experiments
    └── drain_level_3_deep

Map Details for: the_veil_residential_zone_01
  Size: 3200x1200px
  Vertical Levels: 3 (street, second_floor, basement)
  NPCs: 8 (store_owner, customers, residents)
  Loot Spots: 5
  Spawn Points: 3
  Fog_Boundaries: 2
  Music: the_veil_ambient_jazz
  [LOAD] [EDIT] [INFO]

Quick Jump Buttons:
[Apartment] [Store] [Church] [Market] [Mechanic] [Drain Entrance]
```

**Interactive:**
- Click map name to load
- Show map info (size, NPCs, loot count)
- Quick jump buttons for common locations
- Edit mode (opens map editor)
- Reset map state (reload)

---

## TAB 3: Coordinate System & Vertical Exploration

**Purpose:** Understand coordinate system, test vertical movement, see elevation data

**Display:**

```
COORDINATE SYSTEM
═══════════════════════════════════════

Current Coordinates:
  X: 1250.5 (horizontal position in map)
  Y: 340.2  (vertical position in map)
  Z: 0      (elevation level / floor)

Map Name: the_veil_residential_zone_01
Grid Square: [12,3] (if grid-based)

Elevation Levels (Z-axis):
  Z: -200 (basement / underground)
  Z: 0    (street level) ← YOU ARE HERE
  Z: 200  (second floor)
  Z: 400  (rooftop)

[Teleport to: X: ___ Y: ___ Z: ___] [GO]

VERTICAL EXPLORATION
═══════════════════════════════════════

Vertical Movement Abilities:
  Jump: ENABLED (spacebar)
    ├── Jump Height: 120px max
    ├── Jump Distance: 80px
    └── Current Cooldown: 0s
  
  Hang: ENABLED (hold H)
    ├── Ledge Grab Range: 50px
    ├── Hang Duration: unlimited
    └── Current Status: not_hanging
  
  Strafe: ENABLED (A/D while jumping)
    ├── Strafe Speed: 2.5x normal
    ├── Air Control: 60%
    └── Current State: grounded
  
  Climb: ENABLED (E on climbable)
    ├── Climb Speed: 1.5x normal walk
    ├── Climbable Objects: ladders, ledges, walls
    └── Current State: not_climbing

Test Vertical Movement:
  [Force Jump] [Force Hang] [Force Climb]
  [Force Fall] [Set Gravity: 1.0x] [Set Jump Power: 1.0x]

Vertical Points on This Map:
  └── Building (height: 200px)
      ├── Ground: 0px
      ├── Ledge 1: 120px (accessible by jump)
      └── Rooftop: 200px (accessible by climb ladder)
  
  └── Maintenance Access (depth: -200px)
      ├── Street Level: 0px
      ├── Stairwell: -50px
      ├── Infrastructure: -150px
      └── Deep Access: -200px

Climbable/Hangable Points:
  [1] Fire escape ladder (X: 850, Y: 450) → reaches Z: 200
  [2] Ledge on building (X: 920, Y: 380) → reachable from jump
  [3] Pipe cluster (X: 1100, Y: 200) → climbs to Z: 150
```

**Interactive:**
- Teleport to specific coordinates
- Test jump/hang/climb/strafe individually
- Modify gravity (debug physics)
- List all climbable points
- Highlight vertical access points on map
- Record custom spawn points by current position

---

## TAB 4: Graphics & Rendering

**Purpose:** Debug visual systems, parallax, fog of war, animations

**Display:**

```
GRAPHICS DEBUG
═══════════════════════════════════════

Parallax Layers (Active):
  Layer 1 - Sky/Fog (Parallax: 0.05x)
    ├── Opacity: 100%
    ├── Position Offset: -62px
    └── [Toggle] [Reset]
  
  Layer 2 - Far Buildings (Parallax: 0.2x)
    ├── Opacity: 100%
    ├── Position Offset: -250px
    └── [Toggle] [Reset]
  
  Layer 3 - Mid Buildings (Parallax: 0.4x)
    ├── Opacity: 100%
    ├── Position Offset: -500px
    └── [Toggle] [Reset]
  
  Layer 4 - Street Level (Parallax: 0.7x)
    ├── Opacity: 100%
    ├── Position Offset: -875px
    └── [Toggle] [Reset]
  
  Layer 5 - Foreground Objects (Parallax: 1.0x)
    ├── Opacity: 100%
    ├── Position Offset: -1250px
    └── [Toggle] [Reset]
  
  Layer 6 - Character (Parallax: 1.2x)
    ├── Opacity: 100%
    └── Animation: walk_right (frame 8/20)

Fog of War:
  Current Tier: 2 (close)
  Opacity: 80%
  Saturation: 90%
  Blur: 1px
  [Lock Tier] [Cycle Tiers] [Disable FOW]

Character Animation:
  Current: walk_right
  Frame: 8/20
  Speed: 1.0x
  [Play Idle] [Play Walk] [Play Interact]
  [Play Distressed] [Play Climb]

Heart Visual:
  Color: RED
  BPM: 72
  Beat Animation: visible
  [Force RED] [Force YELLOW] [Force BLUE]

Lighting:
  Ambient Light: 100%
  Shadow Opacity: 75%
  Color Grading: warm (the_veil)
  [Day] [Night] [Covenant Hill Style] [Underground Style]

Draw Debug Info:
  [☑] Show Collision Bounds
  [☑] Show Fog Grid
  [☑] Show Climbable Points
  [☑] Show NPC Positions
  [☑] Show Camera Bounds
  [☑] Show Coordinate Grid (1000px squares)

Performance:
  FPS: 60
  Draw Calls: 12
  Entities Rendered: 23
  Memory: 125MB
```

**Interactive:**
- Toggle layers on/off
- Adjust parallax values in real-time
- Test animations
- Force different fog tiers
- Change lighting/color grading
- Draw debug overlays
- Performance monitoring

---

## TAB 5: Loot Spots & Items

**Purpose:** Place items, define loot locations, test item pickups

**Display:**

```
LOOT SPOTS & ITEMS
═══════════════════════════════════════

Loot Spots on This Map: 5
├── [1] Behind Counter (X: 1320, Y: 380)
│   └── Item: money_50_currency
│   └── Visible: true
│   └── Collected: false
│   └── [Edit] [Delete] [Teleport] [Collect]
│
├── [2] Shelf (X: 1180, Y: 420)
│   └── Item: food_bread
│   └── Visible: true
│   └── Collected: false
│   └── [Edit] [Delete] [Teleport] [Collect]
│
├── [3] Storage Room (X: 1400, Y: 520)
│   └── Item: repair_tools
│   └── Visible: false (requires unlock)
│   └── Collected: false
│   └── [Edit] [Delete] [Teleport] [Collect]
│
├── [4] Window Sill (X: 950, Y: 250)
│   └── Item: letter_from_mystery_contact
│   └── Visible: true
│   └── Collected: false
│   └── [Edit] [Delete] [Teleport] [Collect]
│
└── [5] Under Floorboard (X: 1100, Y: 600)
    └── Item: money_20_currency
    └── Visible: false (discoverable by exploring)
    └── Collected: false
    └── [Edit] [Delete] [Teleport] [Collect]

Add New Loot Spot:
  Item Type: [food_bread ▼]
  Visibility: [visible ▼]
  Position: [Current (1250, 340)] [Custom: X:___ Y:___]
  [CREATE AT CURRENT POSITION]

Item Database:
├── Currency
│   ├── money_10_currency
│   ├── money_20_currency
│   ├── money_50_currency
│   └── money_100_currency
├── Food
│   ├── food_bread
│   ├── food_soup
│   ├── food_fruit
│   └── food_prepared_meal
├── Tools & Repair
│   ├── repair_tools
│   ├── cleaning_supplies
│   └── specialized_tools
├── Documents
│   ├── letter_from_contact
│   ├── newspaper
│   └── investigation_notes
└── Quest Items
    ├── marcus_photo
    ├── key_to_basement
    └── drain_entrance_map

Inventory (Player):
  Current Money: 120 currency
  Food: bread (3 days remaining)
  Items: None
  Weight: light
  [Add Item] [Remove Item] [Full Inventory]
```

**Interactive:**
- Click loot spot to teleport to it
- Create new loot spot at current position
- Edit existing loot (change item, visibility)
- Delete loot spots
- Manually collect items
- Modify inventory
- See all available item types

---

## TAB 6: Spawn Points & NPCs

**Purpose:** Place NPCs, define spawn locations, test NPC behavior

**Display:**

```
SPAWN POINTS & NPCs
═══════════════════════════════════════

Spawn Points on This Map: 3
├── [1] Store Entrance (X: 1250, Y: 550)
│   └── NPC: store_owner
│   └── Schedule: 7am-9pm
│   └── Spawned: true
│   └── Trust Level: contact (2)
│   └── [Edit] [Delete] [Force Despawn]
│
├── [2] Counter (X: 1320, Y: 380)
│   └── NPC: none (variable)
│   └── Type: random_customer
│   └── Spawned: true (customer_1)
│   └── [Change NPC] [Delete]
│
└── [3] Corner (X: 950, Y: 450)
    └── NPC: none (variable)
    └── Type: neighborhood_resident
    └── Spawned: false
    └── [Change NPC] [Spawn Now]

Current NPCs in World: 3
├── store_owner (X: 1320, Y: 380)
│   └── State: idle_behind_counter
│   └── Talking: false
│   └── Trust: contact (2)
│   └── [Teleport To] [Talk] [Edit] [Remove]
│
├── customer_1 (X: 1200, Y: 420)
│   └── State: browsing_shelves
│   └── Talking: false
│   └── Trust: stranger (0)
│   └── [Teleport To] [Talk] [Edit] [Remove]
│
└── customer_2 (X: 1100, Y: 480)
    └── State: at_counter
    └── Talking: false
    └── Trust: stranger (0)
    └── [Teleport To] [Talk] [Edit] [Remove]

All Available NPCs:
├── Store Keeper
│   ├── store_owner
│   └── [Spawn] [Info]
├── Community
│   ├── church_mother
│   ├── market_vendor
│   ├── mechanic
│   └── maintenance_foreman
├── Other
│   ├── beak
│   ├── hat_man
│   └── various_residents

Spawn New NPC:
  NPC: [store_owner ▼]
  Position: [Current (1250, 340)] [Custom: X:___ Y:___]
  [SPAWN]

NPC Behavior Testing:
  [Force Dialogue] [Force Movement] [Force Animation]
  [Reset State] [Add Thread] [Modify Trust]

NPC Information:
  Selected: store_owner
  ├── Current State: idle_behind_counter
  ├── Current Dialogue: none
  ├── Schedule: 7am-9pm daily
  ├── Trust: contact (2)
  ├── Information Held: 5 threads
  │   ├── marcus_job
  │   ├── marcus_disappearance
  │   ├── supply_chain_issues
  │   ├── institutional_presence
  │   └── community_gossip
  └── [Edit Trust] [Add Thread] [Remove Thread] [Force Dialogue]
```

**Interactive:**
- Spawn NPCs at current position
- Remove NPCs from world
- Teleport to NPCs
- Force dialogue with NPCs
- Modify NPC trust level
- Add/remove information threads
- Test NPC behavior
- Edit schedules

---

## TAB 7: Physics Debug

**Purpose:** Test movement, collision, gravity, jumping mechanics

**Display:**

```
PHYSICS DEBUG
═══════════════════════════════════════

Gravity:
  Current: 1.0x (normal)
  [0.5x] [0.75x] [1.0x] [1.5x] [2.0x]

Movement Speed:
  Walking: 3.0px/frame (normal: 1.0x)
  [0.5x] [0.75x] [1.0x] [1.5x] [2.0x]

Jump:
  Power: 1.0x
  Height: 120px max
  Distance: 80px max
  [0.5x] [0.75x] [1.0x] [1.5x] [2.0x]

Strafe (Air Control):
  Air Control: 60%
  Strafe Multiplier: 2.5x
  [Test Strafe] [Disable] [Enable]

Collision:
  Current Collisions: 0
  Collision Bounds: visible (toggle)
  [Show All Bounds] [Show Only Colliding]

Ground Detection:
  Grounded: true
  Ground Distance: 0px
  Slope: 0°
  [Force Grounded] [Force Falling]

Hang System:
  Hang Range: 50px
  Hang Ledges Visible: 2
  [List Ledges] [Force Hang]

Climb System:
  Climbable Range: 50px
  Climbable Objects: 3
  Current Climbing: false
  [List Objects] [Force Climb]

Velocity:
  X: 0px/frame
  Y: 0px/frame
  Speed: 0px/frame
  Direction: 0°

Test Physics:
  [Jump] [Hang] [Climb] [Strafe Jump]
  [Free Fall] [Slide Down Slope]
```

**Interactive:**
- Adjust gravity, speed, jump power in real-time
- Test movement mechanics
- View collision bounds
- Force specific states
- Monitor velocity

---

## TAB 8: Audio Debug

**Purpose:** Test sounds, music, ambient audio, voice lines

**Display:**

```
AUDIO DEBUG
═══════════════════════════════════════

Current Music:
  Track: the_veil_ambient_jazz
  Volume: 70%
  Playing: true
  [Stop] [Pause] [Change Track]

Ambient Sound:
  Layer 1: street_noise (30% volume)
  Layer 2: distant_jazz (50% volume)
  Layer 3: character_heartbeat (20% volume)
  [Mute All] [Solo Each]

Master Volume: 100%
├── Music: 70%
├── Dialogue: 85%
├── Effects: 100%
└── Ambient: 65%

All Tracks:
├── The Veil
│   ├── the_veil_ambient_jazz
│   ├── the_veil_tension
│   └── the_veil_safe
├── White Beauregarde
│   ├── covenant_hill_sterile
│   └── covenant_hill_danger
├── Underground
│   ├── drain_ambient_machinery
│   └── drain_danger

Test Dialogue:
  NPC: [store_owner ▼]
  Trust: contact (2)
  Dialogue: [marcus_mention_contact ▼]
  [PLAY] [STOP]

Voice Lines Available:
├── store_owner
│   ├── greeting_stranger
│   ├── marcus_mention_contact
│   └── danger_warning_ally
└── church_mother
    ├── grandson_concern_contact
    └── rescue_planning_ally

Sound Effects:
  [Footstep] [Door Open] [Heartbeat] [Beep] [Error]

Audio Performance:
  Playing Sounds: 3
  Music Tracks: 1
  Memory Used: 45MB
```

**Interactive:**
- Play/stop specific tracks
- Adjust volume for categories
- Test dialogue
- Play sound effects
- Monitor audio performance

---

## TAB 9: NPCs & Relationships

**Purpose:** Manage NPC relationships, trust levels, dialogue history

**Display:**

```
NPCs & RELATIONSHIPS
═══════════════════════════════════════

All NPCs: 8
├── Store Owner (store_owner)
│   ├── Trust: contact (2) [Modify: 0-4]
│   ├── Reputation: +0.8
│   ├── Dialogue Count: 12
│   ├── Threads Known: 5
│   │   ├── marcus_job
│   │   ├── marcus_disappearance
│   │   ├── supply_chain_issues
│   │   ├── institutional_presence
│   │   └── community_gossip
│   ├── Jobs Offered: store_clerk
│   ├── Current State: idle_behind_counter
│   └── [Edit] [Reset Trust] [Add Thread] [View Dialogue History]
│
├── Church Mother (church_mother)
│   ├── Trust: acquaintance (1) [Modify: 0-4]
│   ├── Reputation: +0.4
│   ├── Dialogue Count: 5
│   ├── Threads Known: 2
│   │   ├── marcus_family
│   │   └── community_history
│   ├── Jobs Offered: church_volunteer
│   ├── Current State: none (not spawned)
│   └── [Spawn] [Edit] [Reset Trust] [Add Thread]
│
[... more NPCs ...]

Trust Level Breakdown:
  0 (Stranger): 3 NPCs
  1 (Acquaintance): 2 NPCs
  2 (Contact): 2 NPCs
  3 (Ally): 1 NPC
  4 (Confidant): 0 NPCs

Dialogue History With: store_owner
├── [1] 2:45pm - First Meeting
│   └── "Welcome to the store."
│   └── Trust Change: 0
│
├── [2] 3:20pm - Second Visit
│   └── "Good to see you again."
│   └── Trust Change: +0.1
│
├── [3] 5:10pm - Marcus Question
│   └── "Marcus? Yeah, I knew him. Smart kid."
│   └── Trust Change: +0.2
│
└── [12] Today 1:15pm - Latest
    └── "Look, supply chains are weird lately..."
    └── Trust Change: +0.1

Bulk Operations:
  [Reset All Trust to 0] [Set All to Max Trust]
  [Show All Dialogue History] [Export NPC Data]
```

**Interactive:**
- View/modify trust level for any NPC
- Add/remove information threads
- View full dialogue history
- Spawn/despawn NPCs
- Reset relationships
- Bulk operations

---

## TAB 10: Quests & Threads

**Purpose:** Manage quests, view thread progress, test investigations

**Display:**

```
QUESTS & THREADS
═══════════════════════════════════════

Active Quests: 2
├── marcus_investigation
│   ├── Status: in_progress
│   ├── Threads Collected: 3/6
│   │   ├── [✓] marcus_name
│   │   ├── [✓] marcus_job
│   │   ├── [✓] marcus_disappearance
│   │   ├── [ ] marcus_family
│   │   ├── [ ] marcus_capture
│   │   └── [ ] drain_location
│   ├── Connected Threads: 2
│   │   ├── program_scope
│   │   └── institutional_interest
│   ├── Completion: 50%
│   └── [Add Thread] [Remove Thread] [Complete Quest]
│
└── supply_chain_investigation
    ├── Status: in_progress
    ├── Threads Collected: 2/4
    ├── Connected Threads: 1
    ├── Completion: 50%
    └── [Edit]

All Available Threads: 20
├── PERSONAL
│   ├── marcus_name (collected)
│   ├── marcus_job (collected)
│   ├── marcus_disappearance (collected)
│   ├── marcus_family
│   ├── marcus_capture
│   ├── hat_man_appearance
│   └── hat_man_motives
│
├── COMMUNITY
│   ├── black_wall_street_history
│   ├── underground_railroad_network
│   ├── church_sanctuary
│   └── community_mutual_aid
│
├── INSTITUTIONAL
│   ├── program_scope
│   ├── modification_tracking
│   ├── drain_location
│   └── bureau_operations
│
└── LOCATION
    ├── apartment_safe_house
    ├── church_basement
    ├── mechanic_workshop
    └── maintenance_infrastructure

Memory Map Display:
  Current Connections: 5
  [Visualize Map] [Export Map] [Reset Map]

Test Quest Progression:
  Add Thread: [marcus_family ▼] [ADD]
  Remove Thread: [marcus_capture ▼] [REMOVE]
  Complete Quest: [marcus_investigation ▼] [COMPLETE]

Quest Editor:
  [Create New Quest]
  Edit Existing: [marcus_investigation ▼] [EDIT]

Bulk Operations:
  [Reset All Quests] [Complete All Quests]
  [Collect All Threads] [Export Quest Data]
```

**Interactive:**
- View quest progress
- Add/remove threads
- Complete quests
- Visualize memory map
- Create new quests
- Test quest flow
- Bulk operations

---

## Keyboard Shortcuts (Global)

```
D - Toggle Debug Menu
F1 - Spawn at Last Checkpoint
F2 - Show Coordinates
F3 - Toggle Fog of War
F4 - Show Collision Bounds
F5 - Reload Map
F6 - Reset All State
F7 - Show Performance Stats
F8 - Screenshot (saves to /debug/screenshots/)
F9 - Record Video (30 seconds)
F10 - Show Coordinates History

Ctrl+C - Copy Current Position
Ctrl+V - Paste Last Saved Position
Ctrl+Z - Undo Last Debug Change
Ctrl+Shift+Z - Redo

G - Toggle Grid Overlay (1000px squares)
H - Show Hotspots (loot, NPCs, interactables)
L - List All Objects at Current Position
N - Cycle Through Nearby NPCs
T - Teleport Menu (quick access)
```

---

## File Export/Import

**All debug data can be exported for version control:**

```
/debug/
├── saved_positions.json (coordinates saved with Ctrl+S)
├── npc_states.json (current NPC states)
├── quest_progress.json (thread collection progress)
├── screenshots/ (F8 screenshots)
├── recordings/ (F9 recordings)
└── logs/
    ├── coordinates_history.log
    ├── state_changes.log
    └── performance_metrics.log
```

---

## Settings & Preferences

```
DEBUG SETTINGS
═══════════════════════════════════════

Auto-Save Debug Data:
  [☑] Save position history
  [☑] Save state changes
  [☑] Save performance metrics
  Interval: 60 seconds

UI Preferences:
  [☑] Show FPS Counter
  [☑] Show Memory Usage
  [☑] Show Coordinates Always
  [☑] Show Debug Grid
  [☑] Auto-expand Active Tab
  
Theme:
  [Dark] [Light] [High Contrast]

Font Size:
  [Small] [Normal] [Large]

Layout:
  [Compact] [Full] [Window]
  (compact = bottom corner, full = full screen, window = floating)

Hotkey Customization:
  [Edit Hotkeys]

Reset All Settings:
  [RESET TO DEFAULT]
```

---

## Example Debug Workflow

**Scenario: Testing Marcus Investigation Quest**

1. **Open Debug Menu (D)**
2. **Go to QUESTS tab**
3. **Create new thread:** marcus_family
4. **Switch to NPCs tab**
5. **Find church_mother**
6. **Modify Trust:** 0 → 3 (Ally)
7. **Add Thread:** marcus_family to church_mother
8. **Go to COORD tab**
9. **Teleport to church:** X:800 Y:400 Z:0
10. **Close debug menu (D)**
11. **Talk to church_mother in game**
12. **See new dialogue about Marcus**
13. **Open debug menu again**
14. **Go to AUDIO tab**
15. **Test dialogue: church_mother marcus_mention_ally**
16. **Back to QUESTS tab**
17. **Check memory map updated**
18. **Export quest_progress.json**

---

## Integration With Hot Reload

**Debug Menu talks to both:**
- **In-game state** (modify NPC, collect thread, change heart color)
- **File system** (load/save JSON, hot reload changes)

**Example:**
1. Edit `quests.md` in VS Code
2. Save file (hot reload triggers)
3. Game automatically reloads quest definitions
4. Debug menu shows updated threads
5. No restart required

---

This is a **complete debug ecosystem** for development. It connects to your file system, your game state, and your coordinate system.

Should I now design:
1. **The markdown file structure** for quests/characters/places/dialogue?
2. **The file watcher + hot reload system** code?
3. **The coordinate/vertical movement system** details?
4. **The debug menu UI component** code?

Which would you like to tackle first?
