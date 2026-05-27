# BEAUREGARDE — Fog of War System

## Core Concept

**Fog of War** is the visual/spatial distance system. Objects, NPCs, and details fade and disappear based on their distance from the player character. This creates several effects:

1. **Intimacy:** Only what's immediately around her is clear
2. **Vulnerability:** Things can appear unexpectedly from the fog
3. **Memory:** Familiar places are clear in the fog, unfamiliar places are opaque
4. **Isolation:** Reinforces that she's alone, that she doesn't have full visibility
5. **Performance:** Keeps rendering efficient (don't draw distant objects)

**This is NOT the "white Beauregarde fog" boundary.** This is spatial fog of war. She can move through it, but the further something is, the less visible it becomes.

---

## Fog of War Rules

### Distance Tiers

**Tier 1: Immediate (0-100 pixels)**
- Fully visible, full detail
- Colors saturated, clear
- NPCs show emotions, expressions
- Text/signs fully readable
- Where player character is positioned

**Tier 2: Close (100-200 pixels)**
- 80% visible, slightly faded
- Colors slightly desaturated
- NPCs are recognizable but features less clear
- Text/signs still readable but slightly blurry
- Where immediate action happens

**Tier 3: Medium (200-400 pixels)**
- 50% visible, noticeably faded
- Colors desaturated to gray-tones
- NPCs are silhouettes with general features visible
- Text/signs are vague shapes, hard to read
- Can see what's there but not details

**Tier 4: Far (400+ pixels)**
- 20% visible, nearly transparent
- Mostly silhouettes
- NPCs barely distinguishable
- Signs/text invisible
- Can barely make out shapes

**Tier 5: Beyond (500+ pixels and beyond)**
- Nearly invisible, barely perceptible
- Extreme transparency
- Only vague awareness that something is there
- NPCs disappear entirely
- This is where things behind her are

### Directional Fog of War

**In Front of Character:**
- Fog of war extends forward (she can see where she's going)
- Creates anticipation (things materialize from the fog)
- Tier 1 immediately in front, fading toward tiers 3/4 at horizon

**Behind Character:**
- Fog of war is much denser
- Things she's passed become invisible quickly
- Creates sense of momentum (can't easily turn around)
- Store she came from becomes Tier 4/5 almost immediately

**To Sides:**
- Moderate fog of war
- Can see things peripherally but not clearly
- NPCs passing on sides fade into fog
- Creates sense of isolation (surrounded by unclear space)

---

## First Quest Applied: Fog of War in Action

### Scene 4 Revision: The Streets (With Fog of War)

**Where She Is:**
- Street level, outside her building
- Moving toward corner store

**What Player Sees (With Fog of War):**

**In Front (toward store):**
- Corner store storefront: 80% visible (Tier 2 - Close)
- Store sign: readable but slightly blurry
- Store owner inside: visible shape but face unclear
- Street ahead: visible, colors fade slightly at distance
- Building across street: 50% visible, mostly silhouette (Tier 3 - Medium)

**Around Character (sides):**
- Storefronts on sides: 50% visible, vague shapes (Tier 3)
- Other NPCs: silhouettes, general shapes, but faces/details disappear
- Cars/obstacles: visible enough to navigate
- But general sense of isolation (details fade, world becomes unclear)

**Behind Character (where she came from):**
- Apartment building: fades rapidly to Tier 4 (Nearly invisible)
- The window she left from: barely perceptible
- Anything that was there: disappears almost immediately
- Creates sense that turning back is hard (she'd have to navigate through fog)

**Her Inner Monologue (With Fog of War Awareness):**

*"Corner store is right there. I can see it. The blue awning. That's it."*

But as she walks:

*"Everything else is... fading. The other buildings are just shapes now. Are there people there? I can't tell. Everything behind me is disappearing. I can't see my apartment anymore."*

This reinforces her emotional state (vulnerability, isolation):

*"I'm moving forward and the world is closing in behind me. Everything is getting vague. Even the street around me is becoming unclear."*

---

### Scene 5 Revision: The Corner Store (With Fog of War)

**What Player Sees:**

As she enters the store:

**Inside the Store (Tier 1-2: Clear):**
- Store owner: fully visible, facial features clear, emotions readable
- Other customers: visible but in Tier 2 (slightly faded, less detail)
- Shelves: clearly visible, items readable
- Counter: fully visible, where transaction will happen
- Store is warm, safe, clear

**Looking Out the Window (Tier 3-4: Vague):**
- Street outside: 50% visible, becoming vague
- Other storefronts: silhouettes, details lost
- Buildings: barely visible shapes
- Any patrol she's aware of: just a vague shape in the fog
- Creates sense that outside is unsafe/unclear

**This creates psychological effect:**

*"In here, everything is clear. The store is sharp. The owner's face is clear. I can see what I'm buying. But out there..."*

*"Out there is fog. Out there is unclear. Out there is where the danger is."*

---

### Scene 6 Revision: Back Outside (Panic With Fog)

**What Player Sees:**

As she exits the store:

**In Front (toward home):**
- Apartment building: visible in Tier 2, getting clearer as she approaches
- Street: Tier 2, still navigable
- Creates sense of movement toward safety

**Behind (where store is):**
- Store fades rapidly to Tier 4
- Store owner: gone from view
- Other customers: disappeared
- Store itself becomes vague shape in fog

*"I'm leaving. The store is disappearing behind me. I can't see the owner anymore. Can't see inside. It's all becoming vague. Like it's being swallowed."*

*"And things are appearing in front of me. My apartment is getting clearer. That's good. That's safety."*

**To Sides:**
- NPCs walking: become silhouettes, details disappear
- Other storefronts: vague shapes
- Creates isolation effect (she's alone in a crowd)

*"There are people around me but I can't see their faces. I can't read them. They're just shapes moving in the fog."*

*"One of them could be Watch. One of them could be Bureau. I can't tell from their features because they're all becoming vague."*

This reinforces her hypervigilance while also creating mechanical isolation.

---

## Technical Implementation

### Fog of War Calculation

```javascript
// For each object/NPC in the world:
const distanceToCamera = Math.distance(objectX, objectY, playerX, playerY);
const directionToObject = Math.atan2(objectY - playerY, objectX - playerX);
const playerDirection = playerFacingDirection; // where she's looking

// Calculate directional modifier
// Objects in front are clearer, behind are foggier
const directionDifference = Math.angleDifference(directionToObject, playerDirection);
const directionModifier = Math.cos(directionDifference); // -1 to 1
// If behind (180°): modifier = -1 (foggier)
// If in front (0°): modifier = 1 (clearer)

// Calculate opacity based on distance + direction
let baseOpacity = 1;
if (distanceToCamera > 100) {
  baseOpacity = Math.max(0.2, 1 - (distanceToCamera / 500));
}

// Apply direction modifier (behind is foggier)
const finalOpacity = baseOpacity * (0.4 + (directionModifier * 0.6));
// Objects behind: opacity reduced by 40%
// Objects in front: opacity normal
// Objects to sides: opacity reduced by 20%

object.opacity = finalOpacity;
object.saturation = finalOpacity; // Also desaturate
```

### Fog of War Tiers (Visual)

```javascript
const fogTier = (distance, directionModifier) => {
  const adjustedDistance = distance / (0.4 + directionModifier * 0.6);
  
  if (adjustedDistance < 100) return "Tier1"; // Fully visible
  if (adjustedDistance < 200) return "Tier2"; // 80% visible
  if (adjustedDistance < 400) return "Tier3"; // 50% visible
  if (adjustedDistance < 500) return "Tier4"; // 20% visible
  return "Tier5"; // Nearly invisible
}

// Apply visual effects per tier
switch (tier) {
  case "Tier1":
    object.opacity = 1.0;
    object.saturation = 1.0;
    object.blur = 0;
    break;
  case "Tier2":
    object.opacity = 0.8;
    object.saturation = 0.9;
    object.blur = 1;
    break;
  case "Tier3":
    object.opacity = 0.5;
    object.saturation = 0.6;
    object.blur = 2;
    break;
  case "Tier4":
    object.opacity = 0.2;
    object.saturation = 0.3;
    object.blur = 3;
    break;
  case "Tier5":
    object.opacity = 0.05;
    object.saturation = 0;
    object.blur = 4;
    break;
}
```

### Signs/Text in Fog

**Tier 1-2: Text Readable**
```
[Clear text visible]
"CORNER STORE"
"Open 7am-9pm"
```

**Tier 3: Text Vague**
```
[Blurry, desaturated, hard to read]
"CORNER ▢▢▢▢"
(Can make out it's a store but details lost)
```

**Tier 4-5: Text Invisible**
```
[Just a vague rectangular shape]
(Clearly a sign but can't read anything)
```

---

## First Quest With Fog of War: Updated Scenes

### Scene 4 Revision

**Her Inner Monologue (Noticing Fog):**

*"Everything around me is getting vague. The buildings on the side... I can see they're there but I can't see details. Are there people in those windows? I can't tell. Can't see faces."*

*"Behind me my apartment is becoming invisible. If I turned around right now could I find it? I think so. But it's fading fast. Everything behind me disappears fast."*

*"In front, the store is clear. The blue awning. That's getting clearer as I get closer. The store owner I can see him inside. Getting clearer. That's where I'm going."*

*"The fog of the world is closing in. I'm moving through it. Only what's immediately ahead is real. Everything else is becoming myth."*

### Scene 5 Revision

**Store Interior:**

*"Inside the store everything is sharp again. I can see the owner's face clearly. I can see the other customers. Their expressions. Their clothes. Everything is detailed."*

*"This is the clearest place in the world right now. Everything outside is vague but in here everything is distinct."*

*"Looking out the window from inside... the street is becoming fog. The people walking are just silhouettes. The other stores are barely visible shapes. Like the outside world is becoming unreal."*

**Her psychological reading of this:**

*"In here = safe, clear, real."*
*"Out there = vague, dangerous, unreal."*

### Scene 6 Revision

**Leaving the Store:**

*"The store is disappearing behind me. The owner is gone. The inside is becoming vague. Like I'm being pushed forward by the fog."*

*"Things are materializing in front of me though. My building is getting clearer. That's good. That's safety."*

*"But around me... everything is just shapes. Are there people around me? Yes. But they're silhouettes. Undefined. Could be anyone. Could be danger."*

*"The fog is isolating me. It's pushing me forward. It's making everything behind me inaccessible. I can only move forward. I can only go home."*

---

## Why Fog of War Works

### Mechanical Benefits
- **Efficiency:** Don't render distant objects in full detail
- **Clarity:** Player always has clear focus (what's immediately around/ahead)
- **Navigation:** Easier to understand space (clear path forward, unclear space behind)

### Psychological Benefits
- **Isolation:** World feels lonely (can't see clearly around her)
- **Vulnerability:** Things can emerge from fog unexpectedly (danger)
- **Memory:** Familiar locations are clear in fog (player's spatial memory matches her memory)
- **Immersion:** She's not omniscient (player can't see everything at once)
- **Direction:** Creates natural momentum (hard to turn back, easy to go forward)

### Narrative Benefits
- **No White Veil Fog:** This fog is just spatial distance, not institutional erasure
- **Visual Isolation:** Reinforces her loneliness and vulnerability
- **Hypervigilance:** She can't see clearly, so she's always alert
- **Story Pacing:** Fog reveals information gradually (store becomes clear as she approaches, disappears behind her)
- **World Feels Alive:** Things appear and disappear naturally based on space, not plot

### Player Experience
- **Natural Focus:** Eyes drawn to immediate area and path ahead
- **Safe Interior Spaces:** Entering buildings restores clarity (inside is fully visible)
- **Scary Exteriors:** Open streets have more fog (more vulnerability)
- **Momentum:** Hard to linger or turn back (world pushes her forward)
- **Exploration Reward:** Getting closer to something makes it clear

---

## Special Cases

### Safe Spaces (Apartment, Church, Indoors)
- Fog of war is minimal or disabled indoors
- Everything inside is Tier 1-2 (clear)
- Transition from outside fog to indoor clarity is stark
- Reinforces that indoors = safe, outdoors = unsafe

### Pursuit/Danger Moments
- Fog becomes denser when under stress
- Things behind her disappear faster when fleeing
- Creates cinematic urgency (can't look back, must go forward)
- Player intuitively feels the panic

### Familiar vs. Unfamiliar Locations
- Player gradually learns locations (foggy on first visit, clearer after repeat visits)
- Familiarity doesn't actually change fog mechanically
- But player psychologically expects to see more (creates immersion)

### Darkness/Lighting
- Fog combines with darkness in basements/underground
- Underground locations have maximum fog (can barely see ahead)
- Reinforces depth and danger of descent

---

This is pure atmospheric and mechanical design. The fog of war serves the story, the mechanics, and the player experience simultaneously.
