# BEAUREGARDE — Gameplay Design Brief

**Focus:** Questing system, narrative structure, scroll mechanics, play experience  
**Platform:** React web browser  
**Format:** Side-scroller RPG with employment mini-games

---

## STORY STRUCTURE

### Act 1: Waking Up (0-2 hours)

**The Opening**
She wakes up in an apartment with no memory of how she got there. The room is hers — personal items, her clothes — but she doesn't remember lying down. Time has passed. How much?

**What She Knows Immediately:**
- Her body hurts (cybernetics are active, painful)
- She's been unconscious for days (calendar on wall, dust on surfaces)
- Someone kept her alive (water, bandages, food)
- She doesn't remember the last week

**What She Doesn't Know:**
- Who saved her
- How long she's been running
- Who's looking for her
- Where the people she cares about are

**The Opening Loop:**
1. Wake up, explore apartment
2. Notice confusion, fragmented memories
3. Find calendar (realize days have passed)
4. Feel hunger, thirst, need
5. Leave apartment tentatively
6. Discover The Veil exists around her
7. Panic, return to apartment
8. Sleep, experience nightmare
9. Wake up with fragment memory

**Story Beats:**
- She moves cautiously through the building's hallways (first time outside apartment)
- Meets a neighbor briefly (they react to her visible cybernetics with casual familiarity — she's been here before)
- Finds the street, realizes she's in a district she doesn't remember
- Colors and sounds feel familiar but wrong (fog, neon, jazz music)
- Overheard conversation: "Haven't seen her in weeks. Good to see her up."
- She knows instantly: **she disappeared for weeks**

**Emotional Register:** Disorientation, fear, physical pain, fragmented understanding

---

### Act 2: Integration (2-8 hours)

**The Open World Phase**
Now she can roam The Veil freely. No objectives, no guidance. Just movement and discovery.

**What Happens During This Phase:**
- She explores repeatedly
- Discovers the corner store (buys something, has first minimal interaction)
- Finds the market
- Hears music from the jazz club
- Sees people who seem to know her (or know *of* her)
- Has multiple nightmares, each revealing fragments
- Gradually realizes people in The Veil trust her, or at least know her

**Information Gathering (Passive):**
- Overhears conversations about people who disappeared
- Sees graffiti celebrating Black Wall Street
- Notices fog boundary (where The Veil ends)
- Encounters institutional presence briefly (Watch patrol, she hides)
- Realizes she's being **hunted** (but not aggressively, not yet)

**Memory Surfaces:**
- First nightmare: a face (someone she knew)
- Second nightmare: a location (underground, stone walls)
- Third nightmare: pain (procedures, hands restraining her)
- Fourth nightmare: a name (whispered, "We're coming back for you")

**Relationship Building (Organic):**
- Store owner: she buys drinks multiple times, they start recognizing her
- Market vendor: she walks past repeatedly, eventually stops, watches
- Church: she hears music, enters, sits in back (emotional moment)
- Jazz club: she goes at night, sits alone, listens
- Random NPCs: she helps (carries groceries, listens to problems) without asking

**Emotional Register:** Gradual comfort, emerging trust, increasing dread from memories, physical healing

---

### Act 3: Rupture (Hour 8+)

**Beak Arrives**

After extended exploration and trust-building, one night after a bad nightmare, she wakes up to find **Beak sitting across the room, watching her.**

**The Moment:**
- She panics (violation of safety, someone in her space)
- Beak doesn't react to her panic (he expected it, was waiting)
- He catalogs her fear: "Your heart rate increased 23 bpm. Your breathing became shallow. You're afraid of heights and enclosed spaces."
- **He knows things about her from observation alone**

**What This Reveals:**
- She's never been alone
- She's being watched (not maliciously, just observed)
- Someone is cataloging her patterns, her behavior, her cybernetics
- Her autonomy is compromised

**The Bargain (Implicit):**
He helps her because she's interesting, because her existence helps him understand the program. In exchange, she tolerates his presence, his watching, his questions.

"You're one of theirs. One that got away. I need to understand how."

**Emotional Register:** Violation, fear, realization of danger, understanding of Beak's role

---

### Act 4: Investigation (8-20 hours)

**Knowing What She's Looking For**

With Beak's intrusion as catalyst, she now understands she must actively search. The people she cares about are trapped. She's running out of time (Bureau will eventually find her).

**The Active Investigation:**
- She takes jobs (store, club, market) to earn money, build reputation, access information
- Each job teaches her about The Veil's power structure
- Each conversation with NPCs yields fragments
- She discovers Institutional Threads (evidence the program exists, is documented)
- She discovers Community Threads (stories of people who disappeared, of the program, of resistance)
- She discovers Personal Threads (memories surface, faces become names, names become locations)

**Key Discoveries:**
- The program is real, documented, ongoing
- People are selected for modification (disproportionately Black, SINless, vulnerable)
- The modifications are working (she's proof of concept)
- The Bureau wants her back (she's valuable property)
- But The Veil is hiding more people than just her
- The Underground Railroad network is still operational

**Information Flow:**
- Store owner: block logistics, neighborhood gossip, supply chains
- Market vendor: economic patterns, what's scarce, what's traded
- Church: generational history, names of people underground, spiritual grounding
- Jazz club: networks, who knows who, institutional contacts
- Mechanic: how modifications work, tracking other experiments, program design
- Maintenance: physical access, maps, The Drain location

**Story Progression:**
- She learns enough about one person (from fragments + Community Threads) to become urgent
- That person becomes the focus of her investigation
- All her jobs, all her searching, feeds toward that one goal: **finding that person's location**
- By late Act 4, she has enough Institutional + Community + Personal Threads to know where The Drain is

**Emotional Register:** Urgency, grief, growing rage, determination

---

### Act 5: Descent (20+ hours, Final Act)

**The Undercity**

She finds The Drain. Enters the underground.

**The Final Act:**
- She moves through infrastructure she's mapped through maintenance work
- She encounters institutional machinery directly (not avoided anymore, confronted)
- She finds evidence of ongoing modifications
- She finds the person she's been searching for (alive, modified, possibly unrecognizable)
- She attempts to rescue them (or learns why rescue is impossible)
- She makes a choice about what comes next (exposure, escape, resistance)

**The Emotional Arc:**
- Confronting what the system actually does (not theoretical, visceral)
- Facing the cost of survival (people have died, are dying, will die)
- Understanding her own modification was part of this (she's evidence they can use her)
- Deciding whether to expose, escape, or fight

**Resolution (Varies by Player Choice):**
- Escape the city (survive)
- Stay and coordinate rescue (risk recapture)
- Work with resistance to dismantle (long-term commitment)
- Sacrifice herself to expose (witness purpose)

---

## THE QUESTING SYSTEM (Non-Traditional)

### Shadowrun Genesis Reference Model

Beauregarde's questing system is inspired by **Shadowrun Genesis (Sega Genesis, 1994)** — specifically its **keyword and information economy system.**

**How Shadowrun's System Works:**
- Information is a purchasable commodity (you pay nuyen for leads)
- NPCs hold specific keywords (names, locations, procedures)
- You ask NPCs about keywords, unlocking new dialogue/quests
- Different NPCs know different keywords
- Building information requires cross-referencing multiple sources
- **There is no quest log** — you track information yourself
- Progress happens through network relationships, not objective markers

**Beauregarde's Adaptation:**
Instead of keyword transaction ("buy lead: DARK BLADE for 500¥"), we use **reputation and relationship:** 
- Information flows through trust, not currency
- You ask questions based on what you've overheard
- NPCs share deeper info as relationship deepens
- The information economy is **built on community solidarity**, not commerce
- You're discovering, not purchasing

**The Core Mechanic (Shadowrun → Beauregarde):**
```
SHADOWRUN: Keyword system
  - See NPC, select "Ask about: DARK BLADE"
  - NPC responds with information (if they know it)
  - Move to next NPC with new keyword

BEAUREGARDE: Conversation flow system  
  - Overhear conversation mentioning someone's name
  - Find that person, ask about them
  - They mention another location/person
  - Go there, ask follow-up questions
  - Gradually build picture (no quest log, just memory)
```

**Key Differences:**
- Shadowrun: transactional (money for information)
- Beauregarde: relational (trust for information)
- Shadowrun: keyword-gated
- Beauregarde: conversation-flow-gated
- Shadowrun: information is tradeable
- Beauregarde: information is shared within community

---

### Core Principle: No Quest Log, No Markers, No Objectives

She discovers what needs to be done by **listening, observing, and caring.**

### Three Quest Types

#### Type 1: Organic Requests (Passive)
**How It Works:**
- NPC mentions a problem while talking about something else
- Example: Church mother mentions her water pump is broken while discussing her late husband
- Example: Store owner mentions needing someone to restock while serving customers
- Example: Market vendor mentions a shipment coming in while selling goods

**Player Response Options:**
1. Ignore it (conversation ends, NPC remembers you didn't care)
2. Offer to help immediately (time-sensitive, affects relationship)
3. Come back later to help (still counts, but less urgent)
4. Work the job they're offering (earn money, build reputation)

**Resolution:**
- Help solve the problem → relationship deepens, NPC provides information
- Ignore → NPC becomes more guarded
- Fail to complete → reputation suffers, information harder to access

**Information Yield:** Small threads, reputation change, trust increase

#### Type 2: Investigation Chains (Active)
**How It Works:**
She discovers something suspicious and chooses to investigate.

**Example Chain:**
1. Overhear conversation: "They took Marcus last month"
2. Ask around: "Who's Marcus?" (no one answers directly)
3. Church visit: "Marcus was my grandson. They came in the night."
4. Dream sequence: See a face — it's the person from conversation
5. Market vendor: "Marcus worked supply chains. He knew too much."
6. Mechanic: "Marcus came in asking about modifications. Three days later, he disappeared."
7. Maintenance work: Find Marcus's name in Bureau logs
8. Final discovery: Marcus is in the undercity, Level 3, Section 7

**Player Agency:**
- She can ignore any thread (no penalty, but doesn't progress)
- She can pursue multiple investigation chains simultaneously
- Each investigation reveals different information
- Combining investigations reveals full picture

**Resolution:**
- Complete investigation chain → gain Institutional + Community + Personal Threads → unlock ability/location/job
- Abandon investigation → threads remain undiscovered

**Information Yield:** Major threads, significant relationship changes, access expansion

#### Type 3: Beak's Assignments (Intrusive)
**How It Works:**
Beak observes her, makes demands.

**Examples:**
- "You work at the store. Notice what Bureau agents buy. Report their patterns."
- "The mechanic has Bureau contacts. Find out which ones."
- "You can access maintenance corridors. Map them completely."

**Player Agency:**
- She can refuse Beak (relationship sours, watch increases, survival becomes harder)
- She can pretend to comply (dangerous, Beak notices inconsistencies)
- She can actually comply (gains Beak's resources and information, but moral cost)
- She can use Beak's assignments as cover for her own investigation

**Resolution:**
- Complete assignment → Beak provides information + protection temporarily
- Refuse → Beak becomes unpredictable/hostile
- Manipulate → gain advantage but risk exposure

**Information Yield:** Technical Institutional Threads, dangerous information, complicated moral landscape

---

### How Quests Connect to Employment

Employment isn't separate from quests — **it's the primary mechanism for questing.**

**Example: Store Clerk Investigating Marcus**

1. She takes the store clerk job (earns money, builds trust)
2. While working, she hears customers mention names (thread gathering)
3. Store owner mentions someone disappeared (organic request)
4. She uses the job as cover to ask customers about that person
5. Customer recognizes the name, provides lead
6. New location, new NPC, new job opportunity
7. Investigation deepens through economic access (market vendor knows supply chains)
8. Eventually: full picture of where Marcus is

**Jobs Enable Investigation:**
- Store clerk: overhear gossip, gather threads
- Market vendor: learn economic patterns, supply chains
- Church volunteer: access community history, safe houses
- Jazz club: access networks, overhear secrets
- Mechanic: technical knowledge, tracking people
- Maintenance: physical access, infrastructure maps

**Investigation Enables Jobs:**
- Discovering someone works at market → can get job there
- Learning about Bureau patterns → understand what service jobs are safe
- Finding safe houses → access to protected communities
- Mapping infrastructure → can take maintenance work

---

### Quest Complexity Spectrum

**Minimal Quest:**
- Hear someone mention problem
- Help solve it
- Relationship improves

**Complex Quest Chain:**
- Overhear fragment about missing person
- Takes 5+ conversations with different NPCs
- Requires multiple job shifts to access information
- Needs to visit multiple locations
- Culminates in significant discovery

**Multithreaded Investigation:**
- Multiple missing people, all connected
- Different NPCs hold different pieces
- Has to work different jobs to piece together full story
- Creates bigger picture of program's scope
- Unlocks access to infrastructure/Drain

---

## THE SCROLL MECHANICS & Graphics

### Parallax Scrolling: Three Implementation Variations

**Option 1: Pure WebM Frame Scrubbing (Best Cinematic)**

**Concept:**
- Each background layer is a WebM video file
- As player moves horizontally, scrub through video frames proportionally
- Different layers scrub at different speeds (parallax effect)

**How It Works:**
```
playerX = 100 pixels right
layer.parallaxSpeed = 0.3 (moves 30% as fast as player)
frameIndex = (100 * 0.3) % totalFrames = frame 30
Draw frame 30 of that layer's WebM
```

**Pros:**
- Smooth continuous motion (no frame jumping)
- Single video source creates rich rotating depth
- Video quality = cinematic feel
- Natural lighting/shadows baked into video

**Cons:**
- WebM playback/scrubbing can be unpredictable
- Requires pre-extracting WebM → image sequences
- Frame accuracy issues (may need manual frame syncing)
- Memory intensive if many frames loaded

**Best For:** High-quality cinematic feel, professional-looking result

---

**Option 2: Tiled Background Image Layers (Most Reliable)**

**Concept:**
- Each background layer is a seamlessly-tiling PNG image
- Layer repeats horizontally as player moves
- No video scrubbing needed, just translate the image

**How It Works:**
```
playerX = 100 pixels right
layer.parallaxSpeed = 0.3
layer.translateX = -(100 * 0.3) = -30 pixels
Layer repeats infinitely, so offset by 30 pixels
```

**Pros:**
- Super reliable (no video codec issues)
- Extremely performant (just canvas drawImage with offset)
- Easy to create (draw building, tile it, ensure seamless edges)
- Can add multiple tiled layers for depth

**Cons:**
- Static images, no rotating building effect
- Seam visibility if tiling isn't perfect
- Less cinematic than video

**Best For:** Stable, performant, zero-drama implementation

---

**Option 3: Hybrid Canvas Rendering (Best Flexibility)**

**Concept:**
- Build background as composite canvas drawing
- Each "layer" is pre-drawn once, stored as canvas image
- As player moves, blit different sections of the canvas to screen

**How It Works:**
```
// Create background canvas once
backgroundCanvas.drawImage(buildingVideo_frame1, 0, 0)
backgroundCanvas.drawImage(buildingVideo_frame2, 200, 0)
backgroundCanvas.drawImage(buildingVideo_frame3, 400, 0)
// etc for parallax layers

// On each frame, draw viewport
gameCanvas.drawImage(
  backgroundCanvas,
  sourceX = playerX * parallaxSpeed,  // Source position
  sourceY = 0,
  viewportWidth,
  viewportHeight,
  0, 0, viewportWidth, viewportHeight
)
```

**Pros:**
- Get smooth parallax + WebM quality
- Can bake in complex effects once
- Excellent performance (single composite blit)
- Easy to handle seaming/wraparound

**Cons:**
- Setup complexity (pre-compositing)
- Need to rebuild canvas if scene changes
- One-time cost, then butter-smooth

**Best For:** Professional implementation with custom scene building

---

### Character Animation (WebM)

**Character Sprite Structure:**
```
characterAnimation.webm contains:
- Frame 0-20: Idle pose (loops)
- Frame 21-40: Walk left (loops)
- Frame 41-60: Walk right (loops)
- Frame 61-80: Interaction pose (static)
- Frame 81-100: Distressed pose (loops)
```

**Animation Switching:**
```javascript
// Player moving right
currentAnimation = "walk_right"
animationFrame = (gameTime * 30) % 20 + 41  // 30fps, 20-frame loop starting at 41

// Player stopped
currentAnimation = "idle"
animationFrame = (gameTime * 10) % 20  // Slower idle loop

// Talking to NPC
currentAnimation = "interaction"
animationFrame = 61  // Static pose
```

**Character Position (Relative to Screen):**
- Character stays centered on screen horizontally
- As player moves, background layers shift proportionally
- Character sprite draws at center of screen
- NPCs draw at their world position (translated by parallax)

---

### Vertical Movement with Follow Cam

**Core Mechanic: Rotational Parallax on Vertical Axis**

The key visual effect is **buildings rotating as you move vertically** — just like they rotate horizontally. The camera follows her movement up/down, and the parallax layers rotate around a central pivot point to simulate depth and three-dimensional space.

**How It Works:**

```
playerY = 100 pixels up
layer.parallaxSpeed = 0.3

// Buildings rotate based on vertical movement
rotationAngle = (playerY * parallaxSpeed) * rotationFactor

// Each layer rotates at different rates (parallax depth)
layer1.rotation = rotationAngle * 0.1  // Near layer (rotates more)
layer2.rotation = rotationAngle * 0.05 // Mid layer
layer3.rotation = rotationAngle * 0.01 // Far layer (rotates less)
```

**The Visual Result:**
As she moves horizontally:
- Buildings continuously rotate around their center axis
- Parallax: near buildings spin faster than far buildings
- Creates illusion of moving past rotating structures

As she moves vertically:
- Buildings rotate in the vertical plane (up/down rotation)
- Parallax depth maintained through rotation speed differences
- Creates illusion of ascending/descending through architecture

As she moves diagonally:
- Buildings rotate on multiple axes simultaneously
- Complex 3D rotation effect
- Maximum sense of moving through 3D rotating environment

**The buildings themselves don't tilt or shift perspective. They simply rotate around their center point.** The parallax effect (different layers rotating at different speeds) creates the 3D depth illusion.

**Follow Cam Behavior:**

```javascript
// Camera follows player with slight smoothing
targetCameraY = playerY - (viewportHeight * 0.4)  // Center slightly above middle
currentCameraY += (targetCameraY - currentCameraY) * 0.1  // Smooth lerp

// Viewport shows:
// - What's above her (what's coming)
// - Her position (center-ish of screen)
// - What's below her (what passed)
```

**Screen Layout (Vertical Follow Cam):**
```
[Far above - barely visible, tiny]
[Above - approaching]
[Player Here] ← Camera focuses here
[Below - receding]
[Below - barely visible, tiny]
```

**Example Vertical Journey (Street Level → Apartment):**

**Starting Position (Street Level):**
- Camera shows storefronts at eye level
- Ground visible below
- Sky/buildings above
- Each building layer rotates proportionally as she moves

**Moving Up (Climbing Stairs/Building):**
1. Camera follows her upward
2. Storefronts rotate downward (she's rising past them)
3. Second floor windows come into view above
4. Ground level recedes below
5. Parallax creates illusion of climbing
6. Buildings rotate at different rates = sense of depth

**At Second Floor Level:**
- Apartment windows now at eye level
- Different NPCs visible (apartment residents)
- Street level is now below (receded)
- Rooftop above (coming up)
- Rotation neutral (buildings aligned with her current elevation)

**Moving Down (Descending to Basement):**
1. Camera follows downward
2. Ground level rotates upward (she's sinking below it)
3. Below-ground infrastructure comes into view
4. Street level recedes above
5. Lighting changes as she descends
6. Different parallax layers = feeling of going deeper

**At Basement Level:**
- Stone walls, pipes at eye level
- Darkness above and below
- Infrastructure stretches in all directions
- Only immediate area visible (reduced visibility due to darkness, not fog)

---

**Rotational Parallax as Primary Visual Language**

**This is critical:** The rotation effect IS the depth cue. Unlike fog or visibility reduction, rotation tells the player they're moving through 3D space.

**Why This Matters:**
- No need for visual obscuring (no fog barrier)
- Perspective shift communicates vertical movement
- Each elevation level feels spatially distinct
- Building rotation creates sense of "passing by" structures
- Parallax depth makes clear what's near vs. far

**Technical Implementation Tips:**

```javascript
// For each parallax layer:
// Horizontal rotation (left/right movement)
hRotation = (playerX * parallaxSpeed_h) * rotationFactor_h

// Vertical rotation (up/down movement)  
vRotation = (playerY * parallaxSpeed_v) * rotationFactor_v

// Combined rotation
totalRotation = hRotation + vRotation

// Apply to canvas transform
ctx.save()
ctx.translate(layerCenterX, layerCenterY)
ctx.rotate(totalRotation)
ctx.drawImage(layerImage, -w/2, -h/2)
ctx.restore()
```

**Visual Emphasis (What Player Sees):**
- Horizontal movement: buildings rotate around their centers
- Vertical movement: buildings rotate around their centers (different rotation axis)
- Combined movement: buildings rotate continuously
- Parallax: near buildings rotate faster than far buildings = depth illusion
- **Result: feels like moving through a real 3D rotating environment**

---

**Example Vertical Transitions:**

**Entering an Apartment Building (Street → Second Floor):**
- Walk toward door (horizontal movement continues)
- Press Up to enter
- Camera smoothly follows upward
- Hallway comes into view above
- Street level scrolls down and out of view
- Buildings continue rotating based on movement
- **No screen "cut," just continuous scrolling with rotating parallax**

**Going Underground (Street → Basement/Infrastructure):**
- Find maintenance access point
- Press Down to descend
- Camera follows downward
- Buildings continue rotating around their centers
- Street level scrolls away above
- Below-ground structures come into view
- Lighting dims
- Different parallax layers for depth (pipes, concrete, darkness)
- **Smooth vertical scrolling with continuous building rotation**

**Moving Between Floors:**
- Each floor transition uses continuous building rotation
- No jarring screen changes
- Camera smoothly follows vertical movement
- Buildings spin around their centers at different rates (parallax)
- **Creates immersive sense of vertical navigation through rotating architecture**

---

### The Fog Boundary (No Visual Barrier for Her)

**The Crucial Design Point:**
There is no visual fog boundary for her. The Veil isn't invisible to her — it's invisible to white people. She moves seamlessly between The Veil and white Beauregarde. The transition is **social and atmospheric, not visual.**

**As She Moves from The Veil into Covenant Hill:**

**In The Veil (Warm, Thriving):**
- Warm colors, neon signs, jazz music
- NPCs acknowledge her, make eye contact
- Store owners greet her, vendors chat
- She belongs, she's expected
- Movement feels natural and safe
- Architecture shows care and community

**Crossing Into Covenant Hill (Instant Shift):**
- Colors become cool and corporate
- Music stops (or becomes sterile/absent)
- NPCs stop looking at her
- Conversations redirect away
- Storefronts become glass/corporate
- Architecture becomes brutalist/imposing
- **But she can see everything clearly** — no fog, no reduced visibility
- **The boundary is social, not perceptual**

**What Actually Changes:**
- **Audio:** Jazz/community sounds fade instantly to fluorescent hum
- **NPC Behavior:** People stop greeting her, stop making eye contact, become guarded
- **Lighting:** Sharp institutional lighting replaces warm atmospheric glow
- **Architecture:** Style shifts from ornate/detailed to minimal/sterile
- **Her Movement:** She becomes aware of being watched (surveillance cameras now visible, patrols present)
- **Tension:** Physical safety increases (institutional order), but social safety decreases (she's unwelcome)

**The Mechanical Insight:**
For her, the boundary isn't about **seeing** — it's about **being seen**.
- In The Veil: she's expected, normal, part of the community
- In Covenant Hill: she's visible, suspicious, out of place
- The visibility isn't fog — it's **surveillance and institutional attention**

**Fatigue Mechanics:**
- In The Veil: constant code-switching ends, she relaxes → fatigue recovers
- In Covenant Hill: constant vigilance required, she's always performing a cover → fatigue increases
- **The exhaustion is social, not environmental**

**Information Access:**
- In The Veil: Community Threads flow naturally through conversation
- In Covenant Hill: Institutional Threads require covers, careful questioning, surveillance awareness
- **Accessing information in Covenant Hill is harder because her presence there is harder**

**Return to The Veil:**
- Audio shifts back to jazz immediately
- Tension drops (no more scanning for threats)
- NPCs acknowledge her again
- She can breathe, relax, stop performing
- Community embraces her presence

**Visual Distinction (The Player Sees This):**
- The colors DO shift (warm ↔ cool)
- The architecture DOES change (ornate ↔ brutal)
- The NPCs BEHAVE differently (friendly ↔ guarded)
- The lighting CHANGES (atmospheric ↔ harsh)
- **But there's no fog obscuring the view**
- **Everything is visible, everything is clear**
- **The boundary is that she's visible when she shouldn't be, or invisible when she should be seen**

---

## THE PLAY EXPERIENCE (Moment-to-Moment)

### Exploration Phase

**What It Feels Like:**
- Walking through a living neighborhood
- Not rushed, not pressured
- Stopping to listen to conversations
- Overhearing fragments
- Noticing details (graffiti, signs, people's reactions)
- Slowly recognizing patterns

**Player Actions:**
- Move left/right (explore)
- Move up/down (enter buildings, change vertical space)
- Approach NPC (initiate dialogue)
- Listen without interrupting
- Leave conversation when ready

**No Dialogue Trees:**
- NPC talks (monologue or response to her presence)
- She can listen or leave
- Dialogue happens naturally, not prompted
- She can't "choose" responses mid-conversation
- Her presence itself is the response (listening is engaging, leaving is dismissal)

### Employment Phase

**What It Feels Like:**
- Focused work task
- Time pressure (but manageable)
- Performance matters (affects earnings and reputation)
- Learning the job while doing it
- Overhearing conversations while working
- Building relationships through quality work

**Mini-Game Loop (Store Counter Example):**
1. Start shift (time window: 3-4 in-game hours)
2. Customer enters/approaches
3. Customer states need
4. She processes transaction
5. Customer leaves (happy, neutral, or upset)
6. Next customer approaches
7. Repeat until shift ends or she leaves early
8. Earnings screen (base pay + tips + reputation change)
9. Return to exploration or rest

**Parallel Information Gathering:**
- While working, she overhears NPCs talking to each other
- Conversations about neighborhood, people, problems
- She notes these (doesn't interrupt work)
- After shift, can follow up on overheard information

### Investigation Phase

**What It Feels Like:**
- Detective work, but not gamified
- Following threads of information
- Talking to people who knew the person
- Piecing together patterns
- Gradually building context
- Emotional weight of learning what happened

**Investigation Loop:**
1. Hear fragment (overhearing, job context, NPC conversation)
2. Decide to investigate (or don't)
3. Visit locations connected to fragment
4. Talk to people who might know
5. Piece together context
6. Get new lead
7. Repeat until full picture emerges or trail goes cold

### Memory Phase

**What It Feels Like:**
- Involuntary emotional moments
- Suddenly remembering something painful
- Fragmented, disorienting
- Sometimes triggered by location or person
- Sometimes just happening during sleep

**Memory Mechanics:**
- Happens automatically (she sleeps, nightmare occurs)
- Player experiences disorienting sequence
- Limited control (can observe/move, not direct action)
- Reveals fragment of truth
- May unlock ability or memory thread
- Creates emotional weight to the investigation

---

## PROGRESSION STRUCTURE (Not a Linear Path)

### Three Parallel Progressions

**1. Relationship Progression**
- Different NPCs at different trust levels
- Takes time and repeated interaction
- Affects what information they share
- Affects what jobs they offer
- Can regress if she burns bridges

**2. Information Progression**
- Threads accumulate (personal, community, institutional)
- No "collection complete" moment
- Some threads may never connect
- Some connections take time to realize
- Memory map grows, relationships between threads become visible

**3. Ability Restoration Progression**
- Cybernetics gradually stabilize/restore
- Some unlock through technical repair
- Some unlock through emotional/environmental trigger
- Creates new movement and interaction options
- Opens new areas (once she can climb, rooftops become accessible)

### No Level-Gating

- No "you must reach level X to enter this area"
- All areas accessible from start
- But some areas are more dangerous (institutional presence, surveillance)
- Information gating: some people only talk if trust is high
- Physical gating: can't climb until ability restores
- Economic gating: can't afford some things until employed

### Time as Progression

- Days pass (visible on calendar)
- NPCs age slightly, routines change
- Relationships develop over time (repeated interaction matters)
- Some people disappear if time goes too long
- Institutional pressure increases over time
- Creates natural pacing without hard timers

---

## STORY THEMES

### Institutional Predation
- System operates on multiple levels (visible + hidden)
- Machinery runs whether you see it or not
- Affects people who can't protect themselves
- Justified through language of "wellness" and "improvement"

### Community & Survival
- The Veil exists because institutions failed to protect
- Thriving through mutual aid and hidden economy
- Information shared within community
- Protection through invisibility and solidarity

### Bodily Autonomy & Modification
- Her body was taken and changed without consent
- Cybernetics are violation made mechanical
- Recovering her agency means learning her own body
- Other people's modifications tell the program's story

### Memory & Trauma
- Memories return fragmented, not linear
- Can't access full emotional weight (protection/dissociation)
- Must piece together truth from fragments
- Dreams force processing of what waking mind refuses

### Power & Invisibility
- White Beauregarde can't see The Veil (won't look)
- The Veil is invisible because safety depends on it
- Institutional power operates in plain sight (no hiding needed)
- Underground represents what's below the visible city

---

## ENDING VARIATIONS (Tied to Player Choices)

### Escape Ending
- She gathers enough information to leave the city
- Gets help from Underground Railroad
- Leaves Beauregarde
- People underground remain (bitter, but she survived)

### Resistance Ending
- She coordinates with resistance network
- Plans ongoing operations
- Stays in The Veil
- Accepts risk of recapture for mission

### Witness Ending
- She exposes the program
- Shares all information she gathered
- Creates public knowledge (dangerous)
- Becomes target but gets protection

### Sacrifice Ending
- She descends with intention of freeing people
- Confronts machinery directly
- Succeeds or fails, but changes the system
- Doesn't survive to see results

---

## HEALTH SYSTEM: Visible Heart

**The Visible Heart (Clean UI)**

Instead of a traditional health bar, she has a visible **physical heart** that appears on screen. It's not a UI element — it's a visual part of her character state.

**Heart State Colors:**

**RED (Healthy):**
- Health: 75-100%
- Meaning: Cybernetics functioning normally, well-rested, well-fed
- Visual: Bright red, steady beat, full vitality
- No mechanical penalty

**YELLOW (Stressed/Fatigued):**
- Health: 50-74%
- Meaning: Fatigue building, hunger affecting her, stress from surveillance/danger
- Visual: Yellow-orange, faster heartbeat (visible pulse), slightly irregular
- Mechanical effect: Movement slightly slower, decision-making feels heavier
- Indicates: She needs rest, food, or safety

**BLUE (Critical/Hypothermia/System Failure):**
- Health: 0-49%
- Meaning: Severe fatigue, starvation, cybernetics failing, exposure, trauma response
- Visual: Deep blue, erratic heartbeat (visible flutter/arrhythmia), dimming/pulsing
- Mechanical effect: Movement significantly slower, vision slightly blurred edges, audio becomes muted/distorted
- Indicates: Death is approaching, must find safety/food/rest immediately

**Visual Behavior:**

The heart appears near her character (floating or integrated into her sprite):
- Beats in sync with her physical state
- Red = steady calm beat
- Yellow = faster anxious beat
- Blue = irregular panicked flutter

**Information Conveyed:**
- No quest log, no UI bars, no numbers
- Just her heart's color and rhythm
- Player reads her health state intuitively
- Matches the emotional/physical reality of her experience

**What Affects Heart State:**

**Improves (Returns to Red):**
- Resting in safe space (apartment, church, The Veil)
- Eating food (restores energy)
- Successful social interaction (community care reduces stress)
- Time passing while safe and comfortable
- Completing jobs (sense of purpose/security)

**Worsens (Moves toward Yellow/Blue):**
- Spending time outside The Veil (surveillance stress)
- Going hungry (no food access)
- Encountering institutional presence (Bureau agents, Watch patrols)
- Repeated failed interactions (social rejection, burned relationships)
- Pursuing dangerous investigations (risk of exposure)
- Receiving bad nightmares (trauma processing)
- Going too long without rest

**Mechanical Consequences:**

**Red Heart:**
- Normal movement speed
- Normal interaction speed
- Clear vision, full audio
- Can take small risks

**Yellow Heart:**
- ~80% movement speed (fatigue drag)
- Slower dialogue/interaction (tired responses)
- Very subtle audio/visual distortion (player barely notices)
- Higher fatigue cost for dangerous actions
- Warnings from concerned NPCs ("You don't look so good")

**Blue Heart:**
- ~60% movement speed (barely functioning)
- Very slow interactions (struggling to communicate)
- Screen edges blur slightly (vision narrowing from exhaustion)
- Audio muffled/distorted (hearing difficulty from trauma)
- One more major injury/danger could be fatal
- Some NPCs refuse to interact (too worried about her)
- Movement eventually locks if she doesn't get help

**Recovery Mechanics:**

**Quick Recovery (30 min real-time):**
- Eat food (hunger gone, yellow → red if well-fed)
- Rest in apartment (restores 50% immediately)
- Time in church (spiritual comfort, restore 30%)
- Positive interaction with trusted NPC (small restore, ~10%)

**Slow Recovery (1-2 hours real-time):**
- Spending time in The Veil (passive recovery, ~1% per minute)
- Doing enjoyable jobs (community work, earning money safely)
- Sleep (major recovery, 40-60% depending on how safe she feels)

**Cannot Recover From (Requires Action):**
- Cybernetic damage (requires mechanic repair)
- Deep trauma (requires time + memory processing)
- Institutional attention (requires going unnoticed for time)
- Severed relationships (requires rebuilding trust)

**Design Philosophy:**

The visible heart is **not gamified UI** — it's a **metaphor made mechanical**. Her literal heart's state reflects her lived experience:
- Safety = steady, calm heartbeat (red)
- Stress = racing, anxious heartbeat (yellow)
- Crisis = failing, panicked heartbeat (blue)

No numbers, no bars, no hidden mechanics. Just her **living body** telling the story.

---

## KEY DESIGN PRINCIPLES

### Show, Don't Tell
- No exposition, no explanations
- World communicates through environment and NPC behavior
- Player discovers everything through exploration and conversation

### Permanent Consequences
- One save file, continuous timeline
- Choices made cannot be undone
- Burned relationships take time to rebuild
- Some paths close if key NPCs die
- Creates weight to decision-making

### Agency Without Guidance
- No quest markers, no objectives
- No tutorial, no handholding
- Player chooses what matters
- World responds to choices, not judges them

### Survival As Mechanic
- Money matters (rent, food, repairs)
- Employment is survival, not just income
- Fatigue matters (crossing boundaries exhausts her)
- Time pressure is organic (Bureau searching, people underground)

---

This is the core gameplay. Everything else (visual style, color palette, NPC appearances) flows from these mechanics.
