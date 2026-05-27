# BEAUREGARDE — Quest & Dialogue Maker

**Version:** 1.0  
**System:** Shadowrun Genesis (Sega Genesis, 1994) - Information Economy Model  
**Purpose:** Create quests, dialogue, characters, and locations for Beauregarde

---

## TAB 1: QUEST CREATOR

### Quest Structure (Shadowrun Genesis Model)

A quest is **not a single objective with a giver**. A quest is a **thread of investigation** that emerges from information discovery.

```
Quest = Investigation Chain
├── Starting Point (how player discovers it)
├── Thread Pieces (information fragments across NPCs)
├── Connection Points (where threads intersect)
├── Completion (when enough pieces connect)
└── Rewards (access, reputation, new NPCs, new locations)
```

### Quest Template

**Quest Name:**
```
[Quest_ID]: [Thematic Name]
Example: marcus_investigation - "The Missing Supply Runner"
```

**Quest Category:**
```
- personal (about a specific person)
- community (about community history/events)
- institutional (about program/operations)
- location (about a place)
- mystery (about something unknown)
```

**Starting Trigger (How Discovery Begins):**
```
Trigger Type: [overhear / job / dream / npc_mention / location]

Example:
Type: overhear
Location: corner_store
NPC_Conversation: "They took Marcus last month"
Trigger_Condition: Working store clerk job, customer mentions Marcus
Result: Thread piece "marcus_name" unlocked
```

**Investigation Thread Pieces:**

Each piece is a fragment of information that comes from specific NPCs under specific conditions.

```
Thread_Piece_1:
├── ID: marcus_name
├── Content: "Marcus is a real person who disappeared"
├── Source_NPC: anonymous_customer
├── Required_Trust: stranger (can overhear)
├── Location: corner_store
├── Trigger: random_conversation_during_shift
├── Unlocks: ability_to_ask_about_marcus
└── Memory_Map_Node: "marcus_name"

Thread_Piece_2:
├── ID: marcus_job
├── Content: "Marcus worked in supply chains/logistics"
├── Source_NPC: store_owner
├── Required_Trust: contact
├── Location: corner_store
├── Trigger: direct_question_about_marcus (after learning name)
├── Unlocks: thread_chain_continues
└── Memory_Map_Node: "marcus_employment"

Thread_Piece_3:
├── ID: marcus_family
├── Content: "Marcus was someone's grandson"
├── Source_NPC: church_mother
├── Required_Trust: ally
├── Location: church
├── Trigger: mention_marcus_name_at_church
├── Unlocks: emotional_weight_deepens
└── Memory_Map_Node: "marcus_identity"

[Continue for all pieces...]
```

**Connection Points (Where Pieces Intersect):**

```
Connection: marcus_investigation + program_scope
├── Piece_A: marcus_asked_about_modifications
├── Piece_B: modification_tracking_system
├── Piece_C: program_captures_modified_people
├── Result: Understanding deepens - Marcus wasn't just missing, he was captured
└── Unlocks: Ability to access mechanic job (technical knowledge needed)

Connection: marcus_investigation + drain_location
├── Piece_A: marcus_seen_by_maintenance_foreman_underground
├── Piece_B: drain_entrance_location_revealed
├── Piece_C: infrastructure_maps_show_experiment_level
├── Result: Player can attempt descent
└── Unlocks: Final quest stage - rescue attempt
```

**Investigation Chain Completion:**

```
Completion_State: investigation_chain_complete
├── Required_Pieces: [marcus_name, marcus_job, marcus_family, marcus_capture, 
                       modification_tracking, drain_location]
├── Completion_Trigger: Player learns all major pieces OR reaches critical mass
├── Narrative_Result: Player understands Marcus's fate
├── Mechanical_Results:
│   ├── Unlock: descent_preparation
│   ├── Unlock: mechanic_job_final_stage
│   ├── Unlock: underground_network_contact
│   └── Reputation_Change: +2 with church_mother, +1 with mechanic
└── New_Options:
    ├── Attempt_Rescue
    ├── Prepare_Descent
    └── Tell_Church_Mother
```

**Quest Rewards (Shadowrun Model):**

