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
 *     Deliberately rounded modelling values used where the historical
 *     drawing does not agree with itself closely enough to imply exactness.
 *
 * IMPORTANT:
 *
 * The historical floor plan is explicitly marked as approximate.
 * Derived dimensions must therefore not be treated as survey-grade
 * measurements.
 */


// ===========================================================================
// Wall construction
// ===========================================================================

WALL_EXTERIOR = 400;

WALL_LEGACY_EXTERIOR = 400;

WALL_PARTITION = 100;


// ===========================================================================
// Known renovation dimensions
// ===========================================================================

// Current eastern extension.
//
// Extends east from the previous exterior wall.
EAST_EXTENSION_WIDTH = 4000;


// ===========================================================================
// Historical plan dimensions
// ===========================================================================


// ---------------------------------------------------------------------------
// North/main block — west side
// ---------------------------------------------------------------------------

PLAN_NW_BATH_DEPTH = 2830;

PLAN_WEST_BEDROOM_DEPTH = 4250;


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


// Bryggers clear north-south dimension.
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


NORTH_BLOCK_WIDTH = DERIVED_NORTH_BLOCK_WIDTH;


// ---------------------------------------------------------------------------
// North/main block depth
// ---------------------------------------------------------------------------

DERIVED_NORTH_BLOCK_DEPTH_WEST =
    WALL_EXTERIOR
    + PLAN_NW_BATH_DEPTH
    + WALL_PARTITION
    + PLAN_WEST_BEDROOM_DEPTH
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
//
// Historical-plan paths give 7980 and 7810 mm.
NORTH_BLOCK_DEPTH = 7900;


// ===========================================================================
// Derived southern-block dimensions
// ===========================================================================


// ---------------------------------------------------------------------------
// Southern block width
// ---------------------------------------------------------------------------

DERIVED_SOUTH_BLOCK_WIDTH =
    WALL_EXTERIOR
    + PLAN_SOUTH_BEDROOM_WIDTH
    + WALL_PARTITION
    + PLAN_LIVING_ROOM_WIDTH
    + WALL_EXTERIOR;


SOUTH_BLOCK_WIDTH = DERIVED_SOUTH_BLOCK_WIDTH;


// ---------------------------------------------------------------------------
// Southern block depth
// ---------------------------------------------------------------------------

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
//
// Historical-plan paths give 5450 and 5550 mm.
SOUTH_BLOCK_DEPTH = 5500;


// ===========================================================================
// Block relationships
// ===========================================================================
//
// Shared former exterior wall:
//
//   south face = y 5100
//   north face = y 5500
//

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


// ===========================================================================
// Legacy exterior-wall placement
// ===========================================================================


// ---------------------------------------------------------------------------
// Former south exterior wall
// ---------------------------------------------------------------------------
//
// This was the south exterior wall of the older northern house.
//
// It now separates:
//
//   Soveværelse / Stue
//
// from:
//
//   western Værelse / Alrum
//

LEGACY_SOUTH_WALL_X = 0;

LEGACY_SOUTH_WALL_Y =
    NORTH_BLOCK_SOUTH_Y;

LEGACY_SOUTH_WALL_LENGTH =
    SOUTH_BLOCK_WIDTH;


// ---------------------------------------------------------------------------
// 2013 former east exterior wall
// ---------------------------------------------------------------------------
//
// The eastern block was added in 2013.
//
// Before that renovation, the exterior wall ran north-south immediately
// east of Bryggers / Gang / Køkken.
//
// The wall begins after:
//
//   west exterior wall
//   bathroom
//   partition
//   entrance
//   partition
//   bedroom
//   partition
//   bedroom
//   partition
//   Bryggers
//
// Its west face is therefore x = 11760 mm.
//
// This former exterior wall continues for the complete depth of the
// northern block.
//
// Door openings through this wall will be subtracted later.
//

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
// Former east exterior wall before current 4000 mm extension
// ---------------------------------------------------------------------------
//
// The current eastern extension starts at the previous outside face:
//
//   x = 17140 mm
//
// The retained 400 mm wall therefore occupies:
//
//   x = 16740 -> 17140
//

LEGACY_CURRENT_EXTENSION_WALL_X =
    NORTH_BLOCK_WIDTH
    - WALL_LEGACY_EXTERIOR;


LEGACY_CURRENT_EXTENSION_WALL_Y =
    NORTH_BLOCK_SOUTH_Y;


LEGACY_CURRENT_EXTENSION_WALL_LENGTH =
    HOUSE_MAX_DEPTH
    - NORTH_BLOCK_SOUTH_Y;