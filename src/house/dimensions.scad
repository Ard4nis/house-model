/*
 * House dimensions
 *
 * All values are real-world millimetres.
 *
 * Dimension categories:
 *
 *   MEASURED
 *     Directly measured or otherwise known dimensions.
 *
 *   PLAN
 *     Dimensions shown on the historical floor plan.
 *
 *   DERIVED
 *     Dimensions calculated from plan values and known wall thicknesses.
 *
 *   PROVISIONAL
 *     Deliberately rounded or approximate modelling values.
 *
 * IMPORTANT:
 *
 * The historical floor plan is explicitly marked as approximate.
 * Derived dimensions must therefore not be treated as survey-grade
 * measurements.
 */


// ===========================================================================
// Vertical reference levels
// ===========================================================================

// Main-house finished floor.
MAIN_FLOOR_Z = 0;


// Current eastern addition is approximately 300 mm lower.
//
// PROVISIONAL until directly measured.
EAST_EXTENSION_FLOOR_DROP = 300;

EAST_EXTENSION_FLOOR_Z =
    MAIN_FLOOR_Z
    - EAST_EXTENSION_FLOOR_DROP;


// ===========================================================================
// Wall construction
// ===========================================================================

WALL_EXTERIOR = 400;

WALL_LEGACY_EXTERIOR = 400;

WALL_PARTITION = 100;


// ===========================================================================
// Known renovation dimensions
// ===========================================================================

EAST_EXTENSION_WIDTH = 4000;


// ===========================================================================
// Historical plan dimensions
// ===========================================================================


// ---------------------------------------------------------------------------
// North/main block — west side
// ---------------------------------------------------------------------------

PLAN_NW_BATH_DEPTH = 2830;


// Nova's bedroom.
//
// Historical drawing dimensions.
PLAN_NOVA_ROOM_WIDTH = 2700;

PLAN_NOVA_ROOM_DEPTH = 4250;


// ---------------------------------------------------------------------------
// North/main block — east side
// ---------------------------------------------------------------------------

PLAN_NE_BEDROOM_DEPTH = 4240;

PLAN_SE_BEDROOM_DEPTH = 2670;


// ---------------------------------------------------------------------------
// Northern row — west-to-east clear dimensions
// ---------------------------------------------------------------------------

PLAN_NORTH_BATH_WIDTH = 2000;

PLAN_ENTRANCE_WIDTH = 1710;

PLAN_NORTH_BEDROOM_1_WIDTH = 2480;

PLAN_NORTH_BEDROOM_2_WIDTH = 2470;

PLAN_UTILITY_WIDTH = 2300;

PLAN_NORTH_SMALL_SECTION_WIDTH = 1500;

PLAN_NE_BEDROOM_WIDTH = 2980;


// Several northern rooms are shown as approximately 3200 mm deep.
//
// Used only as a provisional layout anchor.
PLAN_NORTH_ROW_ROOM_DEPTH = 3200;


// Bryggers clear north-south depth.
PLAN_UTILITY_DEPTH = 2640;


// ---------------------------------------------------------------------------
// Southern block
// ---------------------------------------------------------------------------

PLAN_SOUTH_BEDROOM_WIDTH = 3000;

PLAN_LIVING_ROOM_WIDTH = 6000;

PLAN_SOUTH_BEDROOM_DEPTH = 4650;

PLAN_LIVING_ROOM_DEPTH = 4750;


// ===========================================================================
// Derived north/main-block dimensions
// ===========================================================================


// ---------------------------------------------------------------------------
// North/main block width
// ---------------------------------------------------------------------------

PLAN_NORTH_CLEAR_WIDTH =
    PLAN_NORTH_BATH_WIDTH
    + PLAN_ENTRANCE_WIDTH
    + PLAN_NORTH_BEDROOM_1_WIDTH
    + PLAN_NORTH_BEDROOM_2_WIDTH
    + PLAN_UTILITY_WIDTH
    + PLAN_NORTH_SMALL_SECTION_WIDTH
    + PLAN_NE_BEDROOM_WIDTH;


DERIVED_NORTH_BLOCK_WIDTH =
    WALL_EXTERIOR
    + PLAN_NORTH_CLEAR_WIDTH
    + (5 * WALL_PARTITION)
    + WALL_LEGACY_EXTERIOR
    + WALL_EXTERIOR;


NORTH_BLOCK_WIDTH =
    DERIVED_NORTH_BLOCK_WIDTH;


// ---------------------------------------------------------------------------
// North/main block depth
// ---------------------------------------------------------------------------

DERIVED_NORTH_BLOCK_DEPTH_WEST =
    WALL_EXTERIOR
    + PLAN_NW_BATH_DEPTH
    + WALL_PARTITION
    + PLAN_NOVA_ROOM_DEPTH
    + WALL_LEGACY_EXTERIOR;


DERIVED_NORTH_BLOCK_DEPTH_EAST =
    WALL_EXTERIOR
    + PLAN_NE_BEDROOM_DEPTH
    + WALL_PARTITION
    + PLAN_SE_BEDROOM_DEPTH
    + WALL_EXTERIOR;


DERIVED_NORTH_BLOCK_DEPTH_DIFFERENCE =
    abs(
        DERIVED_NORTH_BLOCK_DEPTH_WEST
        - DERIVED_NORTH_BLOCK_DEPTH_EAST
    );


// PROVISIONAL.
NORTH_BLOCK_DEPTH = 7900;


// ===========================================================================
// Derived southern-block dimensions
// ===========================================================================

DERIVED_SOUTH_BLOCK_WIDTH =
    WALL_EXTERIOR
    + PLAN_SOUTH_BEDROOM_WIDTH
    + WALL_PARTITION
    + PLAN_LIVING_ROOM_WIDTH
    + WALL_EXTERIOR;


SOUTH_BLOCK_WIDTH =
    DERIVED_SOUTH_BLOCK_WIDTH;


DERIVED_SOUTH_BLOCK_DEPTH_WEST =
    WALL_LEGACY_EXTERIOR
    + PLAN_SOUTH_BEDROOM_DEPTH
    + WALL_EXTERIOR;


DERIVED_SOUTH_BLOCK_DEPTH_EAST =
    WALL_LEGACY_EXTERIOR
    + PLAN_LIVING_ROOM_DEPTH
    + WALL_EXTERIOR;


DERIVED_SOUTH_BLOCK_DEPTH_DIFFERENCE =
    abs(
        DERIVED_SOUTH_BLOCK_DEPTH_WEST
        - DERIVED_SOUTH_BLOCK_DEPTH_EAST
    );


// PROVISIONAL.
SOUTH_BLOCK_DEPTH = 5500;


// ===========================================================================
// Block relationships
// ===========================================================================

NORTH_BLOCK_SOUTH_Y =
    SOUTH_BLOCK_DEPTH
    - WALL_LEGACY_EXTERIOR;


HOUSE_TOTAL_DEPTH =
    SOUTH_BLOCK_DEPTH
    + NORTH_BLOCK_DEPTH
    - WALL_LEGACY_EXTERIOR;


// ===========================================================================
// Current overall footprint
// ===========================================================================

HOUSE_MAX_WIDTH =
    NORTH_BLOCK_WIDTH
    + EAST_EXTENSION_WIDTH;


HOUSE_MAX_DEPTH =
    HOUSE_TOTAL_DEPTH;


HOUSE_NORTH_INTERIOR_Y =
    HOUSE_MAX_DEPTH
    - WALL_EXTERIOR;


// ===========================================================================
// Legacy exterior-wall placement
// ===========================================================================


// ---------------------------------------------------------------------------
// Former south exterior wall
// ---------------------------------------------------------------------------

LEGACY_SOUTH_WALL_X = 0;

LEGACY_SOUTH_WALL_Y =
    NORTH_BLOCK_SOUTH_Y;

LEGACY_SOUTH_WALL_LENGTH =
    SOUTH_BLOCK_WIDTH;


// ---------------------------------------------------------------------------
// 2013 former east exterior wall
// ---------------------------------------------------------------------------

