// ═══════════════════════════════════════════════════════════════
// BOO HAG — COLD OPEN
// Sections I through V (diner fork)
// Engine: Ink / inkjs
// All lines hardcoded. Zero runtime AI.
// ═══════════════════════════════════════════════════════════════

// ── VARIABLES ───────────────────────────────────────────────────
VAR calm = 10               // 0-100. Calm = control. Fear = chaos.
VAR consciousness = 0       // 0=feral 1=waking 2=clear 3=griotte
VAR face_worn = false       // false=skinless true=girl's form active

// Attitude flags — only reticence/anger/curiosity available here
VAR att_reticence = false
VAR att_anger     = false
VAR att_curiosity = false
// joy and greed unlock after cold open

// ═══════════════════════════════════════════════════════════════
// I. THE ROAD
// Cutscene. No input. Text fades over black.
// ═══════════════════════════════════════════════════════════════
=== section_i_road ===

A box truck on a country road going nowhere in particular.

No name on the side. No company. Nothing that wants to be remembered.

Two men up front in matching jackets. They do not sit like truckers.

Behind them, the box. Inside the box, another box — built to hold a thing.

The lock is on the outside.

Then: white. Not headlights. A white that comes from inside the inside.

The truck leaves the road. The tree does not move. They never do.

After — the cab folded around bark. Two men still in it. Already going. Already gone.

Something climbs out of the wreck.

Whether the box had been taking her somewhere or she had been getting out of it, she could not have said. There was the white. Then there was the after.

Cold goes straight through where skin should be — black, cracked, a light moving underneath.

One thing. No word on it.

NEED.

-> section_ii_hunt


// ═══════════════════════════════════════════════════════════════
// II. THE HUNT
// Playable. Hag form tutorial. No dialogue — pure instinct.
// [GAME: useHagMovement() active]
// Tutorial: ← → to walk. SPACE to float. Land to return.
// ═══════════════════════════════════════════════════════════════
=== section_ii_hunt ===

// [TUTORIAL PROMPT: ← →]
// Player moves toward distant farm lights across the country road.

// [First house — wrong]
// An old couple asleep. Not this. She knows before she enters.
// [TUTORIAL PROMPT: SPACE to float — rise over fence, move on]

// [Second house — lights still on upstairs]

Lights. Further.

A house with a room still lit.

// [TUTORIAL COMPLETE — player reaches the door]
// [Door interaction prompt: E]

-> section_iii_room


// ═══════════════════════════════════════════════════════════════
// III. THE ROOM
// Scripted sequence. No player input.
// The boo hag acts on instinct. She does not know what is happening.
// [3-7-9 ALIGNMENT FIRES HERE — July 25th, 9:09 PM]
// ═══════════════════════════════════════════════════════════════
=== section_iii_room ===

A girl in a bed. Asleep.

// [THE RIDE BEGINS]
// Standard. She has done this ten thousand times.
// The boo hag does not feel the alignment. She feels hunger quieting.

The walls are thin.

// [9:09 PM — CONJUNCTION COMPLETES]
// The 3-7-9 fires. The universe does not announce it.
// To the boo hag: a normal feeding. She takes the face. She moves.
// What actually happened: the girl did not disperse.

A door opens.

A man.

// [FATHER — he came through the wall of sound]
// [IMPACT — he hits the wall]
// [HE IS GONE]

A second door.

A woman in the hallway.

// [MOTHER SEES]
// [BOO HAG — out the window, gone]
// [MOTHER — faints]

~ face_worn = true
~ calm = 20
~ consciousness = 0

// The boo hag is in the girl's form. She thinks: fed. Moving.
// She does not know anything changed.
// The girl is somewhere inside. Not surfaced. Not yet.

-> section_iv_leaving


// ═══════════════════════════════════════════════════════════════
// IV. THE LEAVING
// Playable — slow walk. Human movement speed.
// The boo hag is dominant but something is building pressure.
// First flickers. Not words yet. Something pressing from inside.
// ═══════════════════════════════════════════════════════════════
=== section_iv_leaving ===

Cold. The body does not register it the way it should.

Pajamas. No shoes. A country road in winter.

Lights ahead.

// [Player walks toward diner — slow, human pace]
// [No tutorial prompts — she is in human form now]

Sirens. Far behind.

Not for her. Not yet.

// Something shifts. Just slightly. Something pressing.
// [Internal — no text shown to player. Just a beat. A stutter in the walk.]

The lights are a diner.

~ calm = 22

-> section_v_diner


// ═══════════════════════════════════════════════════════════════
// V. THE DINER
// Three movements:
//   1. The boo hag sits. No input.
//   2. The shift — she dies. The girl arrives.
//   3. First contact — waitress, cop, radio, three choices.
// ═══════════════════════════════════════════════════════════════
=== section_v_diner ===

= boo_hag_sits

// [MOVEMENT 1 — NO INPUT]
// The boo hag occupies the booth. Does what she does.
// The waitress looks once and decides not to.

