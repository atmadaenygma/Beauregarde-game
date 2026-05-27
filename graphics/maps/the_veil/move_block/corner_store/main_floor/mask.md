# MASK
# Canvas: 1280x720px
# Map ID: corner_store_main_floor
# Parent: corner_store

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

## Map Transitions
# - id: exit_door
#   X: 0
#   Y: 0
#   leads_to: apartment_building_exterior
#   direction: down
#   return_to_interact: interact_corner_store

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