LEGACY_2013_EAST_WALL_X =
    WALL_EXTERIOR
    + PLAN_NORTH_BATH_WIDTH
    + WALL_PARTITION
    + PLAN_ENTRANCE_WIDTH
    + WALL_PARTITION
    + PLAN_NORTH_BEDROOM_1_WIDTH
    + WALL_PARTITION
    + PLAN_NORTH_BEDROOM_2_WIDTH
    + WALL_PARTITION
    + PLAN_UTILITY_WIDTH;


LEGACY_2013_EAST_WALL_Y =
    NORTH_BLOCK_SOUTH_Y;


LEGACY_2013_EAST_WALL_LENGTH =
    HOUSE_MAX_DEPTH
    - NORTH_BLOCK_SOUTH_Y;


// ---------------------------------------------------------------------------
// Former east exterior wall before current extension
// ---------------------------------------------------------------------------

LEGACY_CURRENT_EXTENSION_WALL_X =
    NORTH_BLOCK_WIDTH
    - WALL_LEGACY_EXTERIOR;


LEGACY_CURRENT_EXTENSION_WALL_Y =
    NORTH_BLOCK_SOUTH_Y;


LEGACY_CURRENT_EXTENSION_WALL_LENGTH =
    HOUSE_MAX_DEPTH
    - NORTH_BLOCK_SOUTH_Y;


// ===========================================================================
// Southern-block wall-height reference
// ===========================================================================
//
// We are NOT modelling the roof.
//
// These values describe approximate cutaway-wall heights.
//

SOUTH_BLOCK_CEILING_SOUTH_Y =
    WALL_EXTERIOR;


SOUTH_BLOCK_CEILING_NORTH_Y =
    NORTH_BLOCK_SOUTH_Y;


// MEASURED (approx.). At the inside face of the south exterior wall.
SOUTH_BLOCK_CEILING_SOUTH_HEIGHT = 2200;


// MEASURED (approx.). At the south face of the legacy south wall.
//
// Was 2600 (provisional) before measuring.
SOUTH_BLOCK_CEILING_NORTH_HEIGHT = 2500;


SOUTH_BLOCK_CEILING_RISE =
    SOUTH_BLOCK_CEILING_NORTH_HEIGHT
    - SOUTH_BLOCK_CEILING_SOUTH_HEIGHT;


SOUTH_BLOCK_CEILING_RUN =
    SOUTH_BLOCK_CEILING_NORTH_Y
    - SOUTH_BLOCK_CEILING_SOUTH_Y;


SOUTH_BLOCK_CEILING_SLOPE_ANGLE =
    atan(
        SOUTH_BLOCK_CEILING_RISE
        / SOUTH_BLOCK_CEILING_RUN
    );


function south_block_ceiling_height(y) =
    SOUTH_BLOCK_CEILING_SOUTH_HEIGHT
    + (
        (y - SOUTH_BLOCK_CEILING_SOUTH_Y)
        / SOUTH_BLOCK_CEILING_RUN
    )
    * SOUTH_BLOCK_CEILING_RISE;


// ===========================================================================
// Hailey's bedroom
// ===========================================================================

HAILEY_ROOM_X =
    WALL_EXTERIOR;


HAILEY_ROOM_Y =
    WALL_EXTERIOR;


HAILEY_ROOM_WIDTH =
    PLAN_SOUTH_BEDROOM_WIDTH;


HAILEY_ROOM_DEPTH =
    NORTH_BLOCK_SOUTH_Y
    - WALL_EXTERIOR;


HAILEY_ROOM_PLAN_DEPTH_DIFFERENCE =
    HAILEY_ROOM_DEPTH
    - PLAN_SOUTH_BEDROOM_DEPTH;


// ---------------------------------------------------------------------------
// Hailey / Stue partition
// ---------------------------------------------------------------------------

HAILEY_EAST_PARTITION_X =
    HAILEY_ROOM_X
    + HAILEY_ROOM_WIDTH;


HAILEY_EAST_PARTITION_Y =
    HAILEY_ROOM_Y;


HAILEY_EAST_PARTITION_LENGTH =
    HAILEY_ROOM_DEPTH;


// ---------------------------------------------------------------------------
// Hailey wall-height references
// ---------------------------------------------------------------------------

HAILEY_CEILING_SOUTH_HEIGHT =
    south_block_ceiling_height(
        HAILEY_ROOM_Y
    );


HAILEY_CEILING_NORTH_HEIGHT =
    south_block_ceiling_height(
        HAILEY_ROOM_Y
        + HAILEY_ROOM_DEPTH
    );


// ===========================================================================
// Stue
// ===========================================================================

STUE_ROOM_X =
    HAILEY_EAST_PARTITION_X
    + WALL_PARTITION;


STUE_ROOM_Y =
    WALL_EXTERIOR;


STUE_ROOM_WIDTH =
    (SOUTH_BLOCK_WIDTH - WALL_EXTERIOR)
    - STUE_ROOM_X;


STUE_ROOM_DEPTH =
    NORTH_BLOCK_SOUTH_Y
    - WALL_EXTERIOR;


STUE_ROOM_PLAN_WIDTH_DIFFERENCE =
    STUE_ROOM_WIDTH
    - PLAN_LIVING_ROOM_WIDTH;


STUE_ROOM_PLAN_DEPTH_DIFFERENCE =
    STUE_ROOM_DEPTH
    - PLAN_LIVING_ROOM_DEPTH;


STUE_CEILING_SOUTH_HEIGHT =
    south_block_ceiling_height(
        STUE_ROOM_Y
    );


STUE_CEILING_NORTH_HEIGHT =
    south_block_ceiling_height(
        STUE_ROOM_Y
        + STUE_ROOM_DEPTH
    );


// ===========================================================================
// Alrum — north/south anchors
// ===========================================================================

ALRUM_ROOM_Y =
    LEGACY_SOUTH_WALL_Y
    + WALL_LEGACY_EXTERIOR;


// PROVISIONAL.
//
// Main northern edge of Alrum. Alrum also extends farther north beneath
// the Bryggers; see "Alrum north bump" at the end of this file.
//
// Northern rooms currently provide this working northern edge:
//
//   12600 north interior face
//   - 3200 northern-row room depth
//   -  100 partition
//   = 9300
ALRUM_ROOM_NORTH_Y =
    HOUSE_NORTH_INTERIOR_Y
    - PLAN_NORTH_ROW_ROOM_DEPTH
    - WALL_PARTITION;


ALRUM_ROOM_DEPTH =
    ALRUM_ROOM_NORTH_Y
    - ALRUM_ROOM_Y;


// ===========================================================================
// Nova's bedroom
// ===========================================================================
//
// Nova's bedroom is directly north of Hailey's bedroom and west of Alrum.
//
// Historical drawing:
//
//   approximately 2700 x 4250 mm
//
// Real-world observation:
//
//   Nova's room extends approximately 300 mm farther north than Alrum.
//
// The small black wall projection visible in the Entré area of the
// historical drawing (now the master bedroom) corresponds to the
// continuation of Nova's east wall.
//
// Current model:
//
//   west edge:    x = 400
//   east edge:    x = 3100
//
//   south edge:   y = 5500
//   north edge:   y = 9600
//
//   clear size:   2700 x 4100 mm
//
// Historical-plan depth difference:
//
//   4100 - 4250 = -150 mm
//


// ---------------------------------------------------------------------------
// Clear room
// ---------------------------------------------------------------------------

NOVA_ROOM_X =
    WALL_EXTERIOR;


NOVA_ROOM_Y =
    ALRUM_ROOM_Y;


NOVA_ROOM_WIDTH =
    PLAN_NOVA_ROOM_WIDTH;


// PROVISIONAL real-world relationship.
//
// Nova's room continues approximately 300 mm north of Alrum.
NOVA_ROOM_NORTH_EXTENSION = 300;


NOVA_ROOM_NORTH_Y =
    ALRUM_ROOM_NORTH_Y
    + NOVA_ROOM_NORTH_EXTENSION;


NOVA_ROOM_DEPTH =
    NOVA_ROOM_NORTH_Y
    - NOVA_ROOM_Y;


NOVA_ROOM_PLAN_WIDTH_DIFFERENCE =
    NOVA_ROOM_WIDTH
    - PLAN_NOVA_ROOM_WIDTH;


NOVA_ROOM_PLAN_DEPTH_DIFFERENCE =
    NOVA_ROOM_DEPTH
    - PLAN_NOVA_ROOM_DEPTH;


