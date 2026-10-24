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


// PROVISIONAL.
SOUTH_BLOCK_CEILING_SOUTH_HEIGHT = 2200;


// PROVISIONAL.
SOUTH_BLOCK_CEILING_NORTH_HEIGHT = 2600;


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
// Bathroom
// ===========================================================================
//
// North-west corner bathroom, directly north of Nova's bedroom.
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

BATHROOM_X =
    WALL_EXTERIOR;


BATHROOM_Y =
    NOVA_NORTH_PARTITION_Y
    + WALL_PARTITION;


// PLAN.
BATHROOM_WIDTH =
    PLAN_NORTH_BATH_WIDTH;


BATHROOM_NORTH_Y =
    HOUSE_NORTH_INTERIOR_Y;


// DERIVED, confirmed by rough measurement.
BATHROOM_DEPTH =
    BATHROOM_NORTH_Y
    - BATHROOM_Y;


BATHROOM_PLAN_DEPTH_DIFFERENCE =
    BATHROOM_DEPTH
    - PLAN_NW_BATH_DEPTH;


// ---------------------------------------------------------------------------
// Bathroom east partition
// ---------------------------------------------------------------------------
//
// Separates the bathroom from the master bedroom.
//
// Runs from Nova's north partition to the north exterior wall:
//
//   x = 2400 -> 2500
//   y = 9700 -> 12600
//
// This is the first partition in the northern-row chain used to derive
// LEGACY_2013_EAST_WALL_X.
//

BATHROOM_EAST_PARTITION_X =
    BATHROOM_X
    + BATHROOM_WIDTH;


BATHROOM_EAST_PARTITION_Y =
    BATHROOM_Y;


BATHROOM_EAST_PARTITION_LENGTH =
    BATHROOM_DEPTH;


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
    BATHROOM_EAST_PARTITION_X
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


// South edge beside the bathroom / above Nova's room.
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
// Current model:
//
//   west edge:    x = 6890    (master bedroom east partition)
//   east edge:    x = 9360
//
//   south edge:   y = 9400    (northern-row south partition)
//   north edge:   y = 12600   (north exterior wall inside face)
//
//   clear size:   2470 x 3200 mm
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


KREA_ROOM_AREA_M2 =
    (
        KREA_ROOM_WIDTH
        * KREA_ROOM_DEPTH
    )
    / 1000000;


// ---------------------------------------------------------------------------
// Viktualierum / Alrum partition
// ---------------------------------------------------------------------------
//
// Continues the northern-row south wall east from the master bedroom.
//
// Confirmed as a full-height wall with ONE door to Alrum.
//
// Solid for now. The door will be cut once its position and width are
// known.
//
//   x = 6890 -> 9460   (includes the corner under the east partition)
//   y = 9300 -> 9400
//

KREA_SOUTH_PARTITION_X =
    KREA_ROOM_X;


KREA_SOUTH_PARTITION_Y =
    ALRUM_ROOM_NORTH_Y;


KREA_SOUTH_PARTITION_LENGTH =
    KREA_ROOM_WIDTH
    + WALL_PARTITION;


// ---------------------------------------------------------------------------
// Viktualierum / Bryggers partition
// ---------------------------------------------------------------------------
//
//   x = 9360 -> 9460
//   y = 9400 -> 12600
//
// Its position is part of the northern-row chain used to derive
// LEGACY_2013_EAST_WALL_X, leaving 2300 mm (PLAN_UTILITY_WIDTH) for the
// Bryggers.
//

KREA_EAST_PARTITION_X =
    KREA_ROOM_X
    + KREA_ROOM_WIDTH;


KREA_EAST_PARTITION_Y =
    KREA_ROOM_Y;


KREA_EAST_PARTITION_LENGTH =
    KREA_ROOM_DEPTH;


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
// Alrum / kitchen continues north beneath the Bryggers, between the
// viktualierum / krea east partition and the 2013 legacy wall:
//
//   x = 9460 -> 11760
//   y = 9300 -> 9860
//
// Depth is DERIVED from the Bryggers plan depth and the provisional
// northern-row depth.
//
// Defined here because it depends on the Bryggers anchors.
//

ALRUM_NORTH_BUMP_X =
    BRYGGERS_ROOM_X;


ALRUM_NORTH_BUMP_Y =
    ALRUM_ROOM_NORTH_Y;


ALRUM_NORTH_BUMP_WIDTH =
    BRYGGERS_ROOM_WIDTH;


ALRUM_NORTH_BUMP_NORTH_Y =
    BRYGGERS_SOUTH_PARTITION_Y;


ALRUM_NORTH_BUMP_DEPTH =
    ALRUM_NORTH_BUMP_NORTH_Y
    - ALRUM_NORTH_BUMP_Y;
