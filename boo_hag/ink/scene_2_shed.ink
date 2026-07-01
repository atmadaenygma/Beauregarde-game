// ═══════════════════════════════════════════════════════════════
// BOO HAG — SCENE 2 (SHED BRANCH)
// Outskirts of rural Louisiana. Before Beauregarde city.
// Skinless. Dawn coming. Library in full tornado. Calm = 0.
// She needs to resummon the face before daylight hits.
// ═══════════════════════════════════════════════════════════════

// Variables carry over from cold_open.ink
// VAR calm = 0
// VAR consciousness = 1      (waking — she has words, wrong ones)
// VAR face_worn = false
// VAR face_stable = false    (true = calm-summoned / false = daylight-forced)

INCLUDE cold_open.ink

VAR face_stable = false

=== scene_2_shed ===

// ── MOVEMENT 1: OUTSIDE ─────────────────────────────────────────
// [PLAYABLE — skinless movement, no float in open ground near highway]
// Highway sounds ahead. Blue-black sky. The east edge going gray.

A highway. The kind that goes somewhere but not anywhere she knows yet.

Behind her, lights. Red and blue now, not just diner yellow.

She does not run. Running is for things that can be seen. She moves into the dark beside the road and the dark takes her in the way dark always has.

// [Player navigates skinless form along the highway margin]
// [Cop sirens grow then fade — units heading to the diner]
// [She passes a road sign: BEAUREGARDE 14 MI]

Fourteen miles. She knows what that is. She has the word.

She also has, from somewhere deep in the library — not her own knowing, someone else's knowing now hers — that fourteen miles before dawn is not a walk. It is a problem.

The east is going the wrong color.

// ── MOVEMENT 2: FIND SHELTER ─────────────────────────────────────