// ---------------------------------------------------------------------------
// Nova / Alrum east partition
// ---------------------------------------------------------------------------
//
// The partition continues beyond Alrum by approximately 300 mm.
//
// This creates the small wall projection in the master bedroom
// (the Entré on the historical drawing).
//

NOVA_EAST_PARTITION_X =
    NOVA_ROOM_X
    + NOVA_ROOM_WIDTH;


NOVA_EAST_PARTITION_Y =
    NOVA_ROOM_Y;


NOVA_EAST_PARTITION_LENGTH =
    NOVA_ROOM_DEPTH;


// ---------------------------------------------------------------------------
// Nova east-wall projection beyond Alrum
// ---------------------------------------------------------------------------

NOVA_EAST_WALL_STUB_Y =
    ALRUM_ROOM_NORTH_Y;


NOVA_EAST_WALL_STUB_LENGTH =
    NOVA_ROOM_NORTH_EXTENSION;


// ---------------------------------------------------------------------------
// Nova north partition
// ---------------------------------------------------------------------------
//
// Nova's clear room ends at:
//
//   y = 9600
//
// The north partition occupies:
//
//   y = 9600 -> 9700
//

NOVA_NORTH_PARTITION_X =
    NOVA_ROOM_X;


NOVA_NORTH_PARTITION_Y =
    NOVA_ROOM_NORTH_Y;


NOVA_NORTH_PARTITION_LENGTH =
    NOVA_ROOM_WIDTH
    + WALL_PARTITION;


// ===========================================================================
// Green bathroom
// ===========================================================================
//
// The "big bathroom": north-west corner, directly north of Nova's bedroom.
//
// Historical drawing:
//
//   approximately 2000 x 2830 mm
//
// Current model:
//
//   west edge:    x = 400     (north-west exterior wall inside face)
//   east edge:    x = 2400
//
//   south edge:   y = 9700    (north face of Nova's north partition)
//   north edge:   y = 12600   (north exterior wall inside face)
//
//   clear size:   2000 x 2900 mm
//
// Historical-plan depth difference:
//
//   2900 - 2830 = +70 mm
//
// The +70 mm is consistent with a rough real-world measurement, so the
// derived depth is accepted.
//


// ---------------------------------------------------------------------------
// Clear room
// ---------------------------------------------------------------------------

GREEN_BATHROOM_X =
    WALL_EXTERIOR;


GREEN_BATHROOM_Y =
    NOVA_NORTH_PARTITION_Y
    + WALL_PARTITION;


// PLAN.
GREEN_BATHROOM_WIDTH =
    PLAN_NORTH_BATH_WIDTH;


GREEN_BATHROOM_NORTH_Y =
    HOUSE_NORTH_INTERIOR_Y;


// DERIVED, confirmed by rough measurement.
GREEN_BATHROOM_DEPTH =
    GREEN_BATHROOM_NORTH_Y
    - GREEN_BATHROOM_Y;


GREEN_BATHROOM_PLAN_DEPTH_DIFFERENCE =
    GREEN_BATHROOM_DEPTH
    - PLAN_NW_BATH_DEPTH;


// ---------------------------------------------------------------------------
// Shower (fixture reference)
// ---------------------------------------------------------------------------
//
// MEASURED (approx.). In the north-west corner, against the north and west
// exterior walls. The north-wall window starts where the shower ends.
//
// Recorded for the later fixtures pass; no geometry yet.
//

// East-west, out from the west wall.
GREEN_BATHROOM_SHOWER_DEPTH = 800;

// North-south, along the west wall.
GREEN_BATHROOM_SHOWER_WIDTH = 1000;


// ---------------------------------------------------------------------------
// Green bathroom east partition
// ---------------------------------------------------------------------------
//
// Separates the green bathroom from the master bedroom.
//
// Runs from Nova's north partition to the north exterior wall:
//
//   x = 2400 -> 2500
//   y = 9700 -> 12600
//
// This is the first partition in the northern-row chain used to derive
// LEGACY_2013_EAST_WALL_X.
//

GREEN_BATHROOM_EAST_PARTITION_X =
    GREEN_BATHROOM_X
    + GREEN_BATHROOM_WIDTH;


GREEN_BATHROOM_EAST_PARTITION_Y =
    GREEN_BATHROOM_Y;


GREEN_BATHROOM_EAST_PARTITION_LENGTH =
    GREEN_BATHROOM_DEPTH;


// ===========================================================================
// Alrum / kitchen
// ===========================================================================
//
// Alrum is one continuous room containing:
//
//   - dining / general Alrum
//   - kitchen
//   - circulation / Gang
//
// Its western boundary is the east face of Nova's bedroom partition.
//


// ---------------------------------------------------------------------------
// West boundary
// ---------------------------------------------------------------------------

ALRUM_ROOM_X =
    NOVA_EAST_PARTITION_X
    + WALL_PARTITION;


// ---------------------------------------------------------------------------
// East boundary
// ---------------------------------------------------------------------------

ALRUM_ROOM_EAST_X =
    LEGACY_2013_EAST_WALL_X;


ALRUM_ROOM_WIDTH =
    ALRUM_ROOM_EAST_X
    - ALRUM_ROOM_X;


// ===========================================================================
// Alrum kitchen zone
// ===========================================================================
//
// PROVISIONAL.
//
// Approximate width:
//
//   600 worktop
//   + 900 terrace-door / circulation opening
//   + 600 worktop
//
//   = 2100 mm
//

ALRUM_KITCHEN_WIDTH = 2100;

ALRUM_KITCHEN_DEPTH = 2000;


ALRUM_KITCHEN_X =
    ALRUM_ROOM_EAST_X
    - ALRUM_KITCHEN_WIDTH;


ALRUM_KITCHEN_Y =
    ALRUM_ROOM_Y;


// ===========================================================================
// Alrum half-wall
// ===========================================================================
//
// PROVISIONAL plan position only.
//
// Runs north from the southern Alrum boundary.
//

ALRUM_HALF_WALL_LENGTH = 2600;


// MEASURED.
//
// Height above main finished floor.
ALRUM_HALF_WALL_HEIGHT = 1200;

ALRUM_HALF_WALL_THICKNESS =
    WALL_PARTITION;


ALRUM_HALF_WALL_X =
    ALRUM_KITCHEN_X
    - ALRUM_HALF_WALL_THICKNESS;


ALRUM_HALF_WALL_Y =
    ALRUM_ROOM_Y;


// ===========================================================================
// Alrum circulation / Gang
// ===========================================================================

ALRUM_GANG_X =
    ALRUM_KITCHEN_X;


ALRUM_GANG_Y =
    ALRUM_KITCHEN_Y
    + ALRUM_KITCHEN_DEPTH;


ALRUM_GANG_WIDTH =
    ALRUM_KITCHEN_WIDTH;


ALRUM_GANG_DEPTH =
    ALRUM_ROOM_NORTH_Y
    - ALRUM_GANG_Y;


ALRUM_GANG_AREA_M2 =
    (
        ALRUM_GANG_WIDTH
        * ALRUM_GANG_DEPTH
    )
    / 1000000;


// ===========================================================================
// Alrum skylight marker
// ===========================================================================
//
// Architectural plan marker only.
//
// Current provisional relationships:
//
//   3000 mm from Alrum west edge
//   1000 mm west of half-wall
//   1000 mm north of Alrum south edge
//    500 mm south of Alrum north edge
//

ALRUM_SKYLIGHT_WEST_OFFSET = 3000;

ALRUM_SKYLIGHT_GAP_TO_HALF_WALL = 1000;

ALRUM_SKYLIGHT_SOUTH_OFFSET = 1000;

ALRUM_SKYLIGHT_NORTH_OFFSET = 500;


// ---------------------------------------------------------------------------
// Derived edges
// ---------------------------------------------------------------------------

ALRUM_SKYLIGHT_X =
    ALRUM_ROOM_X
    + ALRUM_SKYLIGHT_WEST_OFFSET;


ALRUM_SKYLIGHT_EAST_X =
    ALRUM_HALF_WALL_X
    - ALRUM_SKYLIGHT_GAP_TO_HALF_WALL;


ALRUM_SKYLIGHT_Y =
    ALRUM_ROOM_Y
    + ALRUM_SKYLIGHT_SOUTH_OFFSET;


