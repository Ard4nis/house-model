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

// Current exterior wall.
WALL_EXTERIOR = 400;

// Former exterior wall retained inside the current house after extensions.
WALL_LEGACY_EXTERIOR = 400;

// Ordinary internal partition.
WALL_PARTITION = 100;


// ===========================================================================
// Known renovation dimensions
// ===========================================================================

// Eastern extension measured from the former east exterior wall to the
// current east exterior wall.
EAST_EXTENSION_WIDTH = 4000;


// ===========================================================================
// Historical plan dimensions
// ===========================================================================


// ---------------------------------------------------------------------------
// North/main block — west side, north-south dimensions
// ---------------------------------------------------------------------------

PLAN_NW_BATH_DEPTH = 2830;
PLAN_WEST_BEDROOM_DEPTH = 4250;


// ---------------------------------------------------------------------------
// North/main block — east side, north-south dimensions
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
//
// Clear widths:
//
//   2000 + 1710 + 2480 + 2470 + 2300 + 1500 + 2980
//   = 15440 mm
//
// Separating walls:
//
//   5 ordinary partitions @ 100 mm
//   1 former exterior wall @ 400 mm
//
// Exterior walls:
//
//   west = 400 mm
//   east = 400 mm
//
// Total:
//
//   15440 + 500 + 400 + 800
//   = 17140 mm
//

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
//
// West path:
//
//   400 exterior
//   + 2830 bathroom
//   + 100 partition
//   + 4250 bedroom
//   + 400 retained former exterior wall
//
//   = 7980 mm
//
//
// East path:
//
//   400 exterior
//   + 4240 bedroom
//   + 100 partition
//   + 2670 bedroom
//   + 400 exterior
//
//   = 7810 mm
//
//
// Difference:
//
//   170 mm
//

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
// Rounded rather than using 7895 mm, which would imply false precision.
NORTH_BLOCK_DEPTH = 7900;


// ===========================================================================
// Derived southern-block dimensions
// ===========================================================================


// ---------------------------------------------------------------------------
// Southern block width
// ---------------------------------------------------------------------------
//
//   west exterior wall       400
//   bedroom                 3000
//   ordinary partition       100
//   living room             6000
//   east exterior wall       400
//
//   total                   9900 mm
//

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
//
// West / bedroom path:
//
//   retained former exterior wall    400
//   bedroom                          4650
//   south exterior wall              400
//
//   = 5450 mm
//
//
// East / living-room path:
//
//   retained former exterior wall    400
//   living room                      4750
//   south exterior wall              400
//
//   = 5550 mm
//
//
// Difference:
//
//   100 mm
//

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
// The two plan-derived paths bracket 5500 mm exactly.
SOUTH_BLOCK_DEPTH = 5500;


// ===========================================================================
// Block relationships
// ===========================================================================
//
// The southern and northern blocks both include the same retained 400 mm
// former exterior wall.
//
// Southern block:
//
//   y = 0 -> 5500
//
// Shared legacy wall:
//
//   y = 5100 -> 5500
//
// Northern block:
//
//   y = 5100 -> 13000
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

// Present-day maximum east-west dimension across the northern block.
HOUSE_MAX_WIDTH =
    NORTH_BLOCK_WIDTH
    + EAST_EXTENSION_WIDTH;

// Present-day maximum north-south dimension.
HOUSE_MAX_DEPTH =
    HOUSE_TOTAL_DEPTH;