```
Rewards_Type: NOT Currency or Experience Points
Rewards_Type: Information + Access + Relationships

Reward_1:
├── Type: Information_Access
├── Content: Full understanding of Marcus's fate
├── Mechanical_Result: Memory_map shows completed thread
└── Emotional_Result: Player knows what happened

Reward_2:
├── Type: Location_Access
├── Content: Drain entrance becomes navigable
├── Mechanical_Result: Can attempt descent with preparation
└── Narrative_Result: Physical access to rescue attempt

Reward_3:
├── Type: Relationship_Deepening
├── Content: Church_mother becomes confidant (trust level 4)
├── Mechanical_Result: +2 reputation, unlocks church_mother_final_dialogue
└── Narrative_Result: She trusts you with escape plan

Reward_4:
├── Type: Job_Unlock
├── Content: Mechanic work becomes available at highest pay tier
├── Mechanical_Result: Can earn 80 currency/shift, technical knowledge access
└── Narrative_Result: Prepared for dangerous technical work

Reward_5:
├── Type: NPC_Access
├── Content: Underground network contact revealed
├── Mechanical_Result: New NPC becomes available for dialogue
└── Narrative_Result: Access to resistance/escape network
```

**Failed/Abandoned Thread:**

```
If_Player_Ignores_Marcus_Thread:
├── Timeline: After 10+ game days
├── Result: Marcus disappears further (memory fades, trail goes cold)
├── Consequence: Cannot learn his location, cannot attempt rescue
├── Emotional_Impact: Some people are lost forever
└── Mechanical_Impact: That investigation path closes, different endgame required
```

---

## TAB 2: DIALOGUE CREATOR

### Dialogue Structure (Shadowrun Genesis Model)

Dialogue is **not branching trees**. Dialogue is **information revelation based on relationship**.

```
Dialogue = NPC Sharing What They Know
├── NPC Relationship Level (determines what they reveal)
├── Context (where dialogue happens, what triggered it)
├── Information_Pieces (specific threads they share)
└── Relationship_Change (how interaction affects trust)
```

### Dialogue Template

**Dialogue_ID:**
```
[NPC_ID]_[Context]_[Trust_Level]
Example: store_owner_marcus_mention_contact
```

**NPC Information:**
```
NPC_Name: Store Owner
NPC_ID: store_owner
Current_Trust_Level: contact (2)
Dialogue_Context: Player mentions Marcus by name at counter
```

**Dialogue Stages (By Trust Level):**

```
STRANGER_LEVEL (Trust 0):
├── NPC_Behavior: Polite, guarded, minimal detail
├── Dialogue_Example: 
│   NPC: "Marcus? Don't know anyone by that name."
│   (Actually: Doesn't trust you enough to confirm)
├── Information_Shared: None about Marcus
├── Relationship_Change: Neutral or -0.1 (suspicious question)
└── Next_Step: Cannot ask again until relationship improves

ACQUAINTANCE_LEVEL (Trust 1):
├── NPC_Behavior: Friendly, willing to chat, surface information
├── Dialogue_Example:
│   NPC: "Oh yeah, Marcus. Used to come in here. Haven't seen him in months."
│   (Confirming he's real, but no personal details)
├── Information_Shared: marcus_name_confirmed, marcus_frequency_of_visits
├── Relationship_Change: +0.1 (friendly conversation)
└── Next_Step: Can ask follow-up questions

CONTACT_LEVEL (Trust 2):
├── NPC_Behavior: Sharing personal observations, trusting you somewhat
├── Dialogue_Example:
│   NPC: "Marcus worked supply chains. Smart kid. Then one day, gone.
│          Nobody knows what happened to him."
│   (Sharing concern, implying something bad happened)
├── Information_Shared: marcus_job, marcus_disappearance_timing
├── Relationship_Change: +0.2 (showing genuine interest)
└── Next_Step: Can discuss the situation, express concern

ALLY_LEVEL (Trust 3):
├── NPC_Behavior: Sharing deep concern, treating you as trusted confidant
├── Dialogue_Example:
│   NPC: "Look, Marcus asked me questions before he disappeared.
│          About who buys what, what shipments go where. Then Bureau agents 
│          came asking about him. He was onto something. Something wrong."
│   (Revealing institutional connection, showing real fear)
├── Information_Shared: marcus_investigation, institutional_interest, danger_implication
├── Relationship_Change: +0.3 (sharing dangerous information)
└── Next_Step: Can discuss resistance, danger, next steps

CONFIDANT_LEVEL (Trust 4):
├── NPC_Behavior: Fully trusting, sharing everything they know
├── Dialogue_Example:
│   NPC: "Marcus was looking into the program. That's what I think anyway.
│          He asked about shipments to underground locations, medical supplies,
│          people disappearing from specific neighborhoods. 
│          And then HE disappeared. They got him.
│          But I need you to know: if you're looking into this, be careful.
│          They're still looking. Still taking people."
│   (Full picture, includes warning and personal investment)
├── Information_Shared: marcus_investigation_full, program_scope, personal_danger
├── Relationship_Change: +0.5 (shared serious trust)
└── Next_Step: Can discuss escape, resistance, dangerous actions
```

