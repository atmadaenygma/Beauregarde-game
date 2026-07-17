# HATCHLING — Design Addendums & Revisions

**Date:** Current  
**Version:** 2.0 (Scope Refinement)  
**Purpose:** Document major design decisions, changes, and rationale

---

## ADDENDUM 1: Jazz Club as Central Hub (Church → Jazz Club)

### Decision

**Replace church as main location with jazz club.**

The church was originally positioned as:
- Spiritual refuge
- Community gathering space
- Safe haven for grief
- Information source (church mother as confidant)

**This is being replaced with jazz club because:**

#### Thematic Superiority

**Church representation:**
- Spiritual refuge (expected, passive)
- Community gathering (static, formal)
- Safe space (predictable)

**Jazz club representation:**
- **Bleeding edge of The Veil's cultural resistance**
- Music as Black cultural survival (historically rooted)
- Information flows naturally through social interaction
- People lower guards in social/intoxicated states
- Institutional attention less direct (less watched)
- Community **actively defiant** rather than passively safe

#### Mechanical Superiority

**Church as info hub:**
- Static location (people come to pray/grieve)
- Formal interactions (confessional tone)
- Limited conversation variety
- Safety but not vitality

**Jazz club as info hub:**
- Dynamic location (people come to socialize, drink, dance, connect)
- Natural conversation flow (alcohol loosens lips)
- Multiple NPCs, multiple conversation threads simultaneously
- Crowded (overhearing is primary discovery method)
- Regular customers (relationship building through routine)
- VIP back rooms (secrets, planning, resistance coordination)
- Owner is power broker (connects to entire community network)

#### Narrative Superiority

**Church structure (old):**
```
Player meets church mother
→ Church mother directly shares information about Marcus
→ Church mother becomes confident
→ Church becomes safe haven
```

**Jazz club structure (new):**
```
Player works as server/bartender
→ Overhears conversations between other customers
→ Gradually learns about Marcus through fragmented mentions
→ Musicians and bartender become sources of information
→ Club owner eventually reveals he runs resistance network
→ Club becomes center of community and resistance
→ She realizes she's not isolated—she's joining something existing
```

The jazz club structure aligns with **ICO's "show don't tell"** approach. Information emerges through listening, not exposition.

### Implementation Changes

**Location Updates:**
- Remove: `church_interior` location
- Add: `jazz_club_interior` location with multiple zones (bar, tables, stage, VIP room, back kitchen, upstairs apartments/offices)

**NPC Updates:**
- Remove: `church_mother` as primary confidant
- Add: `club_owner` as primary information hub and resistance coordinator
- Keep: Musicians, bartender, regular customers as secondary sources
- Musicians become witnesses to institutional activity (they travel)

**Job Updates:**
1. Store Clerk → Neighborhood intel, economic survival (unchanged)
2. **Jazz Club Server/Bartender** → Information hub, resistance contacts, community bonds (NEW PRIMARY)
3. Market Vendor → Supply chain knowledge (unchanged)
4. Mechanic → Technical knowledge, escape prep (unchanged)
5. Maintenance → Infrastructure access, Drain location (unchanged)

**Quest Updates:**
Marcus investigation thread now flows through jazz club:
- Overhear musician mention Marcus
- Bartender mentions grandmother comes Fridays
- Club owner reveals Marcus was asking dangerous questions
- Investigation deepens through club conversations and overheard gossip

**Dialogue Updates:**
- Remove all church-specific dialogue
- Create jazz club ambient conversations
- Add overheard NPC conversations (key storytelling device)
- Bartender serves as secondary dialogue hub
- Musicians provide traveling information

**Audio Updates:**
- Jazz music becomes **diegetic** (actually playing in club, not just ambiance)
- Different songs = different moods/information about world state
- No music playing = institutional danger or community disruption
- Music style changes reflect story progression

---

## ADDENDUM 2: ICO-Influenced Storytelling (Show Don't Tell)

### Decision

**Implement "less is more" storytelling philosophy inspired by ICO.**

**Reference:** ICO (PlayStation 2, 2001)
- Minimal dialogue
- Maximal player discovery
- Environmental storytelling
- Physical interaction creates meaning
- Ambiguous narrative (player interprets)
- Character development through *actions and discoveries*, not exposition

### Philosophical Shift