ALRUM_SKYLIGHT_NORTH_Y =
    ALRUM_ROOM_NORTH_Y
    - ALRUM_SKYLIGHT_NORTH_OFFSET;


// ---------------------------------------------------------------------------
// Derived size
// ---------------------------------------------------------------------------

ALRUM_SKYLIGHT_WIDTH =
    ALRUM_SKYLIGHT_EAST_X
    - ALRUM_SKYLIGHT_X;


ALRUM_SKYLIGHT_DEPTH =
    ALRUM_SKYLIGHT_NORTH_Y
    - ALRUM_SKYLIGHT_Y;


// ===========================================================================
// Master bedroom
// ===========================================================================
//
// The historical drawing shows the Entré and the room east of it
// (PLAN_NORTH_BEDROOM_1) as two separate rooms.
//
// The partition between them was removed and the combined space is now
// the master bedroom. It is no longer an entrance.
//
// Former partition position, kept for reference only:
//
//   x = 4210 -> 4310
//
// The room is L-shaped where it meets Nova's bedroom:
//
//   x = 2500 -> 3200   south edge y = 9700  (Nova's north partition)
//   x = 3200 -> 6790   south edge y = 9400  (northern-row south partition)
//
// The 300 mm step between those two south edges is the wall projection
// visible in the Entré area of the historical drawing.
//
// Defined after Alrum because it depends on Alrum's anchors.
//


// ---------------------------------------------------------------------------
// Clear room
// ---------------------------------------------------------------------------

MASTER_BEDROOM_X =
    GREEN_BATHROOM_EAST_PARTITION_X
    + WALL_PARTITION;


// PLAN widths, plus the floor area of the removed partition.
MASTER_BEDROOM_WIDTH =
    PLAN_ENTRANCE_WIDTH
    + WALL_PARTITION
    + PLAN_NORTH_BEDROOM_1_WIDTH;


MASTER_BEDROOM_EAST_X =
    MASTER_BEDROOM_X
    + MASTER_BEDROOM_WIDTH;


MASTER_BEDROOM_NORTH_Y =
    HOUSE_NORTH_INTERIOR_Y;


// South edge beside the green bathroom / above Nova's room.
MASTER_BEDROOM_WEST_SOUTH_Y =
    NOVA_NORTH_PARTITION_Y
    + WALL_PARTITION;


// X where the south edge steps down to the northern-row partition.
MASTER_BEDROOM_STEP_X =
    ALRUM_ROOM_X;


// PROVISIONAL.
//
// Follows the provisional Alrum north boundary.
MASTER_BEDROOM_SOUTH_Y =
    ALRUM_ROOM_NORTH_Y
    + WALL_PARTITION;


MASTER_BEDROOM_POINTS = [
    [MASTER_BEDROOM_X,      MASTER_BEDROOM_WEST_SOUTH_Y],
    [MASTER_BEDROOM_STEP_X, MASTER_BEDROOM_WEST_SOUTH_Y],
    [MASTER_BEDROOM_STEP_X, MASTER_BEDROOM_SOUTH_Y],
    [MASTER_BEDROOM_EAST_X, MASTER_BEDROOM_SOUTH_Y],
    [MASTER_BEDROOM_EAST_X, MASTER_BEDROOM_NORTH_Y],
    [MASTER_BEDROOM_X,      MASTER_BEDROOM_NORTH_Y]
];


MASTER_BEDROOM_AREA_M2 =
    (
        MASTER_BEDROOM_WIDTH
        * (MASTER_BEDROOM_NORTH_Y - MASTER_BEDROOM_SOUTH_Y)
        - (MASTER_BEDROOM_STEP_X - MASTER_BEDROOM_X)
        * (MASTER_BEDROOM_WEST_SOUTH_Y - MASTER_BEDROOM_SOUTH_Y)
    )
    / 1000000;


// ---------------------------------------------------------------------------
// Master bedroom / Alrum partition
// ---------------------------------------------------------------------------
//
// South wall of the northern row along the master bedroom.
//
// Confirmed as a full-height wall with ONE door to Alrum.
//
// Solid for now. The door will be cut once its position and width are
// known.
//
//   x = 3200 -> 6890   (includes the corner under the east partition)
//   y = 9300 -> 9400
//

MASTER_BEDROOM_SOUTH_PARTITION_X =
    MASTER_BEDROOM_STEP_X;


MASTER_BEDROOM_SOUTH_PARTITION_Y =
    ALRUM_ROOM_NORTH_Y;


MASTER_BEDROOM_SOUTH_PARTITION_LENGTH =
    MASTER_BEDROOM_EAST_X
    + WALL_PARTITION
    - MASTER_BEDROOM_SOUTH_PARTITION_X;


// ---------------------------------------------------------------------------
// Master bedroom east partition
// ---------------------------------------------------------------------------
//
// Former PLAN_NORTH_BEDROOM_1 / PLAN_NORTH_BEDROOM_2 partition.
//
//   x = 6790 -> 6890
//   y = 9400 -> 12600
//

MASTER_BEDROOM_EAST_PARTITION_X =
    MASTER_BEDROOM_EAST_X;


MASTER_BEDROOM_EAST_PARTITION_Y =
    MASTER_BEDROOM_SOUTH_Y;


MASTER_BEDROOM_EAST_PARTITION_LENGTH =
    MASTER_BEDROOM_NORTH_Y
    - MASTER_BEDROOM_SOUTH_Y;


// ===========================================================================
// Viktualierum / krea
// ===========================================================================
//
// One room used as both viktualierum (pantry) and krea (craft room).
//
// Shown on the historical drawing as PLAN_NORTH_BEDROOM_2.
//
// Envelope:
//
//   west edge:    x = 6890    (master bedroom east partition)
//   east edge:    x = 9360
//
//   south edge:   y = 9400    (northern-row south partition)
//   north edge:   y = 12600   (north exterior wall inside face)
//
//   envelope:     2470 x 3200 mm
//
// The kitchen fridge / freezer alcove takes a notch out of the south-east
// corner, up to the Bryggers south wall line:
//
//   x: 6890        7790   8690 8790       9360 9460
//    ┌──────────────────────────────────────┬─┬──────
//    │  Viktualierum / krea                 │ │ Bryggers
//    │                      ┌───────────────┴─┴──────  9960
//    │                      │┃                         9860
//    ├──────────┬ door ┬────┘┃   fridge alcove (Alrum)  9400
//    │          └──────┘     ┃                         9300
//
// The door to Alrum sits directly west of the notch wall.
//
// The notch walls and room outline are defined after the Bryggers section
// because they depend on its anchors.
//


// ---------------------------------------------------------------------------
// Clear room
// ---------------------------------------------------------------------------

KREA_ROOM_X =
    MASTER_BEDROOM_EAST_PARTITION_X
    + WALL_PARTITION;


KREA_ROOM_Y =
    MASTER_BEDROOM_SOUTH_Y;


// PLAN.
KREA_ROOM_WIDTH =
    PLAN_NORTH_BEDROOM_2_WIDTH;


// PROVISIONAL.
//
// Follows the provisional northern-row depth.
KREA_ROOM_DEPTH =
    HOUSE_NORTH_INTERIOR_Y
    - KREA_ROOM_Y;


// ---------------------------------------------------------------------------
// Door to Alrum / notch west wall
// ---------------------------------------------------------------------------
//
// MEASURED (approx.): the door is ~900 mm from the master bedroom east
// wall, and the notch wall starts directly at the door's east edge.
//
// Used by DOOR_KREA_ALRUM in doors.scad.
//

KREA_ALRUM_DOOR_OFFSET = 900;

// PROVISIONAL. Standard rough opening.
KREA_ALRUM_DOOR_WIDTH = 900;


// West face of the notch west wall.
KREA_NOTCH_PARTITION_X =
    KREA_ROOM_X
    + KREA_ALRUM_DOOR_OFFSET
    + KREA_ALRUM_DOOR_WIDTH;


// ---------------------------------------------------------------------------
// Viktualierum / Alrum partition
// ---------------------------------------------------------------------------
//
// Continues the northern-row south wall east from the master bedroom,
// ending at the notch.
//
// Has ONE door to Alrum (doors.scad).
//
//   x = 6890 -> 8690
//   y = 9300 -> 9400
//