**Dialogue Entry Template:**

```markdown
### Dialogue: Store Owner (Marcus Question - Contact Level)

**NPC:** Store Owner  
**Location:** Corner Store - Counter  
**Trigger:** Player mentions Marcus's name during shift  
**Required_Trust:** Contact (2.0+)  
**Context:** Player working store clerk job, customer mentions Marcus, player decides to ask store owner

---

#### NPC Dialogue

> "Marcus? Yeah, I knew him. Came in here pretty regularly. 
> He worked in supply chains — logistics stuff. 
> Smart kid, always thinking about things. 
> Haven't seen him in... must be three months now? 
> Just stopped coming one day."

#### Subtext (What NPC Is Really Saying)
- Marcus was real person with specific job
- He was regular customer (trusted place)
- His disappearance was sudden and unexplained
- NPC is concerned but cautious

#### Player Response Options
(No branching - player just listens or asks follow-up)

**Option 1: Listen silently**
- NPC continues: "Anyway, if you see him around, let me know."
- Relationship_Change: +0.1 (respectful listening)
- Thread_Unlocked: marcus_location_query (can ask where he lived)

**Option 2: Ask where he lived/worked**
- NPC: "He lived somewhere in the residential zone. Beyond that, I don't know."
- Relationship_Change: +0.2 (showing genuine interest)
- Thread_Unlocked: marcus_residence_area

**Option 3: Ask if Bureau was involved**
- NPC: "I... why would you think that?"
- (NPC becomes slightly cautious, you've revealed you're investigating)
- Relationship_Change: +0.3 if trust is high enough, -0.2 if not
- Thread_Unlocked: institutional_interest_warning

#### Information Pieces Revealed
- Thread: marcus_job ✓
- Thread: marcus_disappearance ✓
- Thread: marcus_character (smart, thinking) ✓

#### Relationship Change
- Store Owner Trust: +0.2 (this conversation)
- Player reputation with store owner: Slightly increased
- NPC memory: "Player asked about Marcus - seems to care about what happened"

#### Next Dialogue Nodes
- store_owner_marcus_danger (if player asks about Bureau)
- store_owner_marcus_location (if player asks where he lived)
- store_owner_general (if player changes subject)

---
```

**Dialogue Responses (Not Branching Trees):**

```
Player Options: Small adjustments to conversation, not story-branching

Example:
NPC: "Marcus was asking strange questions."

Player Can:
├── Ask: "What kind of questions?"
│   └── NPC reveals more detail (if trust allows)
├── Listen silently
│   └── NPC offers more unprompted (if comfortable)
└── Change subject
    └── Conversation ends, can return later

WHAT PLAYER CANNOT DO:
├── Choose dialogue that contradicts character
├── "Reject" information (she hears it)
├── Unlock new information through clever dialogue choices
└── Skip listening to NPC monologues
```

---

## TAB 3: CHARACTER CREATOR

### Character Template

**Character_ID:**
```
[npc_id]: [Full_Name]
Example: store_owner - James Patterson
```

**Basic Info:**

```
Name: James Patterson
ID: store_owner
Age: 55
Role_In_Veil: Community Shopkeeper, Information Hub
Visual_Archetype: Tired but Kind, Weathered from Years of Work
```

**Trust Progression (Shadowrun Model):**