* [The overpass. Concrete and shadow — the boo hag's library marks it without a word.]
    ~ calm = 2
    // [Player moves under the highway overpass]
    Concrete overhead. Gravel and old oil smell underneath. The light stops at the edge.
    Not safe. Closer to safe than open road.
    -> shelter_arrived

* [Tree line. Thirty yards off the highway through wet grass.]
    ~ calm = 3
    // [Player navigates to tree line — longer path, more cover]
    The grass is cold and she does not feel it the way she should and that is still new enough to notice.
    The trees close overhead. Spanish moss. Something moves away from her.
    Everything in this county moves away from her.
    -> shelter_arrived

* [The old gas station. Dark. Boards on the windows. Door hanging.]
    ~ calm = 4
    // [Player reaches the abandoned structure]
    Someone's name was on this building once. Faded to a color, not a word.
    Inside: old motor smell, a counter, three shelves of nothing.
    More shelter than the others. More enclosed.
    She stands in the center of it and the building holds the dark around her like it remembers how.
    -> shelter_arrived

= shelter_arrived

// Dawn pressure rising. She has minutes, not hours.
// The library is spinning. She cannot find anything.
// She needs one thing to hold. Just one.

The light outside is getting specific.

She knows what happens when the light gets specific. The library has that filed correctly even now — daylight, exposure, the form that cannot be seen.

She tries to find calm the way you try to find a specific book in a room where every book is in the air.

// ── MOVEMENT 3: THE RESUMMON ─────────────────────────────────────
// First time the player navigates the library deliberately.
// Attitude-coded. Choose what to reach for.

She reaches.

* [The girl's dorm room. The specific smell of it. Coffee and somebody's laundry two doors down.]
    ~ att_reticence = true
    ~ calm = calm + 18

    Not home. Home is gone. But the dorm room is — something. Neutral. Hers without being the thing she lost.

    The smell comes back to her perfectly. Better than memory. The boo hag's library stores sensation without decay.

    She holds it.

    The tornado does not stop. But there is one spot in it that is briefly not moving.

    -> resummon_check

* [The anger. What was done. What she woke up inside. The fact that nobody asked.]
    ~ att_anger = true
    ~ calm = calm + 22

    She does not reach for something soft. She reaches for the thing that is true.

    She did not choose this. The hunger chose this. The father is dead and she felt the wall take his weight and she did not choose that either.

    She is furious.

    Fury is not calm. But fury is claiming. She is here. She is this. She did not choose it and it is hers anyway and something in that — the sheer solidity of a thing owned even against your will — is enough to stand on.

    -> resummon_check

* [The library. Not a memory — a book. The oldest one she can almost reach.]
    ~ att_curiosity = true
    ~ calm = calm + 25

    She stops trying to feel something and starts trying to understand something.

    Three hundred years. The boo hag was three hundred years old and she knew every road in the South by its specific dark and she knew the weight of a hundred different skins and she knew —

    That is a lot of information.

    The curiosity does not fix anything. But curiosity has a specific quality she recognizes from studying for exams at 2am: it pulls you forward instead of under. She is still in the tornado. She is interested in the tornado.

    That is almost the same as calm.

    -> resummon_check

= resummon_check

// ── MOVEMENT 4: RESULT ───────────────────────────────────────────

{ calm >= 20:
    -> resummon_success
- else:
    -> resummon_forced
}

= resummon_success
~ face_worn = true
~ face_stable = true

She finds the calm. Not much of it. Enough.

The face comes forward the way something surfaces in water — slow, then sudden.

She is in the girl's form. Pajamas. No shoes. Hair on one side of her face from sleep that was not her sleep.

She looks at her hands.

The girl's hands.

Her hands.

She understands, for the first time and not for the last time, that those are the same thing now.

-> dawn_emergence

= resummon_forced
// Dawn breaks before she reaches the threshold.
// The light forces the issue. The face comes forward — but not cleanly.
~ face_worn = true
~ face_stable = false
~ calm = calm + 10

The light finds her before she finds the calm.

Something in the old rules of what she is — daylight, exposure, the form that cannot sustain — forces the face forward without her choosing it.

She is in the girl's form. But it is not the same as choosing.

The face sits on her the way a coat sits on someone who put it on wrong. Technically correct. Slightly off in ways she cannot name yet and other people will notice before she does.

-> dawn_emergence

// ── MOVEMENT 5: DAWN / TOWARD BEAUREGARDE ────────────────────────

= dawn_emergence

// [DAYLIGHT — scene palette shifts from blue-black to gray-gold]
// [Player is now in human movement mode — face worn]
// [14 miles to Beauregarde city limits]

Morning.

The highway is starting to carry trucks. The kind that go somewhere and back and don't look twice.

She has no shoes. No money. No phone. She has the girl's face and the boo hag's fourteen miles of geography filed under a section of the library she cannot name yet.

She knows where Beauregarde is. She does not know why she needs to go there. The knowing came first. The reason is somewhere in the library.

She'll find it when the tornado settles.

// THREE OPTIONS for getting to Beauregarde

* [Walk the highway shoulder. Stay visible. Look like what she looks like — a girl in pajamas who needs help.]
    { face_stable:
        A truck slows down within a mile. The driver is the kind of person who stops for girls on the side of the road at dawn and means nothing bad by it.
        He asks where she's headed.
        She says: Beauregarde.
        He says: I go right past.
        She gets in.
        -> truck_ride
    - else:
        The first truck slows. The driver looks at her face and does not stop.
        Something about it is wrong in a way his body understands before his mind does.
        She walks.
        -> walking_in
    }

* [Stay off the highway. Move through the tree line and fields. Take longer. Arrive unseen.]
    ~ calm = calm + 5
    The walking is slow. The morning is cold and she does not feel it correctly.
    But the fields are quiet. The tornado settles slightly when nothing is asking her to be human.
    She reaches the city limits ninety minutes later. No one saw her come.
    -> city_limits_unseen

* [Find a car. The library has three hundred years of knowing which cars can be started without keys.]
    ~ calm = calm - 5
    // [PLAYER — navigate to roadside vehicles]
    // [Abandoned pickup beside the old gas station — unlocked]
    The truck starts.
    She knows how she knows how to do this. She does not examine that right now.
    -> driving_in

// ── ARRIVAL APPROACHES ────────────────────────────────────────────

=== truck_ride ===
// The driver does not look at her again after the first minute.
// Something about the quality of her stillness makes conversation feel unnecessary.
// She watches the city come up from flat land.

The city rises out of the flat.

She has — the library provides this without being asked — a history of this city going back further than its current name. She closes that file.

She needs somewhere to go. She does not know anyone here.

The boo hag knew someone here. Many someones. The thread is in the library.

She just has to find it.

The driver lets her out at a gas station on the edge of the city.

She stands on concrete in bare feet and the city makes its sounds around her.

-> beauregarde_outskirts

=== walking_in ===
// Fourteen miles on the highway shoulder.
// Three cop cars pass going the other direction — toward the diner, toward the house.
// None of them stop.
// She looks like a girl who had a bad night.
// She did.

The city rises out of the flat.

Her feet know about every mile of it. She has learned this from the walking.

-> beauregarde_outskirts

=== city_limits_unseen ===
// She arrives at the city limits through a field.
// No one saw her come.
// She likes that. Files it.

The city from the edge of a field looks like a watercolor someone left in the rain.

She does not know anyone here.
The boo hag did.

-> beauregarde_outskirts

=== driving_in ===
// She drives the speed limit exactly.
// She does not know why she knows to do that either.
// She parks the truck on a side street.
// Leaves the keys in it.

{ calm >= 20:
    Leaving the keys felt like the right thing to do. She is still deciding what right means for something like her.
- else:
    She leaves the keys because she is done with the truck, not because of anything else.
}

-> beauregarde_outskirts

// ═══════════════════════════════════════════════════════════════
// BEAUREGARDE OUTSKIRTS — END OF SCENE 2 (SHED)
// She is in the city. No shoes. No money. No shelter.
// The face is worn — stable or unstable.
// The library is beginning to settle.
// Somewhere in it: a thread. A name. A place the boo hag knew.
// Scene 3 begins here. [TO BE WRITTEN]
// ═══════════════════════════════════════════════════════════════

=== beauregarde_outskirts ===
~ consciousness = 1

Beauregarde.

She knows this city without having been here. Three hundred years of knowing filed under a category she still does not have her own word for.

What she needs:
Shelter. Before the face starts costing more than she has.
Something to wear that is not pajamas.
Time. To let the tornado settle.

What she has:
The face.
The library.
Fourteen miles of walking behind her and the whole city ahead.

She starts looking for the thread.

// [SCENE 3 — TO BE WRITTEN]
-> END