KREA_SOUTH_PARTITION_X =
    KREA_ROOM_X;


KREA_SOUTH_PARTITION_Y =
    ALRUM_ROOM_NORTH_Y;


KREA_SOUTH_PARTITION_LENGTH =
    KREA_NOTCH_PARTITION_X
    - KREA_SOUTH_PARTITION_X;


// ---------------------------------------------------------------------------
// Viktualierum / Bryggers partition
// ---------------------------------------------------------------------------
//
//   x = 9360 -> 9460
//   y = 9960 -> 12600   (starts above the notch)
//
// Its position is part of the northern-row chain used to derive
// LEGACY_2013_EAST_WALL_X, leaving 2300 mm (PLAN_UTILITY_WIDTH) for the
// Bryggers.
//
// Y and length are defined after the Bryggers section.
//

KREA_EAST_PARTITION_X =
    KREA_ROOM_X
    + KREA_ROOM_WIDTH;


// ===========================================================================
// Bryggers
// ===========================================================================
//
// Utility room in the north-east corner of the original house.
//
// The Bryggers is shallower than the other northern-row rooms. Alrum
// continues north beneath it (see "Alrum north bump" below).
//
// Current model:
//
//   west edge:    x = 9460    (viktualierum / krea east partition)
//   east edge:    x = 11760   (2013 legacy wall west face)
//
//   south edge:   y = 9960
//   north edge:   y = 12600   (north exterior wall inside face)
//
//   clear size:   2300 x 2640 mm
//


// ---------------------------------------------------------------------------
// Clear room
// ---------------------------------------------------------------------------

BRYGGERS_ROOM_X =
    KREA_EAST_PARTITION_X
    + WALL_PARTITION;


BRYGGERS_ROOM_EAST_X =
    LEGACY_2013_EAST_WALL_X;


// DERIVED. Equal to PLAN_UTILITY_WIDTH by construction of the
// northern-row chain.
BRYGGERS_ROOM_WIDTH =
    BRYGGERS_ROOM_EAST_X
    - BRYGGERS_ROOM_X;


BRYGGERS_ROOM_NORTH_Y =
    HOUSE_NORTH_INTERIOR_Y;


// PLAN.
BRYGGERS_ROOM_DEPTH =
    PLAN_UTILITY_DEPTH;


BRYGGERS_ROOM_Y =
    BRYGGERS_ROOM_NORTH_Y
    - BRYGGERS_ROOM_DEPTH;


BRYGGERS_ROOM_AREA_M2 =
    (
        BRYGGERS_ROOM_WIDTH
        * BRYGGERS_ROOM_DEPTH
    )
    / 1000000;


// ---------------------------------------------------------------------------
// Bryggers / Alrum partition
// ---------------------------------------------------------------------------
//
//   x = 9460  -> 11760
//   y = 9860  -> 9960
//
// Solid for now. Openings will be cut later.
//

BRYGGERS_SOUTH_PARTITION_X =
    BRYGGERS_ROOM_X;


BRYGGERS_SOUTH_PARTITION_Y =
    BRYGGERS_ROOM_Y
    - WALL_PARTITION;


BRYGGERS_SOUTH_PARTITION_LENGTH =
    BRYGGERS_ROOM_WIDTH;


// ===========================================================================
// Alrum north bump
// ===========================================================================
//
// Alrum / kitchen continues north beneath the Bryggers and into the
// notch in the viktualierum / krea, up to the 2013 legacy wall:
//
//   x = 8790 -> 11760
//   y = 9300 -> 9860
//
// Semantically part of the kitchen zone: holds the fridge and freezer.
//
// Depth is DERIVED from the Bryggers plan depth and the provisional
// northern-row depth.
//
// Defined here because it depends on the Bryggers anchors.
//

ALRUM_NORTH_BUMP_X =
    KREA_NOTCH_PARTITION_X
    + WALL_PARTITION;


ALRUM_NORTH_BUMP_Y =
    ALRUM_ROOM_NORTH_Y;


ALRUM_NORTH_BUMP_WIDTH =
    BRYGGERS_ROOM_EAST_X
    - ALRUM_NORTH_BUMP_X;


ALRUM_NORTH_BUMP_NORTH_Y =
    BRYGGERS_SOUTH_PARTITION_Y;


ALRUM_NORTH_BUMP_DEPTH =
    ALRUM_NORTH_BUMP_NORTH_Y
    - ALRUM_NORTH_BUMP_Y;


// ===========================================================================
// Viktualierum / krea — notch
// ===========================================================================
//
// Defined here because it depends on the Bryggers anchors.
//

// Notch north edge = Bryggers south room line.
KREA_NOTCH_NORTH_Y =
    BRYGGERS_ROOM_Y;


// ---------------------------------------------------------------------------
// Notch west wall
// ---------------------------------------------------------------------------
//
//   x = 8690 -> 8790
//   y = 9300 -> 9960
//

KREA_NOTCH_WEST_PARTITION_X =
    KREA_NOTCH_PARTITION_X;


KREA_NOTCH_WEST_PARTITION_Y =
    KREA_SOUTH_PARTITION_Y;


KREA_NOTCH_WEST_PARTITION_LENGTH =
    KREA_NOTCH_NORTH_Y
    - KREA_NOTCH_WEST_PARTITION_Y;


// ---------------------------------------------------------------------------
// Notch north wall
// ---------------------------------------------------------------------------
//
// Continues the Bryggers south wall west to the notch west wall.
//
//   x = 8790 -> 9460
//   y = 9860 -> 9960
//

KREA_NOTCH_NORTH_PARTITION_X =
    KREA_NOTCH_WEST_PARTITION_X
    + WALL_PARTITION;


KREA_NOTCH_NORTH_PARTITION_Y =
    BRYGGERS_SOUTH_PARTITION_Y;


KREA_NOTCH_NORTH_PARTITION_LENGTH =
    BRYGGERS_SOUTH_PARTITION_X
    - KREA_NOTCH_NORTH_PARTITION_X;


// ---------------------------------------------------------------------------
// Krea east partition — Y extent
// ---------------------------------------------------------------------------

KREA_EAST_PARTITION_Y =
    KREA_NOTCH_NORTH_Y;


KREA_EAST_PARTITION_LENGTH =
    HOUSE_NORTH_INTERIOR_Y
    - KREA_EAST_PARTITION_Y;


// ---------------------------------------------------------------------------
// Clear room outline
// ---------------------------------------------------------------------------

KREA_ROOM_EAST_X =
    KREA_EAST_PARTITION_X;


KREA_ROOM_NORTH_Y =
    HOUSE_NORTH_INTERIOR_Y;


KREA_ROOM_POINTS = [
    [KREA_ROOM_X,                 KREA_ROOM_Y],
    [KREA_NOTCH_WEST_PARTITION_X, KREA_ROOM_Y],
    [KREA_NOTCH_WEST_PARTITION_X, KREA_NOTCH_NORTH_Y],
    [KREA_ROOM_EAST_X,            KREA_NOTCH_NORTH_Y],
    [KREA_ROOM_EAST_X,            KREA_ROOM_NORTH_Y],
    [KREA_ROOM_X,                 KREA_ROOM_NORTH_Y]
];


KREA_ROOM_AREA_M2 =
    (
        KREA_ROOM_WIDTH
        * KREA_ROOM_DEPTH
        - (KREA_ROOM_EAST_X - KREA_NOTCH_WEST_PARTITION_X)
        * (KREA_NOTCH_NORTH_Y - KREA_ROOM_Y)
    )
    / 1000000;


// ===========================================================================
// 2013 addition — anchors
// ===========================================================================
//
// The 2013 addition lies between the two internal legacy walls:
//
//   x = 12160 -> 16740
//   y = 5500  -> 12600
//
//   clear envelope: 4580 x 7100 mm
//
// Current layout:
//
//   x: 12160    13660 13760                   16740
//    ┌──────────┬─┬────────────────────────────┐ 12600
//    │  Pink    │ │  Playroom                  │
//    │  bath    │ │                            │
//    ├──────────┴─┴────────────────────────────┤ 9370
//    │  Hallway ┃    Playroom corridor  →  ext.│ 9270
//    ├──────────┴─┴────────────────────────────┤ 8270
//    │  Caleb's room (full width)              │ 8170
//    │                                         │
//    └─────────────────────────────────────────┘ 5500
//
// Entering from Alrum through the 2013 legacy wall leads into a small
// hallway with doors to the pink bathroom, Caleb's room and the playroom
// corridor.
//
// The playroom corridor and playroom were split from the old NE bedroom by
// a newer wall.
//