**Old approach:**
- NPCs explain events through dialogue
- Quests spelled out through monologue
- Exposition through conversation
- Information given directly

**ICO approach:**
- NPCs mentioned things casually (not explaining)
- Quests discovered through listening/observing
- Exposition through environment and overheard conversation
- Information pieced together by player

### Practical Changes

#### Dialogue Reduction (60% Cut)

**Remove:**
- Exposition dumps ("The program did X because Y")
- Timeline explanations ("This happened, then that happened")
- Context provision ("Here's why this matters")
- Quest clarification ("Find this person and learn about that")
- Backstory recitation ("I used to work for X, which led to Y")

**Keep:**
- Personal emotional dialogue (grief, fear, hope)
- Practical information (where to find things)
- Relationship building (establishing trust)
- Behavioral dialogue (what people actually say day-to-day)
- Overheard conversations (NPCs talking to each other, not player)

**Example:**

Old approach:
```
Store Owner: "Marcus worked for me in supply logistics. He asked questions about 
where medical shipments went. I think he discovered the program. Bureau agents 
came looking for him. He disappeared. I think they took him. He was like a son to me."
```

ICO approach:
```
Store Owner: "Marcus used to come by. Smart kid."
(Pause. He turns away.)

[Later conversation, after trust builds:]
Store Owner: "His supply route just... stopped one day."

[Player infers: Something happened, he didn't choose to leave]
```

#### Environmental Storytelling

**Add:** Physical clues that tell stories without dialogue

Examples:
- Marcus's jacket still hanging in store (he left suddenly, didn't return for belongings)
- Medical papers under church mother's floorboards (or jazz club owner's office) → someone was keeping records of disappeared people
- Unusual cybernetic parts in mechanic's workshop → he's repairing escaped subjects
- Empty stalls in market → people disappeared, economic disruption
- Her apartment photos she doesn't remember → she has a history she can't access
- Safe house infrastructure in club basement → active resistance network

**Purpose:** Player learns world through observation, not explanation.

#### Overheard Conversations as Primary Information Source

**Create:** Ambient dialogue where NPCs talk to each other (not the player)

While working jazz club shift:
```
Musician A to Musician B: "You hear about Marcus?"
Musician B: "The kid who worked supply routes?"
Musician A: "Yeah. Haven't seen him in months."
Musician B: "Bureau came through asking questions."
Musician A: "Yeah. Then he was gone."
```

**Player:** Overhears, doesn't interrupt. Learns naturally.

This is MUCH more powerful than NPC explaining to player.

#### Her Thoughts Become Uncertain Processing

**Old:**
```
*"They modified me. This is clearly the program's work. These are advanced cybernetics."*
```

**ICO:**
```
*"These modifications. Who did this?"*
*"They're too precise. Too sophisticated."*
*"Someone knew exactly what they were doing."*
*"Was this... intentional? Or did something go wrong?"*
```

**She processes uncertainty. Player wonders with her. Neither of you are sure.**

#### Fog of War & Silence Create Narrative Tension

**Instead of explaining danger:**

She hears footsteps behind her. Her heart races (visible through thought).
Fog of war prevents her seeing who's there.
Her thoughts: *"What was that? Are they following me? Should I run?"*

**No exposition. Pure experience.**

### Implementation Steps

1. **Rewrite all NPC dialogue** to cut exposition by 60%
2. **Create overheard conversations** as primary information source
3. **Add environmental clues** that tell stories without words
4. **Refactor her thoughts** to be uncertain processing, not exposition
5. **Use silence and fog** to create tension
6. **Trust the player** to piece together meaning

---

## ADDENDUM 3: Scope Finalization (Dropping Metroidvania Elements)

### Decision

**Drop complex vertical exploration (jump/hang/climb/strafe) as primary mechanic.**

**Why:**
- Vertical gameplay requires action-game design expertise
- Your game is conversation-based, not action-based
- Vertical navigation becomes *obstacle* instead of *experience*
- You don't have movement-focused narrative to justify parkour
- Adds 2-3 months to development for minimal thematic gain

### What Gets Dropped

**From Debug Menu:**
- Strafe mechanics testing
- Complex air control tuning
- Jump power multipliers
- Hang system debugging

**From Game Design:**
- Multi-level vertical puzzle solving
- Parkour sequences
- Timed vertical navigation
- Complex climbing mechanics

