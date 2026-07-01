// ═══════════════════════════════════════════════════════════════
// BOO HAG — MASTER VARIABLE REGISTRY
// INCLUDE this file at the top of every scene .ink file.
// NEVER reset variables between scenes — state carries forward.
// ═══════════════════════════════════════════════════════════════

// ── CORE STATE ────────────────────────────────────────────────
VAR calm = 10               // 0-100. Calm = control. Fear = chaos.
VAR consciousness = 0       // 0=feral 1=waking 2=clear 3=griotte
VAR face_worn = false       // false=skinless true=girl's form active
VAR face_stable = false     // true=calm-summoned false=daylight-forced or fear-forced

// ── ATTITUDES ─────────────────────────────────────────────────
VAR att_reticence = false   // holds onto the girl; denial; mechanically harder
VAR att_anger     = false   // accepts while furious; rage is still claiming
VAR att_curiosity = false   // accepts through understanding; library-first
VAR att_joy       = false   // unlocks after first successful deliberate power use
VAR att_greed     = false   // unlocks after joy; wants the library to expand

// ── BRANCH FLAGS ──────────────────────────────────────────────
VAR branch_shed = false     // took shed branch in cold open (diner massacre)
VAR branch_run  = false     // ran from cop in the face
VAR branch_go   = false     // went with cop — patient, waiting

// ── WORLD STATE ───────────────────────────────────────────────
VAR diner_massacre  = false // everybody in diner dead (shed branch)
VAR father_dead     = true  // always true after cold open conjunction
VAR mother_witness  = true  // mother survived, fainted, is a witness
VAR cop_knows_face  = false // cop got a clear look at the girl's face (GO branch)
VAR face_seen_count = 0     // how many people have clearly seen the face

// ── RELATIONSHIP FLAGS ────────────────────────────────────────
// (populated as game expands — thralls, NPCs, etc.)
// VAR thrall_[name] = false

// ── DISCOVERY FLAGS ───────────────────────────────────────────
// (what she has found in the library; what quests are unlocked)
// VAR library_[category]_found = false