```
Trust_Level_0 (Stranger):
├── Behavior: Professional, guarded, minimal engagement
├── Information_Access: Public knowledge only
├── Dialogue_Count: 1-2 interactions
└── Example: First meeting at counter

Trust_Level_1 (Acquaintance):
├── Behavior: Friendly, willing to chat about neighborhood
├── Information_Access: Surface-level observations, gossip
├── Dialogue_Count: 3-5 interactions over time
└── Example: Regular customer who buys from him

Trust_Level_2 (Contact):
├── Behavior: Treats you like familiar person, shares personal observations
├── Information_Access: Specific threads about people/events
├── Dialogue_Count: 6-10 interactions, positive reputation
├── Trigger: Consistent visits + helpful behavior + job performance
└── Example: Working his store, helping customers, asking genuine questions

Trust_Level_3 (Ally):
├── Behavior: Clearly trusts you, shares concerns and fears
├── Information_Access: Dangerous information, personal worries
├── Dialogue_Count: 10+ interactions, high reputation
├── Trigger: Showing genuine care, community involvement, trustworthiness
└── Example: Discussing Marcus's disappearance, institutional fears

Trust_Level_4 (Confidant):
├── Behavior: Fully invested in your success, shares everything
├── Information_Access: Complete information, life details, escape plans
├── Dialogue_Count: Frequent interactions over extended period
├── Trigger: Proven loyalty, shared danger, mutual trust
└── Example: Helping plan escape or discussing resistance
```

**Information They Hold (Threads):**

```
Thread_1:
├── ID: marcus_job
├── Content: Marcus worked in supply chains
├── Unlocked_At_Trust: contact (2)
├── How_Revealed: Direct question about Marcus
└── Conversation_ID: store_owner_marcus_mention_contact

Thread_2:
├── ID: supply_chain_issues
├── Content: Unusual shipments going to institutional zone
├── Unlocked_At_Trust: ally (3)
├── How_Revealed: Discussing Marcus's investigation
└── Conversation_ID: store_owner_institutional_awareness

[Continue for all threads this NPC knows...]
```

**NPC Jobs/Roles:**

```
Primary_Role: Store Owner
Location: Corner Store
Available_Jobs: None (she works for him, not vice versa)
Job_Information_Access: 
├── Marcus_visits (overhear customer conversations)
├── Supply_patterns (what he receives)
├── Institutional_presence (Bureau agents visiting area)
└── Community_needs (what people are buying/lacking)
```

**Personality & Motivations:**

```
Core_Motivation: Keep community safe and together
Secondary_Motivation: Survive economically, protect his business
Fear: Institutional attention, people disappearing
Strength: Connected to community, trusted
Weakness: Risk-averse, won't take direct action against system

Speech_Pattern: Casual neighborhood dialect, warm, fatherly
Dialogue_Tags: #warm #protective #cautious #community_minded
```

**Relationship Dynamics:**

```
Relationships_With_Other_NPCs:
├── Church_Mother: Mutual respect, community allies
├── Market_Vendor: Business partners, coordinate on supply
├── Mechanic: Know of each other, occasional customers
└── Beak: Fears him, avoids direct conflict

Player_Relationship_Starting_Point:
├── Initial_Attitude: Neutral friendly (she's community member)
├── Initial_Trust: Stranger (0)
├── Reason_For_Caution: Doesn't know her history, cautious about Bureau interest
└── Path_To_Trust: Consistent visits, job performance, genuine care
```

**Character Arc (If Trust Deepens):**

```
Story_Development:
├── Stranger: "Oh, new customer, welcome"
├── Acquaintance: "You come here often, huh? Good to see consistent faces"
├── Contact: "I'm worried about this neighborhood. People disappearing."
├── Ally: "I think I know what happened to Marcus. It's bad."
├── Confidant: "If you're going to investigate this, I want to help. Tell me what you need."

Final_State: Store owner becomes active supporter, provides resources for escape/rescue
```

---

## TAB 4: PLACE CREATOR

### Location Template

**Location_ID:**
```
[location_id]: [Location_Name]
Example: corner_store - "Patterson's Corner Store"
```

**Basic Info:**

