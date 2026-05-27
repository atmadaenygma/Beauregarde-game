# MASK
# Canvas: 1280x720px
# Map ID: apartment_building_exterior
# Parent: apartment_building
#
# NOTE: This exterior is the SHARED exterior for multiple locations on the MOVE Block.
# The restaurant, pharmacy, corner store, and Octavia's apartment are all accessed via
# [e] interact buttons on THIS map. None of those locations have a standalone exterior.
# Exit from any of their interiors returns to the same [e] button position here.

## Ground Line
# Y: 0  — set pixel value when art is ready

## Horizontal Boundaries
# Left_Wall:  X: 0
# Right_Wall: X: 1280

## Ceiling
# Y: 0  — set when art is ready

## Platforms and Elevation Changes
# - id: platform_01
#   X_start: 0
#   X_end: 0
#   Y: 0
#   accessible_by: jump | ladder | stairs

## Impassable Zones
# - id: wall_01
#   X_start: 0
#   X_end: 0
#   Y_start: 0
#   Y_end: 0
#   type: wall | furniture | locked_door | counter

## Map Transitions (side-scroll exits — street level)
# - id: exit_left
#   X: 0
#   Y: 0
#   leads_to: move_block_street
#   direction: left
#
# - id: exit_right
#   X: 1280
#   Y: 0
#   leads_to: move_block_street
#   direction: right

## Interact Zones ([e] Buttons — door entrances)
# These are press-to-enter interactions, not walk-through transitions.
# Character stops at the door, [e] prompt appears, entry triggers interior load.
# Exit from each interior returns Octavia to the matching interact zone X position.
#
# - id: interact_restaurant
#   X: 0
#   Y: 0
#   type: enter
#   leads_to: restaurant_interior
#   label: "Enter Restaurant"
#   return_X: 0
#
# - id: interact_pharmacy
#   X: 0
#   Y: 0
#   type: enter
#   leads_to: pharmacy_interior
#   label: "Enter Pharmacy"
#   return_X: 0
#
# - id: interact_corner_store
#   X: 0
#   Y: 0
#   type: enter
#   leads_to: corner_store_main_floor
#   label: "Enter Corner Store"
#   return_X: 0
#
# - id: interact_apartment_lobby
#   X: 0
#   Y: 0
#   type: enter
#   leads_to: apartment_building_lobby
#   label: "Enter Building"
#   return_X: 0

## Climbable Surfaces (ladders)
# - id: ladder_01
#   X: 0
#   Y_top: 0
#   Y_bottom: 0

## Hide Spots
# - id: hide_01
#   X: 0
#   Y: 0
#   type: shadow | furniture | crowd
