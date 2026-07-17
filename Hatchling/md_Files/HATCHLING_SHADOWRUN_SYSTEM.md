# HATCHLING — Shadowrun Genesis Quest System: Design Decisions

## Reference Model: Shadowrun Genesis (Sega Genesis, 1994)

Hatchling's questing system is built on the **information economy framework** from Shadowrun Genesis, but adapted for a community-solidarity model instead of a transactional one.

---

## Key Shadowrun Genesis Mechanics We're Using

### 1. Information as Progression Currency

**Shadowrun Genesis:**
- NPCs hold specific information/keywords
- You pay money (nuyen) to buy leads and information
- Different NPCs have different keywords
- Information is a tradeable commodity
- No quest log tracks it; player manages manually

**Hatchling Adaptation:**
- NPCs hold specific information/threads
- You earn information through **relationship trust**, not currency
- Different NPCs know different threads (store owner vs. church vs. mechanic)
- Information flows within community solidarity, not commerce
- No quest log; player builds memory map mentally (visual memory map eventually)

**Why We Changed From Transaction to Relationship:**
- Shadowrun is mercenary/capitalist (money drives everything)
- Hatchling is community/solidarity (people share within their network)
- She's not buying information, she's being trusted with it
- Deeper thematic alignment with Black mutual aid traditions

---

### 2. No Quest Log / No Quest Markers

**Shadowrun Genesis:**
- No UI quest log
- No objective markers
- Player tracks information manually (paper, memory, notes)
- Progress is invisible; player creates their own tracking system
- You can forget threads and have to revisit NPCs

**Hatchling Adaptation:**
- No quest log in UI
- No objective markers on map
- Player tracks information through **inner monologue** (her thinking about discoveries)
- Visual memory map shows connections (threads as nodes, red string connections)
- NPCs can be revisited; information deepens with trust