ADDITION_2013_WEST_X =
    LEGACY_2013_EAST_WALL_X
    + WALL_LEGACY_EXTERIOR;


ADDITION_2013_EAST_X =
    LEGACY_CURRENT_EXTENSION_WALL_X;


ADDITION_2013_SOUTH_Y =
    NORTH_BLOCK_SOUTH_Y
    + WALL_EXTERIOR;


ADDITION_2013_NORTH_Y =
    HOUSE_NORTH_INTERIOR_Y;


ADDITION_2013_WIDTH =
    ADDITION_2013_EAST_X
    - ADDITION_2013_WEST_X;


// ---------------------------------------------------------------------------
// West strip / east rooms split (north of Caleb's room)
// ---------------------------------------------------------------------------
//
// The old drawing's PLAN_NORTH_SMALL_SECTION_WIDTH (now the pink bathroom)
// sets the width of the west strip containing the pink bathroom and the
// hallway.
//
// Partition between the west strip and the playroom / corridor:
//
//   x = 13660 -> 13760
//

ADDITION_2013_WEST_STRIP_WIDTH =
    PLAN_NORTH_SMALL_SECTION_WIDTH;


ADDITION_2013_INNER_PARTITION_X =
    ADDITION_2013_WEST_X
    + ADDITION_2013_WEST_STRIP_WIDTH;


ADDITION_2013_EAST_ROOMS_X =
    ADDITION_2013_INNER_PARTITION_X
    + WALL_PARTITION;


// DERIVED. Compare with PLAN_NE_BEDROOM_WIDTH (2980).
ADDITION_2013_EAST_ROOMS_WIDTH =
    ADDITION_2013_EAST_X
    - ADDITION_2013_EAST_ROOMS_X;


// ===========================================================================
// Caleb's room
// ===========================================================================
//
// Shown on the historical drawing as PLAN_SE_BEDROOM.
//
// Runs the full width of the 2013 addition, from the 2013 legacy wall
// (backing onto the kitchen) to the current-extension legacy wall.
//
//   x = 12160 -> 16740
//   y = 5500  -> 8170
//
//   clear size: 4580 x 2670 mm
//
// Depth is the PLAN value. The 90 mm by which the plan falls short of the
// modelled 2013 addition depth is given to the old NE bedroom.
//

CALEB_ROOM_X =
    ADDITION_2013_WEST_X;


CALEB_ROOM_Y =
    ADDITION_2013_SOUTH_Y;


CALEB_ROOM_WIDTH =
    ADDITION_2013_WIDTH;


// PLAN.
CALEB_ROOM_DEPTH =
    PLAN_SE_BEDROOM_DEPTH;


CALEB_ROOM_AREA_M2 =
    (
        CALEB_ROOM_WIDTH
        * CALEB_ROOM_DEPTH
    )
    / 1000000;


// ---------------------------------------------------------------------------
// Caleb north partition
// ---------------------------------------------------------------------------
//
// Separates Caleb's room from the hallway and playroom corridor.
//
//   x = 12160 -> 16740
//   y = 8170  -> 8270
//

CALEB_NORTH_PARTITION_X =
    CALEB_ROOM_X;


CALEB_NORTH_PARTITION_Y =
    CALEB_ROOM_Y
    + CALEB_ROOM_DEPTH;


CALEB_NORTH_PARTITION_LENGTH =
    CALEB_ROOM_WIDTH;


// ===========================================================================
// Old NE bedroom — split into playroom corridor + playroom
// ===========================================================================
//
// Historical drawing: PLAN_NE_BEDROOM, 2980 x 4240 mm.
//
// Modelled old-bedroom depth:
//
//   y = 8270 -> 12600 = 4330 mm   (+90 mm vs plan, accepted)
//

OLD_NE_BEDROOM_Y =
    CALEB_NORTH_PARTITION_Y
    + WALL_PARTITION;


OLD_NE_BEDROOM_DEPTH =
    ADDITION_2013_NORTH_Y
    - OLD_NE_BEDROOM_Y;


OLD_NE_BEDROOM_PLAN_DEPTH_DIFFERENCE =
    OLD_NE_BEDROOM_DEPTH
    - PLAN_NE_BEDROOM_DEPTH;


// PROVISIONAL. Approximate, from the user.
//
// Shared north-south depth of the hallway and playroom corridor.
ADDITION_2013_CORRIDOR_DEPTH = 1000;


ADDITION_2013_CORRIDOR_Y =
    OLD_NE_BEDROOM_Y;


ADDITION_2013_CORRIDOR_NORTH_Y =
    ADDITION_2013_CORRIDOR_Y
    + ADDITION_2013_CORRIDOR_DEPTH;


// ---------------------------------------------------------------------------
// Corridor north partition
// ---------------------------------------------------------------------------
//
// One continuous wall across the 2013 addition:
//
//   - pink bathroom south wall
//   - newer playroom / corridor wall
//
//   x = 12160 -> 16740
//   y = 9270  -> 9370
//

ADDITION_2013_CORRIDOR_NORTH_PARTITION_X =
    ADDITION_2013_WEST_X;


ADDITION_2013_CORRIDOR_NORTH_PARTITION_Y =
    ADDITION_2013_CORRIDOR_NORTH_Y;


ADDITION_2013_CORRIDOR_NORTH_PARTITION_LENGTH =
    ADDITION_2013_WIDTH;


// ===========================================================================
// Hallway
// ===========================================================================
//
// Small hallway just inside the 2013 legacy wall, entered from Alrum.
//
// Doors to:
//
//   - pink bathroom      (north)
//   - Caleb's room       (south)
//   - playroom corridor  (east)
//
//   x = 12160 -> 13660
//   y = 8270  -> 9270
//
//   clear size: 1500 x 1000 mm
//
// Remembered as roughly 1 x 1 m. The width here follows the pink bathroom
// so the west-strip partition stays one straight wall.
//

HALLWAY_X =
    ADDITION_2013_WEST_X;


HALLWAY_Y =
    ADDITION_2013_CORRIDOR_Y;


HALLWAY_WIDTH =
    ADDITION_2013_WEST_STRIP_WIDTH;


HALLWAY_DEPTH =
    ADDITION_2013_CORRIDOR_DEPTH;


// ---------------------------------------------------------------------------
// Hallway / playroom corridor partition
// ---------------------------------------------------------------------------
//
// Has a door into the playroom corridor (cut later).
//
//   x = 13660 -> 13760
//   y = 8270  -> 9270
//

HALLWAY_EAST_PARTITION_X =
    ADDITION_2013_INNER_PARTITION_X;


HALLWAY_EAST_PARTITION_Y =
    HALLWAY_Y;


HALLWAY_EAST_PARTITION_LENGTH =
    HALLWAY_DEPTH;


// ===========================================================================
// Playroom corridor
// ===========================================================================
//
// South strip of the old NE bedroom, leading east to the current
// extension.
//
//   x = 13760 -> 16740
//   y = 8270  -> 9270
//
//   clear size: 2980 x 1000 mm
//

PLAYROOM_CORRIDOR_X =
    ADDITION_2013_EAST_ROOMS_X;


PLAYROOM_CORRIDOR_Y =
    ADDITION_2013_CORRIDOR_Y;


PLAYROOM_CORRIDOR_WIDTH =
    ADDITION_2013_EAST_ROOMS_WIDTH;


PLAYROOM_CORRIDOR_DEPTH =
    ADDITION_2013_CORRIDOR_DEPTH;


// ===========================================================================
// Playroom
// ===========================================================================
//
// Remaining north part of the old NE bedroom.
//
//   x = 13760 -> 16740
//   y = 9370  -> 12600
//
//   clear size: 2980 x 3230 mm
//

PLAYROOM_X =
    ADDITION_2013_EAST_ROOMS_X;


PLAYROOM_Y =
    ADDITION_2013_CORRIDOR_NORTH_PARTITION_Y
    + WALL_PARTITION;