A booth by the window. Fluorescent. The smell of something frying in old grease.

She sits.

The waitress leaves her alone. Something in the way she sits makes that easy to decide.

// [BEAT — the boo hag is still]
// [BEAT — stiller]
// [A clock stopping]

= the_shift

// [MOVEMENT 2 — TRANSITION EFFECT]
// [SVG displacement filter fires — peaks — resolves]
// [The boo hag is gone. She didn't fight it. She didn't know to.]

~ consciousness = 1
~ calm = 25

Dark.

Then: the booth. Fluorescent. The smell of grease.

Hands on a table that she knew were her hands before she knew what hands were.

There was something behind her eyes that was very old and very loud and it was not her.

Was.

She has centuries in her head. None of it is shelved.

// [The library. Books everywhere. Still spinning.]

The urge toward the waitress is right there on top.

She notes it.

Sets it aside.

She does not know how long she has been sitting here. The boo hag's time and her time are not the same thing.

= first_contact

// [MOVEMENT 3 — INPUT ACTIVE]

The bell above the door.

A cop comes in. End of shift. Takes the counter stool. Looks at his phone.

Then at her.

The waitress arrives first.

"Honey — where are your shoes?"

* [Say nothing. Look at the table.]
    ~ att_reticence = true
    She looks at the table. Counts the rings from old coffee cups.
    "I just — I lost track of time."
    The waitress waits. Does not believe it. Brings coffee anyway.
    -> cop_recognition

* [Look at your feet. Actually look.]
    ~ att_curiosity = true
    She looks at her feet the way she would look at an object she had never seen before.
    Dirty. A cut on the left heel she doesn't remember getting. The boo hag got it. She has the memory now — wet grass, a fence, the dark.
    "I'm not sure," she says. True in more ways than she can explain.
    The waitress sets down coffee and tilts her head. Something is off. She can't name it.
    -> cop_recognition

* ["I was at home."]
    ~ att_anger = true
    Too flat. Too certain for 2am in pajamas with dirty feet.
    Home is somewhere she cannot go back to and her voice knows it before she does.
    The waitress blinks. Sets down the coffee. Takes one step back.
    -> cop_recognition

= cop_recognition

// The cop at the counter has been watching since she answered.
// He stands. Walks over.
// The boo hag's library has a whole section on how men look at you
// when they are deciding what you are.

"Excuse me — aren't you one of the Arceneaux girls?"

Her family name. The first word that belongs to her.

// [RADIO CRACKLES]
// Dispatch. An address.
// Her address.
// What they found there.

She hears all of it.

// THREE SECONDS.

* [Stay. Go with him.]
    -> branch_go

* [Run. Stay in the face.]
    -> branch_run

* [Shed.]
    -> branch_shed


// ═══════════════════════════════════════════════════════════════
// BRANCH: GO
// She goes with the cop. Patient. In the face.
// She is about to be questioned about her father's murder.
// ═══════════════════════════════════════════════════════════════
=== branch_go ===
~ calm = 30
// Calm holds. Face holds. She lets him take her.
// Scene 2: the station. [TO BE WRITTEN]
-> END


// ═══════════════════════════════════════════════════════════════
// BRANCH: RUN
// She runs in the face. Becomes the hunted Arceneaux girl.
// Her own face is the danger now.
// ═══════════════════════════════════════════════════════════════
=== branch_run ===
~ calm = 15
// Fear rises on the run. Face strains.
// Scene 2: on foot, face flickering, dawn coming. [TO BE WRITTEN]
-> END


// ═══════════════════════════════════════════════════════════════
// BRANCH: SHED
// She retracts the face. Skinless form fills the diner.
// She did not choose the massacre. The feral instinct chose it.
// Proximity + panic + centuries of pattern = everyone goes.
// The face is still with her — symbiotic, not lost.
// She does not know how to call it back yet.
// ═══════════════════════════════════════════════════════════════
=== branch_shed ===
~ face_worn = false
~ calm = 0

// [TRANSITION — the face retracts]
// [FERAL INSTINCT FIRES on proximity]
// [THE DINER — everyone stops at the moment they were at]
// No struggle. No overturned tables. No broken glass.
// Cook at the grill. Waitress mid-step. Trucker face-down in eggs.
// Cop on the radio to nowhere. Coffee still hot.
// Pajamas on the booth seat. Empty.
// [SHE IS GONE before the first unit arrives]

// ── CANON NOTE ───────────────────────────────────────────────────
// What investigators find: six dead of no identifiable cause.
// Medical examiner files the report three times. Doesn't change.
// The pajamas connect to the Arceneaux house only through
// the mother's testimony — which won't come until morning.
// Three scenes. One county. One night.
// The detective who catches all three starts a board.
// The PI trio hears the scanner. This is their origin story.
// ─────────────────────────────────────────────────────────────────

-> scene_2_shed