### What Gets Kept (Simplified)

**Basic vertical navigation:**
- Stairs (walk up/down naturally)
- Ladders (hold button to climb, slow, methodical)
- Jump gaps (simple binary: can make jump or can't)
- Ledges (grab naturally when jumping into them, no complex hanging)
- Rooftop access (simple climbing ladder to rooftop)

**Why this works:**
- Matches side-scroller exploration
- No action sequences
- Maintains navigational pacing
- Fog of war handles tension (can't see far ahead)
- Vertical spaces still tell stories (rooftop view of The Veil, basement danger)

### Vertical Spaces That Remain

**The Veil (Ground Level):**
- Street level (storefronts, street level NPCs)
- Second floor (apartments, offices, jazz club upstairs)
- Basement (storage, safe houses, maintenance access)

**Jazz Club Specific:**
- Ground floor (bar, tables, stage)
- Upstairs (office, apartments, living quarters)
- Rooftop (vantage point, escape route)
- Basement (kitchen, storage, **resistance safe house**)

**Mechanic Workshop:**
- Ground level (main workshop)
- Storage shelves (climbing for parts)
- Underground access (leads to maintenance)

**Maintenance/Infrastructure:**
- Street level access
- Multiple depths below (stairwell descent)
- Lateral horizontal tunnels
- Final depth (The Drain access)

### Debug Menu Updates

**Remove vertical tabs:**
- Complex jump/hang/climb testing simplified
- Air control debugging removed
- Gravity multiplier removed
- Ledge grab precision removed

**Keep simple:**
- Teleport to any Z level (elevator-style)
- Test basic navigation (can I reach this area?)
- Fall/land testing (simple state checks)

---

## ADDENDUM 4: Game Length & Development Timeline

### Scope Definition

**Game Length:** 15-20 hours per playthrough
- Investigation-focused (not action-focused)
- Single linear path (not branching)
- One save file (permanent consequences)
- Replayability through **interpretation** (what does story mean?) not mechanical variation

**Development Timeline:** 6-9 months solo
- If 2-3 person team: 4-6 months
- Includes iteration, playtesting, polish

### What This Scope Includes

✓ The Veil district (primary exploration area)
✓ Jazz club as central hub with full interior/systems
✓ 5-6 core NPCs with full dialogue/character arcs
✓ Marcus investigation thread (complete arc)
✓ Program discovery (partial understanding, not complete)
✓ Descent preparation (builds toward descent, may not complete full descent in MVP)
✓ 5 playable jobs with mini-games
✓ Full thought/monologue system
✓ Complete debug menu
✓ Hot reload markdown file system

### What This Scope EXCLUDES

✗ Multiple districts (Covenant Hill, multiple Veil zones)
✗ Full descent into The Drain (can prepare, may not fully explore)
✗ 10+ NPCs (5-6 core, 3-4 supporting)
✗ 30+ hours of content
✗ Action/combat gameplay
✗ Multiple endings (single ending, player-interpreted meaning)
✗ Complex vertical platforming
✗ Full economic simulation (stripped down to basics)
✗ Metroidvania progression gates

### MVP Definition

**Minimum Viable Product (3-4 months):**
- Single district (The Veil)
- Jazz club functional
- 3 jobs (store, club, one other)
- Marcus investigation thread completable
- 3 core NPCs functional
- Thought system working
- Hot reload system working
- Playable proof-of-concept

**Full Game (6-9 months):**
- All 5 jobs
- All 5-6 NPCs
- Full Marcus arc
- Descent preparation (maybe beginning of descent)
- Complete thought system
- Polish, iteration, bug fixes

---

## ADDENDUM 5: Music & Audio (Jazz as Narrative Device)

### Decision

**Jazz music becomes diegetic storytelling tool, not just ambiance.**

### What This Means

**Diegetic music:** Music exists in the world (characters can hear it, not just player)

**In jazz club:**
- Live musicians playing on stage
- Player hears actual songs (not UI ambiance)
- Different songs different nights (patterns player learns)
- Music quality reflects community mood
  - Upbeat, energetic = community is strong, safe
  - Melancholic = community is grieving something
  - Absent = institutional danger, club closed for safety

**Outside club:**
```
Player in apartment: Can hear distant jazz from club (world-building)
Player in store: Might hear club music if adjacent (spatial awareness)
Player outside Veil: Music gradually fades (leaving safety)
Player in Covenant Hill: No music (institutional silence)
Player in maintenance: Industrial drones replace jazz (different world)
```

### Specific Implementation

**Jazz Club Music System:**

```
Monday-Thursday: Different upbeat set
(Community is stable, jazz is celebration)

Friday-Saturday: More melancholic, intimate set
(Grandmother comes Fridays - memorial vibe)

If major institutional event happens:
- Club goes quiet (safety precaution)
- No live music for 2-3 days
- When music returns, different song (defiance)

If resistance action succeeds:
- Return to upbeat jazz
- Player hears it and understands: Something broke. Community won.
```

**No exposition needed. Music tells the story.**

### Audio Design Philosophy

**The Veil has voice through jazz:**
- Synth/electronic jazz (cyberpunk aesthetic)
- Black American musical tradition (roots)
- Improvisation (resistance, adaptation)
- Live performance (community participation)

**This is not background music. This is the world communicating.**

---

## ADDENDUM 6: Life Simulation Scope Reduction

### Decision

**Simplify economic system. Remove complex daily grind.**

**Old approach:**
- Detailed daily routines (mandatory)
- Complex rent/food/repair costs
- Time management puzzle
- Weekly events, seasonal changes
- NPCs aging, disappearing over time

**New approach (Light Sim):**
- Jobs available when player chooses
- Money matters (basic survival pressure)
- Food affects hunger/performance (simple tracking)
- Time passes (NPCs have schedules), but not complex
- Repairs needed (failure state), but optional timing
- No mandatory daily loop

### Why

**Full sim becomes grinding:** Work shifts feel like obligation, not discovery

**Light sim feels purposeful:** Work shifts feed investigation, player chooses timing

### Implementation

**Money system:**
- Basic survival costs (food, rent basics)
- Not a puzzle (simple tracking)
- Work for investigation access (primary motivation)

**Time system:**
- Days pass (visible on calendar)
- NPCs have schedules (some only available certain days)
- Major events can happen (institutional crackdown)
- Not a timer (no "you have 30 days" pressure)

**Jobs:**
- Player chooses when to work
- Each shift = 3-4 hours of game time
- Work feeds investigation
- Jobs can be ignored (only poverty consequences, not game-over)

### Scope Impact

**This reduces:**
- NPC scheduling complexity
- Economic system detail
- Time system intricacy
- Content needed for daily variation

**This maintains:**
- Work as information access
- Economic pressure as motivation
- Time progression feeling real
- Character development through work relationships

---

## ADDENDUM 7: One Save File, Permanent Consequences

### Decision

**Single continuous save file. No branching. Permanent consequences.**

**This means:**
- Player makes choice → consequence is permanent
- Can't reload to undo mistakes
- Some NPCs can die/disappear
- Some investigation paths can close
- Choices matter in real way

### Why This Matters

**For Shadowrun Genesis:** Information economy works best with single timeline
**For character development:** Real choices create real growth
**For player experience:** Consequences make discovery meaningful
**For replayability:** Different choices yield different stories (replay to see paths not taken)

### Examples

**Marcus investigation:**
- If she ignores him for 10+ game days, trail goes cold
- Some NPCs stop mentioning him (moved on)
- Investigation still possible, but harder
- She missed the window

**NPC availability:**
- If she burns trust with club owner, he stops helping
- Rebuilding takes time
- Some information is now inaccessible
- Choice had real consequence

**Descent preparation:**
- If she goes unprepared, she dies
- Can't reload and try again
- Death is ending
- Preparation mattered

---

## ADDENDUM 8: Hatchling Setting Details

### Jazz Club Integration into The Veil

**Jazz club is now the spiritual/resistance center of The Veil.**

**Why:**
- Jazz = Black cultural resistance (historical fact)
- Live music = community vitality
- Social gathering = information flows
- Club owner = power broker
- Basement = safe house network

**The Veil now consists of:**
1. **Residential zone** (her apartment, other homes)
2. **Market district** (economic survival)
3. **Jazz club district** (cultural/resistance heart) ← NEW CENTER
4. **Mechanic workshop** (technical support)
5. **Maintenance access** (infrastructure gateway)

### Clock Tower / Landmark

**Consider adding:** A clock tower or community landmark in The Veil visible from multiple locations

**Purpose:**
- Visual reference point (player understands geography)
- Community symbol (shows The Veil's identity)
- Time marker (visible progression through day)
- Vertical landmark (visible from multiple elevations)

### Covenant Hill Contrast

**Keep as secondary area (not primary):**
- Institutional sterility (contrast to jazz club warmth)
- Surveillance presence (fog of war different type)
- Unwelcoming architecture (brutalism)
- Institutional music replaced by silence/machinery

**Player rarely goes there (unless necessary for investigation)**

### The Drain (Undercity)

**Remains as final descent location:**
- Infrastructure systems
- Experimental chambers
- Where Marcus likely is
- Where program operates
- Dark, cold, hostile

---

## ADDENDUM 9: Character Sheet Updates

### Protagonist (No Name Yet)

**Remains:**
- Black woman, 25-35 years old
- Cybernetic modifications (arms primary)
- Trauma/PTSD (dissociation, fragmented memory)
- Intelligent, hypervigilant, determined

**Add:**
- Jazz club connection (might have worked there before?)
- Possible pre-program relationship with The Veil music culture
- Her modifications might have targeting/tracking elements (explains hunting)

### Club Owner (New Primary NPC)

**Role:**
- Information hub
- Resistance coordinator
- Community protector
- Marcus knew him (or Marcus's grandmother does)

**Character:**
- 45-60 years old
- Runs club for decades
- Connected across entire community
- Non-violent (uses information, not force)
- Loves The Veil, protective of its people

**Arc:**
- Stranger: Bartender treats her professionally
- Acquaintance: Club owner notices she's asking questions
- Contact: Owner cautiously shares Marcus information
- Ally: Owner reveals he runs safe house network
- Confidant: Owner asks her to help resistance effort

### Secondary NPCs

**Grandmother (Marcus's):**
- Comes to jazz club every Friday
- Sits quietly, listens to music, grieves
- Becomes emotional touchstone
- Player realizes: he's not just a name, he's someone's beloved

**Musicians:**
- Witnesses (travel, see institutional activity)
- Confidants (players overhear their conversations)
- Can be resistance contacts
- Bring outside information

**Bartender:**
- Information funnel
- Listens without judgment
- Secondary source of Marcus information
- Can direct her to club owner when trust is ready

---

## ADDENDUM 10: Memory & Knowledge Cutoff

**This addendum document supersedes previous design docs on:**
- Church/spiritual locations (now Jazz Club)
- Exposition dialogue (now ICO minimal style)
- Vertical exploration complexity (now simplified)
- Economic simulation depth (now light sim)
- Game length assumptions (now 15-20 hours)

**Previous docs remain valid for:**
- Shadowrun Genesis quest system (unchanged)
- Fog of war mechanics (unchanged, enhanced by jazz club)
- Inner monologue/thought system (unchanged)
- Debug menu (scope adjusted, core system same)
- Markdown file structure (same, content updated)
- Coordinate system (unchanged)
- Heart health system (unchanged)

**Next design phase:**
- Update all `.md` files in `/game_data/` to reflect jazz club + ICO approach
- Create sample quest chains (Marcus investigation, program discovery)
- Write sample dialogue (overheard conversations, minimal direct dialogue)
- Design jazz club layouts and spaces
- Finalize NPC profiles with new jazz club integration

---

## Summary of Changes

| Element | Old | New | Reason |
|---------|-----|-----|--------|
| Main Location | Church | Jazz Club | Stronger thematic fit, better info hub |
| Storytelling | Exposition dialogue | Show/don't tell (ICO) | More immersive, player-interpretive |
| Primary Info Source | Direct NPC dialogue | Overheard conversations | More natural, trusted, engaging |
| Vertical Gameplay | Complex parkour | Simple navigation | Simpler scope, matches game focus |
| Life Simulation | Complex daily grind | Light sim (optional jobs) | Less mandatory, more investigative |
| Save System | Multiple saves | Single save | Permanent consequences |
| Game Length | 20-40 hours | 15-20 hours | Realistic scope, quality over quantity |
| Primary Relationship | Church mother | Club owner | Better aligned with resistance theme |

---

**All design decisions going forward should reference these addendums.**