```
Name: Patterson's Corner Store
ID: corner_store
Type: Retail / Community Hub
District: The Veil - Residential Zone
Access_Type: Public
First_Visit_Trigger: Hunger (first quest), walking past building
```

**Location Features:**

```
Architecture:
├── Size: Small neighborhood store (600 sq ft)
├── Layout: Counter at front, shelves behind, back storage
├── Lighting: Warm interior lights, neon sign outside "PATTERSON'S"
├── Atmosphere: Welcoming, lived-in, community gathering space
└── Condition: Well-maintained but worn (decades of use)

Interactive_Elements:
├── Counter: Can buy food/supplies, talk to store owner
├── Shelves: Visual navigation, selecting items
├── Door: Entry/exit point
└── Window: Can see street outside, fog of war visible

Visual_Fog_of_War:
├── Inside_Store: Tier 1 (fully visible, clear details)
├── Outside_Through_Window: Tier 3-4 (vague shapes, fading)
├── Behind_Counter: Tier 1 (NPC fully visible)
└── Storage_Area: Tier 2-3 (visible but shadowed)
```

**NPCs Present:**

```
Always_Present:
├── Store Owner (James Patterson) - Behind counter during business hours
├── Occasional Customer #1 - Random visits (discussion partners)
├── Occasional Customer #2 - Random visits (potential thread sources)
└── Ambiance_NPCs - Neighborhood locals shopping

Appearance_Patterns:
├── Opening: Store Owner at counter
├── Mid_Day: Store Owner + 1-2 customers
├── Evening: Store Owner + regular customers (neighborhood gathering)
└── Late_Night: Closed or locked (burglary possible mechanic later)
```

**Information Available (Threads):**

```
Overhear_Conversations:
├── Thread_Source: Random customers discussing neighborhood
├── Content_Examples:
│   ├── "They took Marcus"
│   ├── "Supply shortage in institutional zone"
│   ├── "Bureau agents asking questions"
│   └── "People disappearing from Barrens"
├── Trigger: Working store job, spending time in store
└── Requires_Trust: None (overhearing is passive)

Direct_From_NPC:
├── Store Owner shares information based on trust level
├── Topics: Marcus, supply chains, institutional patterns, community news
├── Requires_Trust: Contact level minimum
└── Trigger: Direct conversation with store owner

Environmental_Details:
├── Products_On_Shelves: Show economic hardship, scarcity patterns
├── Newspaper_On_Counter: Can read headlines (institutional news)
├── Bulletin_Board: Community notices, missing persons posts
└── Dialogue_From_Customers: Reflect community concerns
```

**Jobs Available:**

```
Job: Store Clerk
├── Employer: Store Owner
├── Wage: 40 currency per shift
├── Shift_Duration: 3-4 hours
├── Mini_Game: Counter service (take orders, process transactions)
├── Information_Access:
│   ├── Overhear customer conversations
│   ├── Learn supply patterns
│   ├── Notice regular customers (build NPC familiarity)
│   └── See institutional presence (Bureau agents buying supplies)
├── Reputation_Building: Each good shift increases store_owner trust by 0.1-0.5
└── Physical_Access: Behind counter, storage area (limited)
```