PLAYROOM_WIDTH =
    ADDITION_2013_EAST_ROOMS_WIDTH;


PLAYROOM_DEPTH =
    ADDITION_2013_NORTH_Y
    - PLAYROOM_Y;


PLAYROOM_AREA_M2 =
    (
        PLAYROOM_WIDTH
        * PLAYROOM_DEPTH
    )
    / 1000000;


// ===========================================================================
// Pink bathroom
// ===========================================================================
//
// The "little bathroom". Shown on the historical drawing as
// PLAN_NORTH_SMALL_SECTION.
//
// Same depth as the playroom.
//
//   x = 12160 -> 13660
//   y = 9370  -> 12600
//
//   clear size: 1500 x 3230 mm
//

PINK_BATHROOM_X =
    ADDITION_2013_WEST_X;


PINK_BATHROOM_Y =
    PLAYROOM_Y;


// PLAN.
PINK_BATHROOM_WIDTH =
    ADDITION_2013_WEST_STRIP_WIDTH;


PINK_BATHROOM_DEPTH =
    PLAYROOM_DEPTH;


// ---------------------------------------------------------------------------
// Shower (fixture reference)
// ---------------------------------------------------------------------------
//
// MEASURED (approx.). In the north-west corner; the north-wall window
// starts where the shower ends. North-south size not yet known.
//
// Recorded for the later fixtures pass; no geometry yet.
//

// East-west, out from the west wall.
PINK_BATHROOM_SHOWER_DEPTH = 800;


// ---------------------------------------------------------------------------
// Pink bathroom / playroom partition
// ---------------------------------------------------------------------------
//
//   x = 13660 -> 13760
//   y = 9370  -> 12600
//

PINK_BATHROOM_EAST_PARTITION_X =
    ADDITION_2013_INNER_PARTITION_X;


PINK_BATHROOM_EAST_PARTITION_Y =
    PINK_BATHROOM_Y;


PINK_BATHROOM_EAST_PARTITION_LENGTH =
    PINK_BATHROOM_DEPTH;


// ===========================================================================
// Current extension — anchors
// ===========================================================================
//
// The newest 4 m addition east of the current-extension legacy wall.
//
// Its finished floor is EAST_EXTENSION_FLOOR_Z (approximately -300).
//
// The office and tech room stand ~60 mm higher, on
// EXTENSION_SOUTH_ROOMS_FLOOR_Z (approximately -240).
//
//   x = 17140 -> 20740
//   y = 5500  -> 12600
//
//   clear envelope: 3600 x 7100 mm
//
// Current layout:
//
//   x: 17140              19440 19540   20740
//    ┌──────────────────────────────────────┐ 12600
//    │                                      │
//    │  Hobby room                          │
//    │                                      │
//    ← playroom corridor                    │
//    │                                      │
//    ├──────────────────────┬─┬─────────────┤ 7600
//    │  Office              │ │  Tech room  │ 7500
//    │                      │ │             │
//    └──────────────────────┴─┴─────────────┘ 5500
//
// ASSUMPTION: the office is at the west end and the tech room at the east
// end.
//
// Doors (cut later):
//
//   - office -> tech room
//   - office -> hobby room
//

EXTENSION_WEST_X =
    LEGACY_CURRENT_EXTENSION_WALL_X
    + WALL_LEGACY_EXTERIOR;


EXTENSION_EAST_X =
    HOUSE_MAX_WIDTH
    - WALL_EXTERIOR;


EXTENSION_SOUTH_Y =
    NORTH_BLOCK_SOUTH_Y
    + WALL_EXTERIOR;


EXTENSION_NORTH_Y =
    HOUSE_NORTH_INTERIOR_Y;


EXTENSION_CLEAR_WIDTH =
    EXTENSION_EAST_X
    - EXTENSION_WEST_X;


// ===========================================================================
// Office
// ===========================================================================
//
//   x = 17140 -> 19440
//   y = 5500  -> 7500
//
//   clear size: 2300 x 2000 mm
//

OFFICE_X =
    EXTENSION_WEST_X;


OFFICE_Y =
    EXTENSION_SOUTH_Y;


// PROVISIONAL. Approximate, from the user.
OFFICE_WIDTH = 2300;


// PROVISIONAL. Approximate, from the user.
//
// Shared by the office and tech room.
EXTENSION_SOUTH_ROOMS_DEPTH = 2000;


OFFICE_DEPTH =
    EXTENSION_SOUTH_ROOMS_DEPTH;


// MEASURED (approx.).
//
// The office and tech room floor is ~60 mm above the hobby room floor.
EXTENSION_SOUTH_ROOMS_FLOOR_RISE = 60;


EXTENSION_SOUTH_ROOMS_FLOOR_Z =
    EAST_EXTENSION_FLOOR_Z
    + EXTENSION_SOUTH_ROOMS_FLOOR_RISE;


OFFICE_AREA_M2 =
    (
        OFFICE_WIDTH
        * OFFICE_DEPTH
    )
    / 1000000;


// ---------------------------------------------------------------------------
// Office / tech room partition
// ---------------------------------------------------------------------------
//
// Has a door into the tech room (cut later).
//
//   x = 19440 -> 19540
//   y = 5500  -> 7500
//

OFFICE_EAST_PARTITION_X =
    OFFICE_X
    + OFFICE_WIDTH;


OFFICE_EAST_PARTITION_Y =
    OFFICE_Y;


OFFICE_EAST_PARTITION_LENGTH =
    OFFICE_DEPTH;


// ===========================================================================
// Tech room
// ===========================================================================
//
// Takes the remainder of the south strip.
//
//   x = 19540 -> 20740
//   y = 5500  -> 7500
//
//   clear size: 1200 x 2000 mm
//

TECH_ROOM_X =
    OFFICE_EAST_PARTITION_X
    + WALL_PARTITION;


TECH_ROOM_Y =
    EXTENSION_SOUTH_Y;


// DERIVED.
TECH_ROOM_WIDTH =
    EXTENSION_EAST_X
    - TECH_ROOM_X;


TECH_ROOM_DEPTH =
    EXTENSION_SOUTH_ROOMS_DEPTH;


// ---------------------------------------------------------------------------
// Office + tech room north partition
// ---------------------------------------------------------------------------
//
// Separates the south rooms from the hobby room.
//
// Has a door from the office into the hobby room (cut later).
//
//   x = 17140 -> 20740
//   y = 7500  -> 7600
//

EXTENSION_SOUTH_ROOMS_NORTH_PARTITION_X =
    EXTENSION_WEST_X;


EXTENSION_SOUTH_ROOMS_NORTH_PARTITION_Y =
    EXTENSION_SOUTH_Y
    + EXTENSION_SOUTH_ROOMS_DEPTH;


EXTENSION_SOUTH_ROOMS_NORTH_PARTITION_LENGTH =
    EXTENSION_CLEAR_WIDTH;


// ===========================================================================
// Hobby room
// ===========================================================================
//
// Remainder of the extension. Entered from the playroom corridor.
//
//   x = 17140 -> 20740
//   y = 7600  -> 12600
//
//   clear size: 3600 x 5000 mm
//

HOBBY_ROOM_X =
    EXTENSION_WEST_X;


HOBBY_ROOM_Y =
    EXTENSION_SOUTH_ROOMS_NORTH_PARTITION_Y
    + WALL_PARTITION;


HOBBY_ROOM_WIDTH =
    EXTENSION_CLEAR_WIDTH;


HOBBY_ROOM_DEPTH =
    EXTENSION_NORTH_Y
    - HOBBY_ROOM_Y;


HOBBY_ROOM_AREA_M2 =
    (
        HOBBY_ROOM_WIDTH
        * HOBBY_ROOM_DEPTH
    )
    / 1000000;


