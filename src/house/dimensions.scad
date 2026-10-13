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
//
// This remains the global Z reference for the project.
MAIN_FLOOR_Z = 0;


// Current eastern addition is approximately 300 mm lower than the
// rest of the house.
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

// Current eastern extension measured east from the previous exterior wall.
EAST_EXTENSION_WIDTH = 4000;


// ===========================================================================
// Historical plan dimensions
// ===========================================================================


// ---------------------------------------------------------------------------
// North/main block — west side
// ---------------------------------------------------------------------------

PLAN_NW_BATH_DEPTH = 2830;

// Clear east-west width of the western bedroom beside Alrum.
PLAN_WEST_BEDROOM_WIDTH = 2700;

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


// Several of the northern rooms are labelled approximately 3200 mm deep
// on the historical drawing.
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

// South face of the retained legacy wall.
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


// Current inside face of the north exterior wall.
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
// We are NOT modelling the roof or ceiling.
//
// These values are retained because they describe the approximate heights
// of the cutaway walls in the southern block.
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
// Alrum / kitchen
// ===========================================================================
//
// Alrum is one continuous room.
//
// It includes:
//
//   - dining / general Alrum space
//   - kitchen
//   - circulation / Gang
//
// The half-wall is physical structure but does NOT make the kitchen a
// separate room.
//
// The following geometry remains provisional while adjacent rooms are
// reconstructed.
//


// ---------------------------------------------------------------------------
// South boundary
// ---------------------------------------------------------------------------
//
// The Alrum begins at the north face of the retained 400 mm legacy wall.
//

ALRUM_ROOM_Y =
    LEGACY_SOUTH_WALL_Y
    + WALL_LEGACY_EXTERIOR;


// ---------------------------------------------------------------------------
// Provisional north boundary
// ---------------------------------------------------------------------------
//
// North interior face:
//
//   12600
//
// Northern room clear depth:
//
//   3200
//
// Plus the 100 mm partition beneath those rooms.
//
// This places the provisional Alrum north edge at:
//
//   y = 9300
//

ALRUM_ROOM_NORTH_Y =
    HOUSE_NORTH_INTERIOR_Y
    - PLAN_NORTH_ROW_ROOM_DEPTH
    - WALL_PARTITION;


ALRUM_ROOM_DEPTH =
    ALRUM_ROOM_NORTH_Y
    - ALRUM_ROOM_Y;


// ---------------------------------------------------------------------------
// West boundary
// ---------------------------------------------------------------------------
//
// Western bedroom:
//
//   exterior inside face = 400
//   clear width = 2700
//
// Partition:
//
//   x = 3100 -> 3200
//
// Alrum begins:
//
//   x = 3200
//

ALRUM_WEST_PARTITION_X =
    WALL_EXTERIOR
    + PLAN_WEST_BEDROOM_WIDTH;


ALRUM_WEST_PARTITION_Y =
    ALRUM_ROOM_Y;


// For now the wall follows the provisional Alrum depth.
//
// Its final north end will be confirmed when the western bedroom and
// northern rooms are modelled.
ALRUM_WEST_PARTITION_LENGTH =
    ALRUM_ROOM_DEPTH;


ALRUM_ROOM_X =
    ALRUM_WEST_PARTITION_X
    + WALL_PARTITION;


// ---------------------------------------------------------------------------
// East boundary
// ---------------------------------------------------------------------------
//
// The Alrum/kitchen ends against the west face of the 2013 legacy wall.
//

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
// Approximate kitchen width:
//
//   600 worktop
//   + 900 terrace-door/gang opening
//   + 600 worktop
//
//   = 2100 mm
//
// Approximate north-south length:
//
//   = 2000 mm
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
// PROVISIONAL.
//
// Runs north from the southern Alrum boundary approximately 2600 mm.
//
// Height will be added later when measured.
//

ALRUM_HALF_WALL_LENGTH = 2600;

ALRUM_HALF_WALL_THICKNESS =
    WALL_PARTITION;


ALRUM_HALF_WALL_X =
    ALRUM_KITCHEN_X
    - ALRUM_HALF_WALL_THICKNESS;


ALRUM_HALF_WALL_Y =
    ALRUM_ROOM_Y;


// ===========================================================================
// Alrum circulation / gang zone
// ===========================================================================
//
// Kitchen occupies the first approximately 2000 mm.
//
// The remaining eastern strip is treated as the circulation zone.
//
// With the current provisional room boundary this gives approximately:
//
//   2100 x 1800 mm
//   = 3.78 m²
//

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
// The double skylight is NOT being modelled as roof geometry.
//
// It is represented only as an architectural floor-plan marker.
//
// Placement is currently defined from approximate distances to the
// surrounding Alrum boundaries and half-wall.
//
// Approximate relationships:
//
//   west edge:
//
//       4000 mm east of the Alrum west edge
//
//
//   east edge:
//
//       1000 mm west of the half-wall
//
//
//   south edge:
//
//       1000 mm north of the Alrum south edge
//
//
//   north edge:
//
//       500 mm south of the Alrum north edge
//
//
// With the current provisional Alrum geometry this produces:
//
//   west edge:   x = 7200
//   east edge:   x = 8560
//
//   south edge:  y = 6500
//   north edge:  y = 8800
//
//   width:       1360 mm
//   depth:       2300 mm
//
// These dimensions are therefore DERIVED from placement rather than assumed
// to be measured skylight dimensions.
//
// All values remain provisional until directly measured.
//


// ---------------------------------------------------------------------------
// Placement offsets
// ---------------------------------------------------------------------------

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