**Economy (What's Bought/Sold):**

```
For_Sale:
├── Food: Bread (2¥), Soup (3¥), Fruit (4¥), Prepared meals (5-8¥)
├── Drinks: Water (1¥), Tea (2¥), Coffee (3¥), Juice (2¥)
├── Supplies: Cleaning items, basic tools, first aid
└── Information: Store owner's advice/knowledge (free with trust)

Buying_Patterns:
├── Poor_Residents: Buy cheap bread, water, basic supplies
├── Working_People: Buy prepared meals, coffee, quick items
├── Institutional: Bureau agents buy water, energy drinks, take-out
├── Wealthy_Spillover: Occasional upscale customers from Covenant Hill

Economic_Tells:
├── What's_In_Stock: Shows supply chains functioning
├── What's_Scarce: Shows institutional control/rationing
├── Prices: Reflect community economic stress
└── Customer_Behavior: Shows desperation or security
```

**Quest Triggers at This Location:**

```
Quest_Start: marcus_investigation
├── Trigger: Customer mentions "They took Marcus"
├── Location: Corner store counter
├── Conversation_Context: Player working shift, customer confides
├── Result: Thread "marcus_name" unlocked
└── Chain_Start: Player can now ask about Marcus

Quest_Development: supply_chain_issues
├── Trigger: Observing shipments, talking to store owner
├── Location: Counter conversations
├── Information_Access: Learning what's being traded, where
└── Thread_Unlock: institutional_supply_patterns

Smaller_Threads:
├── Neighborhood_Gossip (who's who, general information)
├── Poverty_Indicators (who's struggling, who's stable)
├── Institutional_Presence (Bureau agents, Watch patrols)
└── Community_Events (gatherings, celebrations, dangers)
```

**Accessibility & Safety:**

```
Safety_Level: High (The Veil, community space)
├── Surveillance: None (not institutional zone)
├── Danger: Minimal (community protects each other)
├── Comfort_Level: Safe, restful

Accessibility:
├── Distance_From_Apartment: Very close (1-2 blocks)
├── Travel_Time: 2-3 minutes walk
├── Visibility: Clear path, no hiding required
└── Entry_Difficulty: Walk in (public business)

Noise_Level:
├── Interior: Moderate (customers, ambient music)
├── Street_Outside: Moderate (neighborhood sounds)
└── Audio_Atmosphere: Welcoming, community gathering
```

**Atmosphere & Immersion:**

```
Visual_Style:
├── Color_Palette: Warm golds, browns, community colors
├── Lighting: Warm interior against cool outside fog
├── Condition: Well-loved, worn but cared for
└── Signs: Handwritten price tags, community bulletins

Audio_Design:
├── Ambient: Soft music or radio, customer conversations
├── Store_Owner: Warm, fatherly voice
├── Customers: Neighborhood dialect, real conversations
└── Outside_Through_Door: Jazz, street sounds (The Veil ambiance)

Emotional_Tone:
├── Inside: Safe, welcomed, part of community
├── Purpose: Economic necessity + social connection
├── Feeling: Home, comfort, momentary escape
└── Subtext: Community bonds that institutional system can't destroy
```

---

## USAGE GUIDE

### How to Create a Complete Quest

1. **Start in QUEST CREATOR tab**
   - Define the thread/investigation (what is being discovered?)
   - Set starting trigger (how does player learn about it?)
   - List all thread pieces (information fragments)
   - Define connection points (how pieces relate)
   - Set completion conditions (what counts as "solved?")
   - Define rewards (access, relationships, NPCs)

2. **Move to DIALOGUE CREATOR tab**
   - Create dialogue for each NPC who holds thread pieces
   - Write conversation at each trust level
   - Define what information is revealed when
   - Set relationship changes
   - Create natural conversation flow

3. **Cross-reference CHARACTER tab**
   - Verify NPC has the threads you referenced
   - Check trust level requirements match
   - Ensure personality/dialogue consistency
   - Update NPC information list with new threads

4. **Cross-reference PLACE tab**
   - Verify locations where dialogue happens exist
   - Check job opportunities align with thread access
   - Ensure fog of war and atmosphere support discovery
   - Add new locations if needed for quest flow

### Example: Marcus Investigation Quest

**QUEST CREATOR:**
- Quest_ID: marcus_investigation
- Category: personal
- Start_Trigger: Overhear at corner_store
- Thread_Pieces: [marcus_name, marcus_job, marcus_family, marcus_capture, drain_location]
- Completion: When 5+ pieces connected

**DIALOGUE CREATOR:**
- store_owner_marcus_contact (reveal job)
- church_mother_marcus_ally (reveal family/capture)
- mechanic_marcus_ally (reveal modifications)
- maintenance_marcus_ally (reveal location)

**CHARACTER CREATOR:**
- store_owner: Add marcus_job thread
- church_mother: Add marcus_family thread
- mechanic: Add marcus_capture thread
- maintenance_foreman: Add drain_location thread

**PLACE CREATOR:**
- corner_store: Add marcus_overhear trigger
- church: Add church_mother dialogue location
- mechanic_workshop: Add mechanic dialogue location
- maintenance_access: Add location for drain discovery

---

This is your quest-building system. It follows Shadowrun Genesis's information-economy model: no quest givers, no quest logs, just threads of information that emerge through NPC interaction and trust-building.