// ===========================================================================
// Wall heights
// ===========================================================================
//
// Walls are modelled at their real heights as a cutaway: each wall stops
// at the ceiling of the room it faces.
//
// Height regions (plan rectangles, each with a floor and ceiling Z):
//
//   default       whole house                        Z 0    -> 2200
//   south block   x 0 -> 9900,  y 0 -> 5300          Z 0    -> 2200..2500
//                 (ceiling slopes south -> north; interior and exterior
//                 walls both follow it)
//   ext. south    x 16940 -> 21140, y 0    -> 7550   Z -240 -> 2060
//   ext. hobby    x 16940 -> 21140, y 7550 -> 13000  Z -300 -> 2200
//
// EXTERIOR walls use the same regions for their bottoms (floor levels), but
// all share one top level, EXTERIOR_WALL_TOP_Z, except in the south block
// where they follow the slope. This keeps the outside silhouette uniform.
//
// Where a wall separates two regions, the region boundary runs along the
// wall's centre line, so the wall steps at mid-thickness and each face
// shows its own room's height. This applies to:
//
//   - legacy south wall:  2500 on the Hailey / Stue side,
//                         2200 on the Nova / Alrum side
//   - current-extension legacy wall
//   - office / tech + hobby room partition
//

// MEASURED (approx.). Most walls in the main house and 2013 addition.
MAIN_WALL_HEIGHT = 2200;


// MEASURED (approx.). Above the hobby room floor.
HOBBY_ROOM_WALL_HEIGHT = 2500;


// MEASURED (approx.). Above the office / tech room floor.
EXTENSION_SOUTH_ROOMS_WALL_HEIGHT = 2300;


// ---------------------------------------------------------------------------
// Region boundaries
// ---------------------------------------------------------------------------

// Centre line of the legacy south wall.
WALL_HEIGHT_SOUTH_BLOCK_NORTH_Y =
    LEGACY_SOUTH_WALL_Y
    + WALL_LEGACY_EXTERIOR / 2;


WALL_HEIGHT_SOUTH_BLOCK_EAST_X =
    SOUTH_BLOCK_WIDTH;


// Centre line of the current-extension legacy wall.
WALL_HEIGHT_EXTENSION_WEST_X =
    LEGACY_CURRENT_EXTENSION_WALL_X
    + WALL_LEGACY_EXTERIOR / 2;


// Centre line of the office / tech + hobby room partition.
WALL_HEIGHT_EXTENSION_SPLIT_Y =
    EXTENSION_SOUTH_ROOMS_NORTH_PARTITION_Y
    + WALL_PARTITION / 2;


// ---------------------------------------------------------------------------
// Wall top levels (Z)
// ---------------------------------------------------------------------------

MAIN_WALL_TOP_Z =
    MAIN_FLOOR_Z
    + MAIN_WALL_HEIGHT;


HOBBY_ROOM_WALL_TOP_Z =
    EAST_EXTENSION_FLOOR_Z
    + HOBBY_ROOM_WALL_HEIGHT;


EXTENSION_SOUTH_ROOMS_WALL_TOP_Z =
    EXTENSION_SOUTH_ROOMS_FLOOR_Z
    + EXTENSION_SOUTH_ROOMS_WALL_HEIGHT;


// User preference: one uniform top level for all exterior walls outside
// the sloping south block, matching the top of that slope.
//
// Assumes the slope top (SOUTH_BLOCK_CEILING_NORTH_HEIGHT) is the highest
// exterior level, so the exterior cap can depend on Y alone.
EXTERIOR_WALL_TOP_Z =
    MAIN_FLOOR_Z
    + SOUTH_BLOCK_CEILING_NORTH_HEIGHT;


// Raw wall extrusion range before clipping to the height regions.
WALL_EXTRUDE_BOTTOM_Z =
    min(
        MAIN_FLOOR_Z,
        EAST_EXTENSION_FLOOR_Z,
        EXTENSION_SOUTH_ROOMS_FLOOR_Z
    );


WALL_EXTRUDE_TOP_Z =
    max(
        MAIN_WALL_TOP_Z,
        MAIN_FLOOR_Z + SOUTH_BLOCK_CEILING_NORTH_HEIGHT,
        EXTERIOR_WALL_TOP_Z,
        HOBBY_ROOM_WALL_TOP_Z,
        EXTENSION_SOUTH_ROOMS_WALL_TOP_Z
    );


// ===========================================================================
// Hobby room stair to the Hems
// ===========================================================================
//
// Straight stair against the hobby room east wall, climbing SOUTH from the
// terrace-door end up to the ceiling. The Hems itself is a separate model;
// this stair shows the connection.
//
// The space beneath the flight is used as storage.
//
//   x = 19740 -> 20740            (1000 wide, against the east wall)
//   y = 11400 (foot) -> 8600 (top)
//
//   foot:  ~1200 mm south of the north wall / terrace door
//   top:   meets the ceiling ~1000 mm north of the hobby room south wall
//
//   rise:  hobby room floor (-300) -> hobby room ceiling (2200) = 2500
//

// MEASURED (approx.).
HOBBY_STAIR_WIDTH = 1000;

// MEASURED (approx.). Clear floor between the north wall and the foot.
HOBBY_STAIR_FOOT_NORTH_GAP = 1200;

// MEASURED (approx.). Gap from the top of the stair to the south wall.
HOBBY_STAIR_TOP_SOUTH_GAP = 1000;

// PROVISIONAL. "Standard" step height; the exact rise is derived below.
HOBBY_STAIR_TARGET_RISE = 180;

// PROVISIONAL. Structural thickness of the flight, measured square to the
// pitch below the inner step corners. The space under the flight is open
// storage, so the stair is NOT solid down to the floor.
HOBBY_STAIR_WAIST = 150;


HOBBY_STAIR_X =
    EXTENSION_EAST_X
    - HOBBY_STAIR_WIDTH;


HOBBY_STAIR_FOOT_Y =
    HOBBY_ROOM_Y
    + HOBBY_ROOM_DEPTH
    - HOBBY_STAIR_FOOT_NORTH_GAP;


HOBBY_STAIR_TOP_Y =
    HOBBY_ROOM_Y
    + HOBBY_STAIR_TOP_SOUTH_GAP;


HOBBY_STAIR_RUN =
    HOBBY_STAIR_FOOT_Y
    - HOBBY_STAIR_TOP_Y;


HOBBY_STAIR_BOTTOM_Z =
    EAST_EXTENSION_FLOOR_Z;


HOBBY_STAIR_TOP_Z =
    HOBBY_ROOM_WALL_TOP_Z;


HOBBY_STAIR_TOTAL_RISE =
    HOBBY_STAIR_TOP_Z
    - HOBBY_STAIR_BOTTOM_Z;


// DERIVED. Number of steps; the last step is level with the ceiling.
HOBBY_STAIR_STEPS =
    round(
        HOBBY_STAIR_TOTAL_RISE
        / HOBBY_STAIR_TARGET_RISE
    );


HOBBY_STAIR_RISE =
    HOBBY_STAIR_TOTAL_RISE
    / HOBBY_STAIR_STEPS;


HOBBY_STAIR_GOING =
    HOBBY_STAIR_RUN
    / HOBBY_STAIR_STEPS;


HOBBY_STAIR_ANGLE =
    atan(
        HOBBY_STAIR_TOTAL_RISE
        / HOBBY_STAIR_RUN
    );


// Vertical depth of the waist below the inner step corners.
HOBBY_STAIR_WAIST_VERTICAL =
    HOBBY_STAIR_WAIST
    / cos(HOBBY_STAIR_ANGLE);


// DERIVED. Length of floor the stair stands on, measured south from the
// foot, before the soffit lifts off the floor.
HOBBY_STAIR_FOOT_CONTACT_LENGTH =
    HOBBY_STAIR_WAIST_VERTICAL
    * HOBBY_STAIR_GOING
    / HOBBY_STAIR_RISE;


// ===========================================================================
// Printable base
// ===========================================================================
//
// One continuous slab under the whole house footprint. It is NOT built
// from the room clear areas.
//
// Its top is each region's finished floor (the same regions the walls
// use), so walls, doors, stairs and furniture keep their real Z:
//
//   main house / 2013 addition    top Z 0
//   office / tech room            top Z -240
//   hobby room                    top Z -300
//
// The base extends DOWN from the floors to one flat underside.
//

// PROVISIONAL. Base thickness under the LOWEST floor, in real mm.
//
// 200 mm real = 4 mm at 1:50, 2 mm at 1:100.
BASE_MIN_THICKNESS = 200;


BASE_BOTTOM_Z =
    min(
        MAIN_FLOOR_Z,
        EXTENSION_SOUTH_ROOMS_FLOOR_Z,
        EAST_EXTENSION_FLOOR_Z
    )
    - BASE_MIN_THICKNESS;
