# HATCHLING — Items & Locations Reference

> ⚠️ **KEEP THIS FILE UPDATED.** Any time an item is added, moved, repriced, or removed — update this file first. Cross-check here when wiring new scenes, writing dialogue, or balancing economy. Last updated: 2026-05-26.

---

## CARRIED ITEMS (ITEM_DEFS)

All items the player can hold in inventory. Used in the Device HUD → ITEMS tab.

### CLOTHES

| ID | Display Name | Equippable | Restore | Description |
|----|-------------|-----------|---------|-------------|
| `underwear` | UNDERWEAR | ✅ | 0% | What I was wearing when I woke up. |
| `rags` | RAGS | ✅ | 0% | Tattered clothes. This is what I wear. This is what I am. |
| `hoodie` | BLACK HOODIE | ✅ | 0% | An old black hoodie with a huge hood. I may be able to hide my tentacles. |

> **Outfit logic:** Equipping clothes calls `handleEquipItem(id)` → updates `currentOutfit` → switches character animation set.

### FOOD & DRINK

| ID | Display Name | Equippable | Restore | Description |
|----|-------------|-----------|---------|-------------|
| `sandwich` | SANDWICH | ❌ | +8% | Enough. |
| `water` | WATER | ❌ | +10% | Necessary. For both of them. |

### MEDICINE *(currently categorised as FOOD — needs reclassifying)*

| ID | Display Name | Equippable | Restore | Description |
|----|-------------|-----------|---------|-------------|
| `bandages` | BANDAGES | ❌ | +20% | Keeping things covered. |
| `painkillers` | PAINKILLERS | ❌ | +40% | Chemical numbness. Not ideal but functional. |

### MISC

| ID | Display Name | Equippable | Restore | Description |
|----|-------------|-----------|---------|-------------|
| `phone` | CRACKED PHONE | ❌ | 0% | A cracked smartphone. Unlocked. Deliberately wiped. Someone left this for me. |

> **Phone logic:** Picking up the phone sets `hasPhone=true`, unlocking the Device HUD (I / Shift).

---

## WHERE ITEMS ARE FOUND (Scene Pickups — Free)

Items found in the world with no cost. Interact with `[ E ]`.

| Item(s) | Scene | Object / Location | World X | Trigger |
|---------|-------|-------------------|---------|---------|
| `phone` | **BATHROOM** | Toilet | 437–583 | Press `[ E ]` → popup → confirm → `hasPhone=true` + added to inventory |
| `rags` + `hoodie` | **APARTMENT** | Bed | 255–408 | Press `[ E ]` → popup → confirm → both added to inventory, rags auto-equipped |
| `$12` *(money)* | **APARTMENT** | Cabinet | wx:730 | Press `[ E ]` → popup → confirm → money set to $12 |
| `sandwich` + `water` | **CORNER STORE** | Raymond (no money) | Counter | Raymond's dialogue → network gives free items if broke |

> **One-time pickups:** Bed prompt disappears after clothes are taken (`clothesTaken` flag). Cabinet prompt disappears after money is taken.

---

## STORE ITEMS (Purchasable — Corner Store)

Raymond's corner store. Located in **STORE SCENE**.

| ID | Display Name | Price | Shelf World X | Notes |
|----|-------------|-------|---------------|-------|
| `painkillers` | PAINKILLERS | $4 | wx:560 | Medicine. Restores 40% vitals. |
| `bandages` | BANDAGES | $3 | wx:700 | Medicine. Restores 20% vitals. |
| `water` | WATER | $2 | wx:840 | Food/drink. Restores 10% vitals. |
| `sandwich` | SANDWICH | $2 | wx:980 | Food. Restores 8% vitals. |

> **Purchase flow:** Player walks to shelf → basket preview → walks to counter → conversation tree → pay or leave.
> **Stealing:** Detectable. Raymond calls it out. Player can pay retroactively or lose standing.
> **Network credit:** If player has no money, Raymond gives bread + water free via network.

---

## PHARMACY ITEMS

*Currently empty — to be added with quests.*

| ID | Display Name | Price | Notes |
|----|-------------|-------|-------|
| *(TBD)* | | | Medicine, special items |

---

## RESTAURANT ITEMS

*Currently empty — to be added with quests.*

| ID | Display Name | Price | Notes |
|----|-------------|-------|-------|
| *(TBD)* | | | Diego's special integration food, healing ingredients |

> Diego mentions: "Come back tomorrow. I make you special food. Ingredients to help with healing. Help with integration."

---

## SCENE LOCATIONS

All accessible scenes and their key interactables.