**Why No Quest Log:**
- Matches Shadowrun's design philosophy (information is organic, not automated)
- Keeps UI clean (she only has visible heart, no UI clutter)
- Reinforces that player is discovering, not following objectives
- Information gaps feel real (she doesn't always remember everything)

---

### 3. Keyword System → Thread System

**Shadowrun Genesis Keywords:**
```
Example: You learn keyword "DARK BLADE"
You ask every NPC about DARK BLADE
They respond with information (if they know it)
You compile information from multiple sources
You now understand what DARK BLADE is
```

**Hatchling Threads System:**
```
Example: You overhear "They took Marcus last month"
You ask around about Marcus
- Store owner: "Never heard of him"
- Market vendor: "Oh, Marcus? He worked supply. Smart kid."
- Church: "Marcus was my grandson. They took him."
- Mechanic: "Marcus came in asking about modifications. Then gone."
- Maintenance logs: "Marcus — missing, location unknown"

You compile these conversations
You now understand: Marcus was an escapee, was taken, is missing

This is a THREAD in your memory map
```

**Thread Categories (Like Keywords, But Emotional):**
- **Personal Threads:** About specific people (Marcus, the Exarch's daughter, Hat Man)
- **Community Threads:** History and context (Black Wall Street, Underground Railroad, church elders)
- **Institutional Threads:** Evidence and documents (Bureau procedures, experiment logs, surveillance patterns)
- **Location Threads:** Physical places (The Drain entrance, safe houses, infrastructure)

---

### 4. Network Dependencies (Know One Person → Access to Others)

**Shadowrun Genesis:**
- Talk to one NPC, they reference another NPC by name/keyword
- Following keywords leads you to new NPCs
- You build a network map through information flow
- Cannot access certain NPCs/areas without knowing right person first

**Hatchling Adaptation:**
- Talk to store owner, they mention church mother
- Talk to church mother, she mentions mechanic
- Mechanic mentions underground contacts
- Each relationship unlocks new NPCs and locations
- Employment creates these network bridges (job at store → meet more people through customers)

**Example Chain:**
```
Start: Store owner
  ↓
"You should talk to the church"
  ↓
Church mother (who knows history)
  ↓
"My grandson Marcus disappeared, they took him"
  ↓
Market vendor (who mentions Marcus)
  ↓
"Yeah, Marcus worked supply chains"
  ↓
Mechanic (who mentions seeing Marcus)
  ↓
"He asked about modifications tracking"
  ↓
Maintenance foreman (who reveals Drain location)
  ↓
"Underground maintenance logs show experiment subjects here"
  ↓
Full picture: Marcus was experimented on, is in Drain
```

**Why Network Dependencies:**
- Matches Shadowrun's discovery mechanic
- Forces organic progression (can't skip steps)
- Creates emergent gameplay (different conversation orders yield different understanding)
- Reinforces community interconnection (people know each other, reference each other)

---

### 5. No Central Authority / Information System is Distributed

**Shadowrun Genesis:**
- No "quest giver" NPC who has master list
- Information scattered across many NPCs
- No single person knows everything
- You must synthesize information from multiple sources

**Hatchling Adaptation:**
- No "quest giver" (no mysterious informant, no rebel leader with master plan)
- Information scattered: store owner knows economics, church knows history, mechanic knows tech
- No single person understands the full scope (not even Beak)
- Player must synthesize (overhear → ask → piece together → memory map shows connections)

**Example: Understanding the Program**
```
Store owner: Supply chains show unusual shipments to institutional zone
Market vendor: Medical supplies disappearing from distribution
Church: People disappearing, specifically from poorest neighborhoods
Mechanic: Cybernetic modifications being asked about by nervous people
Maintenance: Underground infrastructure being built/expanded secretly
Memory logs: Names, faces, procedures you've witnessed

Full picture: Systematic eugenics program targeting Black community
```

**Why Distributed:**
- Matches Shadowrun's epistemic model (information is fragmented)
- No single "plot exposition" NPC (keeps narrative organic)
- Player becomes the investigator (you're doing detective work)
- Reinforces that institutional operations are hidden across many layers

---

### 6. Relationship as Information Gate

**Shadowrun Genesis:**
- Low relationship = NPC refuses to talk / gives minimal info
- Medium relationship = NPC shares some information
- High relationship = NPC tells you secrets they wouldn't tell strangers

**Hatchling Adaptation:**
- **Stranger level:** NPC is polite but guarded, shares surface information only
- **Acquaintance level:** NPC has spoken to you multiple times, shares neighborhood gossip
- **Contact level:** NPC considers you trustworthy, shares personal stories and threads
- **Ally level:** NPC trusts you deeply, shares dangerous information and access to networks
- **Confidant level:** NPC considers you part of their inner circle, shares everything including risk

**Example: Information Access by Trust Level**

Store Owner Trust Progression:
```
Stranger: "Welcome to the store."
  ↓ (after 3 visits)
Acquaintance: "Good to see you. Neighborhood's been quiet."
  ↓ (after offering to help/working)
Contact: "Between you and me, supply chains are weird. Someone's buying a lot of medical stuff."
  ↓ (after 5+ visits and positive interactions)
Ally: "You need to know something. People are disappearing. Specifically from The Veil. It's systematic."
  ↓ (after job or deep connection)
Confidant: "Marcus worked for me. They got him. I think they're coming for more. Be careful."
```

**Why Trust Gates Information:**
- Matches Shadowrun's relationship system
- Information feels earned, not given
- Creates natural progression (can't know everything immediately)
- Respects that trust is slow to build in community
- Reinforces that she must prove herself to gain access

---

### 7. Investigation Chains (Following Threads to Completion)

**Shadowrun Genesis:**
- You learn one keyword
- You ask everyone about that keyword
- You learn new keywords
- You follow them until the chain completes
- Completing a chain unlocks new areas/NPCs/information

**Hatchling Adaptation:**
- You overhear fragment: "They took Marcus"
- You ask around about Marcus
- You learn Marcus worked with supply chains
- You ask supply contacts about him
- You learn he disappeared after asking about modifications
- You ask mechanic about modifications
- You learn about tracking systems in cybernetics
- You ask about where experiments happen
- You learn about The Drain location
- Investigation chain complete: Marcus was taken, is experimented on, location known

**Investigation Chain Benefits:**
- Unlocks new location access (The Drain)
- Unlocks new job opportunity (mechanic work)
- Unlocks new trust with key NPCs
- Reveals piece of larger picture (program scope)

**Why Investigation Chains:**
- Matches Shadowrun's progression system
- Player agency in what to investigate (can ignore Marcus, pursue different thread)
- Multiple chains can exist simultaneously (Marcus, other escapees, Beak, etc.)
- Completion feels earned (not given by quest giver)

---

### 8. Employment as Information Source

**Shadowrun Genesis (Implicit):**
- Taking jobs puts you in position to overhear conversations
- Certain jobs (street work, crime, corporate) give you different information access
- Your employment location determines what NPCs approach you

**Hatchling Adaptation:**
- **Store clerk:** Hear economic information, neighborhood gossip, supply patterns
- **Jazz club server:** Hear network connections, overheard secrets, important meetings
- **Market vendor:** Hear supply chain info, economic stress, what's scarce/abundant
- **Church volunteer:** Hear generational history, spiritual context, safe house locations
- **Mechanic assistant:** Hear about modifications, tracking, other escapees
- **Maintenance:** Hear infrastructure secrets, Drain location, surveillance patterns

**Why Employment as Information Source:**
- Matches Shadowrun's "where you work determines what you learn"
- Makes employment meaningful (not just for money)
- Different jobs unlock different information types
- Reinforces that work gives you access to different networks

---

## Design Decisions We Made

### Decision 1: No "Quest Giver" NPC
**We chose:** No central source of quests
**Why:** Matches Shadowrun's distributed information model, keeps narrative organic
**Alternative rejected:** Having Beak or an Underground leader assign quests (too gamified, too centralized)

### Decision 2: Information Flows Through Trust, Not Currency
**We chose:** Community solidarity model (information shared because you're trusted)
**Why:** Thematic alignment with Black mutual aid, more personal than transactional
**Alternative rejected:** Shadowrun's direct transaction model (feels mercenary, doesn't match setting)

### Decision 3: No Visible Quest Log UI
**We chose:** Player tracks information through inner monologue and memory map
**Why:** Keeps UI clean, matches Shadowrun's manual tracking, reinforces discovery
**Alternative rejected:** Full quest log with objectives (too gamified, breaks immersion)

### Decision 4: Multiple Investigation Chains Simultaneously
**We chose:** Player can pursue multiple threads at once, in any order
**Why:** Open-ended discovery, respects player agency, matches Shadowrun's non-linearity
**Alternative rejected:** Linear quest progression (would reduce player choice)

### Decision 5: Employment Unlocks Information Access
**We chose:** Different jobs give access to different NPCs and information types
**Why:** Makes employment meaningful, creates natural network access, matches Shadowrun's job-based progression
**Alternative rejected:** Employment as purely economic (would be separate from narrative)

### Decision 6: Trust Determines Information Access
**We chose:** NPCs share deeper information with higher trust levels
**Why:** Information feels earned, respects community trust-building, creates natural gates
**Alternative rejected:** All NPCs share all information immediately (no progression, too easy)

### Decision 7: Threads as Investigation Units
**We chose:** Threads are specific pieces of information that can be collected and connected
**Why:** Gives structure to information discovery, creates memory map clarity, matches keyword concept
**Alternative rejected:** Vague information (would be too unclear, hard to progress)

### Decision 8: One Save File / Permanent Consequences
**We chose:** Single continuous save, choices are permanent, some threads may close
**Why:** Matches Shadowrun's single-save model, creates weight to decisions
**Alternative rejected:** Multiple saves/branches (would dilute tension and consequence)

### Decision 9: Job System as Information + Economic Access
**We chose:** Jobs provide two resources: money (survival) and access (investigation)
**Why:** Employment is not separate from narrative, money is survival pressure that forces job-taking, jobs unlock NPCs and information naturally
**Alternative rejected:** Quest rewards for information (would separate investigation from daily survival)

**How It Works:**
- She needs money to survive (rent, food, repair costs)
- Money comes from employment only
- Employment at specific locations (store, club, market, church, mechanic, maintenance)
- Each job gives access to different NPCs and information
- Good job performance increases reputation (better jobs, higher pay, deeper information access)
- Economic pressure creates natural pacing (can't explore full-time, must work)

### Decision 10: Purchasing Items to Unlock Access
**We chose:** Money buys things that unlock locations/jobs (not abilities or progression)
**Why:** Money is meaningful, keeps survival mechanical, doesn't become progression currency
**Alternative rejected:** Money buys power-ups (would be gamified, doesn't match setting)

**What Money Buys:**
- **Food** (survival, lasts X days, hunger affects fatigue)
- **Transportation/Access Passes** (fast travel, access to restricted areas)
- **Repair Costs** (cybernetics damaged by use/stress, must be repaired by mechanic)
- **Bribes/Tips** (small amounts to lubricate conversations, earn favor)
- **Specialized Tools** (for specific jobs, e.g., cleaning supplies for maintenance work)
- **Safe House Donations** (community care, funds underground network)

**What Money Does NOT Buy:**
- Quests (no quest store)
- Abilities (no power-up system)
- Information (information is trust-gated, not bought)
- Dialogue options (she can't "pay for answers")
- Job access above current reputation (job gating is relationship-based, not economic)

---

## The Job System: Integration with Shadowrun Quest Model

### How Jobs Enable Information

**Shadowrun Genesis (Original):**
- You take jobs in certain locations
- Your presence in that location lets you overhear NPCs
- Overhearing gives you keywords/information
- Keywords unlock new areas/NPCs

**Hatchling Adaptation:**
- She needs money (survival pressure)
- Money comes from jobs at specific locations
- Working at job puts her in position to overhear conversations
- Conversations reference people/problems (thread fragments)
- Following threads requires trust, which job performance builds
- Job access unlocks certain NPCs (wouldn't meet store owner without taking job)

**Example: Marcus Investigation Through Jobs**

```
Day 1: Takes store clerk job (needs money for food)
  → Overhears customer mention "Marcus disappeared"
  → Hears store owner mention supply chains
  → Thread begins: "Marcus - Missing Escapee"

Day 3: Takes market vendor job (better pay than store)
  → Market vendor says "Yeah, Marcus worked supply"
  → Thread develops: Marcus had job in logistics
  → Reputation with vendor increases

Day 5: Takes church volunteer (spiritual grounding after nightmares)
  → Church mother mentions "My grandson Marcus"
  → Thread deepens: Marcus is specific person, has family
  → Relationship deepens, gains church mother's trust

Day 7: Takes mechanic assistant job (higher pay, technical access)
  → Mechanic mentions "Marcus came asking about modifications"
  → Thread expands: Marcus was investigating program
  → Mechanic becomes interested in helping

Investigation Chain Result:
- Marcus understood (person, job, capture, location)
- Multiple jobs taken (economic survival + information gathering)
- Multiple NPCs know her (reputation across community)
- Access to mechanic unlocked (trusted enough for dangerous conversation)
```

### How Money Unlocks Locations

**Economic Gating (Not Ability-Based):**
- Some locations require transportation cost (fast travel pass)
- Some locations require entry fee (church donations, club cover charge)
- Some locations require you to look the part (clean clothes, not visibly desperate)

**Example: Access to Drain**

```
Discovering Drain Location (Thread Completion):
  → Maintenance job reveals location
  → But Drain entrance is not immediately accessible
  
Economic Access:
  → Needs repair tools to access infrastructure safely (costs money)
  → Needs food to sustain descent (costs money)
  → Needs rest before dangerous exploration (costs time/money)
  
Alternative: Relationship Access:
  → Mechanic likes her (built through job + conversations)
  → Mechanic offers to help prepare descent
  → Mechanic provides tools (instead of buying)
  → Maintenance foreman offers to cover her shift (time/resource savings)
```

### Economic Survival Mechanics

**Daily Costs:**
```
Rent: 50 currency/week (due every 7 days)
Food: 5 currency/day (hunger affects fatigue)
Repair: Variable (damaged cybernetics cost to fix)
Transport: Optional (1 currency for fast travel, saves time)
Donations: Optional (builds community relationships)

Average earnings from jobs: 40-100 currency per shift (3-4 hours)
```

**Economic Decisions Player Makes:**
- Work more jobs = more money but less exploration time
- Cheap food vs. good food (affects hunger speed)
- Save money vs. spend on transport (time vs. money trade)
- Repair now vs. limp along (affects movement speed)
- Donate to church vs. save (reputation vs. survival)

### Job Performance → Reputation → Access

**Shadowrun Genesis (Implicit):**
- Good job performance at location = better jobs available there
- Better jobs = better pay and access
- You build reputation with employer

**Hatchling Adaptation:**
```
Store Clerk Job:
  Day 1: Reputation with store owner = Low (Stranger)
  Day 3: Reputation = Acquaintance (good performance)
    → Store owner trusts you with opening/closing
    → Overhear more conversations (people chat longer)
    → Store owner starts mentioning personal things
  
  Day 7: Reputation = Contact (consistent excellent work)
    → Store owner mentions supply chain issues
    → Refers you to market vendor ("Talk to them")
    → Offers better shifts/higher pay
  
  Day 14: Reputation = Ally (proven reliability)
    → Store owner trusts you with money handling
    → Tells you about Marcus ("We knew him")
    → Helps connect you to church (recommends you)
```

**Trust Through Job Performance:**
- Showing up on time = reliability
- Good customer service = social competence
- Asking genuine questions = genuine care
- Offering to help beyond job = going above and beyond
- All these build the relationship in parallel with information gathering

---

## The Complete Loop: Jobs → Money → Access → Information

```
START: She needs food (survival pressure)
  ↓
Takes store clerk job (only way to earn money)
  ↓
Works shifts, earns money (40 currency per shift)
  ↓
Overhears customer mention Marcus (information fragment)
  ↓
Uses money to buy food (survives another week)
  ↓
Continues store job (builds reputation with owner)
  ↓
Store owner becomes Contact level (shares more info)
  ↓
Store owner recommends market vendor
  ↓
Takes market vendor job (better pay, different location)
  ↓
Overhears more about Marcus and supply chains
  ↓
Uses money to buy repair tools (cybernetics need maintenance)
  ↓
Market vendor recommends church (community care)
  ↓
Takes church volunteer job (lower pay, higher trust/spiritual value)
  ↓
Church mother reveals Marcus is her grandson
  ↓
Investigation thread deepens significantly
  ↓
Uses earnings to donate to church (builds ally-level trust)
  ↓
Church mother trusts you with underground network knowledge
  ↓
Mechanic job becomes available (through church recommendation)
  ↓
Takes mechanic job (highest pay, technical access)
  ↓
Learns Marcus came asking about modification tracking
  ↓
Investigation expands: Program scope, location, other victims
  ↓
Uses money to prepare for descent (repair tools, food supply)
  ↓
Mechanic becomes ally (shares dangerous information)
  ↓
Marcus investigation chain complete
  ↓
Can now attempt rescue/descent with community support
```

This is the **complete integration:**
- **Jobs** = survival necessity + information access
- **Money** = survival resource + access unlock
- **Information** = community threads + trust-gated
- **Progression** = employment chain + reputation building + investigation completion

---

## Implementation Notes for Claude Code

### Job System Data Structures

```javascript
{
  jobId: "store_clerk",
  employerId: "store_owner",
  location: "corner_store",
  wage: 40, // currency per shift
  shiftsAvailable: 3, // per day
  shiftDuration: 3, // hours (affects fatigue)
  trustRequired: "stranger", // Minimum trust to access job
  minigameType: "counter_service",
  
  informationAccess: [
    {
      threadId: "marcus_disappearance",
      piece: "marcus_worked_supply",
      trustRequired: "contact", // NPC must reach contact level first
      trigger: "random_customer_conversation",
    },
    {
      threadId: "supply_chain_issues",
      piece: "unusual_shipments",
      trustRequired: "acquaintance",
      trigger: "supplier_visits",
    }
  ],
  
  reputationGains: {
    goodPerformance: 0.2,
    excellentPerformance: 0.5,
    perfectShift: 1.0,
    helpingBeyondJob: 0.3,
  },
}
```

### Money System Data Structure

```javascript
{
  currentMoney: 150,
  
  costs: {
    rent: { amount: 50, frequency: "weekly", dueDay: "sunday" },
    food: { amount: 5, frequency: "daily", hunger: "reduces by 1 per day without food" },
    repair: { variable: true, baseAmount: 20, perBrokenCybernetic: 20 },
    transport: { amount: 1, frequency: "per_use", saves: 30 /* minutes */ },
  },
  
  purchasable: {
    food_bread: { cost: 2, hunger: 3, duration: "3 days" },
    food_soup: { cost: 3, hunger: 2, duration: "1 day", comfort: true },
    food_fruit: { cost: 4, hunger: 2, duration: "2 days", comfort: true },
    repair_tools: { cost: 20, needed: "for maintenance job" },
    transport_pass: { cost: 1, saves: 30, duration: "single use" },
    church_donation: { cost: 10, reputation: 0.5, with: "church_mother" },
  },
  
  earnings: {
    store_clerk: 40,
    market_vendor: 50,
    church_volunteer: 10, // low pay, high reputation
    mechanic_assistant: 80,
    maintenance: 60,
    jazz_club_server: 50, // tips variable
  },
}
```

### Job Availability Gates

```javascript
// Jobs become available through:
// 1. Reputation with employer (must be contact level minimum)
// 2. Location access (must visit first)
// 3. NPC recommendation (someone refers you)

// Example: Mechanic job
{
  jobId: "mechanic_assistant",
  unlockedBy: [
    {
      type: "reputation",
      npcId: "church_mother",
      level: "ally",
      reason: "Church mother recommends you to mechanic"
    },
    {
      type: "discovery",
      location: "mechanic_workshop",
      reason: "Found location"
    },
    {
      type: "meeting",
      npcId: "mechanic",
      reason: "Met mechanic through church or conversation"
    }
  ],
  requirementsMet: function(gameState) {
    return gameState.npcs.church_mother.trust >= 3 &&
           gameState.locations.mechanic_workshop.discovered === true;
  }
}
```

### Economic Pressure Mechanics

```javascript
// Rent due system (forces job-taking periodically)
{
  rentDueDate: timestamp,
  rentAmount: 50,
  daysUntilEviction: 7, // If rent unpaid for 7 days, game over
  
  onRentDue: function() {
    if (currentMoney >= rentAmount) {
      pay rent automatically
    } else {
      // Warning: "You have X days until eviction"
      // Forces player to prioritize jobs
    }
  }
}

// Hunger system (forces food purchasing)
{
  hunger: 100, // 0-100
  hungerDecay: 1, // per game hour
  hungerCosts: {
    75: "You feel hungry", // Yellow heart shows
    50: "You're very hungry. Your movement is slower.", // Movement penalty
    25: "You're starving. You can barely move.", // Major penalty
    0: "You collapse from starvation. Game Over.",
  },
  
  foodRestores: {
    bread: 30,
    soup: 50,
    fruit: 40,
  }
}

// Cybernetic damage system (forces repair purchasing)
{
  cybernetics: {
    left_arm: { health: 100, damage: 0 },
    right_arm: { health: 100, damage: 0 },
  },
  
  damageOccurs: [
    "Using cybernetics in job causes wear (1 damage per difficult action)",
    "Combat/danger causes damage (10+ damage)",
    "Extended exposure causes rust/failure (1 damage per day without maintenance)",
  ],
  
  repairCosts: {
    minorDamage: 15,
    majorDamage: 40,
    fullReplacement: 200, // expensive, only if she escapes and has help
  }
}
```

---

## Summary: Job + Money System Integration

**Jobs Serve Three Functions:**
1. **Economic Survival** — Money to buy food, pay rent, repair cybernetics
2. **Social Access** — Meet NPCs, build reputation, unlock information
3. **Information Gathering** — Overhear conversations, witness patterns, collect threads

**Money Serves Three Functions:**
1. **Survival Resource** — Buy food, pay rent, repair damage
2. **Access Unlock** — Buy travel, buy tools, buy entry to places
3. **Relationship Building** — Donations, tips, community support

**Economic Pressure Creates Pacing:**
- Can't explore full-time (money runs out)
- Must work regularly (jobs provide time blocks)
- Work creates information access naturally
- Money forces decisions (survival vs. exploration balance)

**This matches Shadowrun Genesis:**
- Jobs determine where you are and who you meet
- Job performance affects reputation
- Reputation affects what jobs you access
- Jobs provide the framework for information gathering

**But adapted for Hatchling:**
- Jobs are community work, not mercenary gigs
- Money is survival pressure, not greed
- Information is trust-gated, not bought
- Community solidarity replaces corporate hierarchy


---

## Summary: Shadowrun Genesis Adapted for Hatchling

| Shadowrun Element | Hatchling Adaptation | Why |
|-------------------|----------------------|-----|
| Keyword system | Thread system | Threads are emotional/contextual, keywords are transactional |
| Pay for information | Earn through trust | Community solidarity vs. corporate mercenary |
| Single quest giver | Distributed information network | Organic discovery vs. guided gameplay |
| Low/medium/high rep | Trust progression levels | Gradual deepening of relationships |
| Job-based information | Employment unlocks access | Work determines what you learn/access |
| Manual tracking | Inner monologue + memory map | Clean UI, organic discovery |
| Investigation chains | Thread chains | Complete investigation unlocks access |
| Non-linear progression | Open-ended investigation | Player chooses what to pursue when |
| Permanent consequences | Single save file | Choices matter, some threads may close |

**The Core Transfer:**
Shadowrun Genesis's **information economy** (information as currency for progression) becomes Hatchling's **information intimacy** (information as deepening trust and understanding).

The mechanics are similar (ask NPCs about things, learn information, build understanding), but the context is entirely different:
- **Shadowrun:** "I'll pay you for this information"
- **Hatchling:** "I'm trusting you with this information"

Both create progression and discovery. But Hatchling's version is rooted in community, vulnerability, and mutual aid rather than commerce and individualism.

---

## Implementation Notes for Claude Code

### Data Structures Needed

**Thread System:**
```javascript
{
  threadId: "marcus_disappearance",
  category: "personal", // personal, community, institutional, location
  title: "Marcus - Missing Escapee",
  pieces: [
    {
      source: "store_owner",
      content: "Marcus worked supply chains",
      trustRequired: "contact",
      location: "store",
    },
    {
      source: "church_mother",
      content: "Marcus was my grandson. They took him.",
      trustRequired: "ally",
      location: "church",
    },
    // ... more pieces
  ],
  unlockedAt: timestamp,
  memoryMapNodes: ["marcus_name", "marcus_job", "marcus_capture"],
  connections: ["program_scope", "drain_location", "escapee_network"],
}
```

**NPC Information Gates:**
```javascript
{
  npcId: "store_owner",
  information: [
    {
      threadId: "marcus_disappearance",
      piece: "marcus_worked_supply",
      trustRequired: "contact", // What trust level needed
      location: "store",
      conversationTrigger: "customer_mentions_supply",
    },
    // ... more information pieces
  ],
  trustLevel: 1.5, // 0=stranger, 1=acquaintance, 2=contact, 3=ally, 4=confidant
}
```

**Investigation Chain:**
```javascript
{
  chainId: "marcus_investigation",
  threads: ["marcus_name", "marcus_job", "marcus_capture", "modifications_tracking", "drain_location"],
  completion: false,
  unlockedRewards: [
    "mechanic_job_access",
    "drain_location_revealed",
    "underground_network_contact"
  ],
}
```

### Quest System (Non-Traditional)

**No Quest Objects** — Quests emerge from:
1. Overhearing conversations (NPC dialogue about problems/people)
2. Noticing needs (NPC mentions something is broken/needed)
3. Investigation chains (following threads to completion)
4. Employment (jobs create investigation access)
5. Beak assignments (intrusive tasks)

**No Quest Giver** — Information flows from distributed NPCs based on trust

**Progress Tracking** — Player sees progress through:
- Memory map (threads connecting)
- NPC trust changes (they share more)
- New locations becoming accessible
- New jobs becoming available

This is the Shadowrun Genesis model: information-driven, non-linear, player-tracked, relationship-gated progression.