### BATHROOM — 4C Oakwood Arms
*Entry point. Shower sequence plays first.*

| Object | World X | Prompt | Action |
|--------|---------|--------|--------|
| Toilet | 437–583 | `[ E ] LOOK` | Pickup cracked phone |
| Sink | off-screen | `[ E ] LOOK` | Flavour text |
| Mirror | 650–1000 | `[ E ] LOOK` | Mirror dialogue sequence |
| Medicine Cabinet | wx:950 | `[ E ] OPEN` | Flavour text (empty) |
| Door | 980–1200 | `[ E ] LEAVE` | → Apartment |

---

### APARTMENT — 4C Oakwood Arms

| Object | World X | Prompt | Action |
|--------|---------|--------|--------|
| Bathroom entrance | wx:80 | `ENTER BATHROOM` | → Bathroom |
| Hallway exit | wx:143 | `LEAVE` | → Hallway |
| **Bed** | **255–408** | `[ E ] SEARCH BED` | **Pickup rags + hoodie** |
| Computer | wx:520 | `USE COMPUTER` | Needs password (COLLETTE) |
| Cabinet (money) | wx:730 | `OPEN CABINET` | Pickup $12 (one-time) |
| Sink | wx:845 | `LOOK SINK` | Flavour text |
| Cabinet | wx:935 | `OPEN CABINET` | Flavour text |
| Fridge | wx:1070 | `OPEN FRIDGE` | Flavour text |
| Window | wx:1200 | `LOOK OUTSIDE` | Flavour text |

---

### HALLWAY — 4th Floor

| Object | World X | Prompt | Action |
|--------|---------|--------|--------|
| Elevator | 217–320 | `[ E ] ELEVATOR` | → Elevator scene |
| Stairs Up | 401–500 | `[ E ] STAIRS UP` | Flavour (nothing up there) |
| Stairs Down | 553–599 | `[ E ] STAIRS DOWN` | Flavour (broken) |
| Door 4A | 643–684 | `[ E ] KNOCK` | Flavour (no answer) |
| Door 4B | 824–877 | `[ E ] KNOCK` | Flavour (busy) |
| Door 4C | 1008–1054 | `[ E ] YOUR ROOM` | → Apartment |

---

### STREET — The Veil / MOVE Block

| Location | Street X Range | Label | Leads To |
|----------|---------------|-------|---------|
| Pharmacy | 512–537 | PHARMACY | → Pharmacy scene |
| Corner Store | 345–414 | CONVENIENT STORE | → Store scene |
| Lobby | 1214–1269 | LOBBY ENTRANCE | → Hallway/Lobby |
| Restaurant | 1497–1529 | RESTAURANT | → Restaurant scene |

---

### CORNER STORE

| Object | World X | Action |
|--------|---------|--------|
| Painkillers shelf | wx:560 | Add to basket ($4) |
| Bandages shelf | wx:700 | Add to basket ($3) |
| Water shelf | wx:840 | Add to basket ($2) |
| Bread shelf | wx:980 | Add to basket ($2) |
| Counter | px>900 | Checkout / conversation |
| Exit | px<200 | Leave |

NPC: **Raymond** — conversation trees: `raymond_browse`, `raymond_pay`, `raymond_caught`, `raymond_broke`

---

### PHARMACY

NPC: **Pharmacist** — gives card for Dr. Chen.
Items: *(to be added)*
Location: East MOVE Block

---

### RESTAURANT

NPC: **Diego** — gives hostel address, computer password (COLLETTE), integration food.
Items: *(to be added)*
Location: East MOVE Block

---

## ECONOMY SUMMARY

| Starting money | $0 |
|---------------|-----|
| Found in apartment | $12 |
| Cheapest item (store) | bread $2 / water $2 |
| Most expensive (store) | painkillers $4 |
| Full store basket | $11 |
| Network credit | bread + water free if broke |

---

## ITEMS TO ADD (Planned)

- [ ] **Hostel key / address** — given by Diego, leads to safe house
- [ ] **Dr. Chen card** — given by pharmacist, unlocks clinic access
- [ ] **Integration food** — Diego's special meal, helps octopus bonding
- [ ] **Computer password note** — physical item (alternative to memory)
- [ ] **Network contacts card** — Raymond or Pharmacist
- [ ] **Pharmacy medicine** — specific items TBD
- [ ] **Ingredients** — ITEMS tab `ingredients` category currently empty

---

*See also: [DESIGN_DOCUMENTATION.md](DESIGN_DOCUMENTATION.md) for full UI/color/sizing reference.*
