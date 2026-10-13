/*
 * HomeOpenSCAD house model
 *
 * All source dimensions are real-world millimetres.
 *
 * Coordinate system:
 *
 *   Origin = south-west exterior corner of the current house footprint
 *            at finished-floor level
 *
 *   +X = East
 *   +Y = North
 *   +Z = Up
 */


// ===========================================================================
// Includes
// ===========================================================================

include <lib/coordinates.scad>

include <house/dimensions.scad>
include <house/footprint.scad>
include <house/walls.scad>
include <house/rooms.scad>


// ===========================================================================
// Model configuration
// ===========================================================================

MINIATURE_SCALE = 1 / 50;


// ===========================================================================
// Preview configuration
// ===========================================================================

SHOW_COORDINATE_AXES = true;

SHOW_FOOTPRINT = false;

SHOW_EXTERIOR_WALLS = true;

SHOW_LEGACY_WALLS = true;

SHOW_PARTITION_WALLS = true;

SHOW_ROOMS = true;


// Filled 3D room volume beneath the real sloped ceiling.
//
// Normally keep this disabled because it obscures the wall layout.
// Enable it when checking vertical geometry.
SHOW_ROOM_VOLUMES = false;


// DEVELOPMENT ONLY.
//
// The complete wall system does not yet have authoritative height geometry.
PREVIEW_WALL_HEIGHT = 1000;


PREVIEW_ROOM_HEIGHT = 25;

PREVIEW_ROOM_Z = 25;


// ===========================================================================
// Dimension diagnostics
// ===========================================================================

echo(
    "North row clear width:",
    PLAN_NORTH_CLEAR_WIDTH
);

echo(
    "North block width — derived:",
    DERIVED_NORTH_BLOCK_WIDTH
);

echo(
    "North block width — modelling value:",
    NORTH_BLOCK_WIDTH
);

echo(
    "North block depth — west derivation:",
    DERIVED_NORTH_BLOCK_DEPTH_WEST
);

echo(
    "North block depth — east derivation:",
    DERIVED_NORTH_BLOCK_DEPTH_EAST
);

echo(
    "North block depth — discrepancy:",
    DERIVED_NORTH_BLOCK_DEPTH_DIFFERENCE
);

echo(
    "North block depth — provisional modelling value:",
    NORTH_BLOCK_DEPTH
);

echo(
    "South block width — derived:",
    DERIVED_SOUTH_BLOCK_WIDTH
);

echo(
    "South block width — modelling value:",
    SOUTH_BLOCK_WIDTH
);

echo(
    "South block depth — west derivation:",
    DERIVED_SOUTH_BLOCK_DEPTH_WEST
);

echo(
    "South block depth — east derivation:",
    DERIVED_SOUTH_BLOCK_DEPTH_EAST
);

echo(
    "South block depth — discrepancy:",
    DERIVED_SOUTH_BLOCK_DEPTH_DIFFERENCE
);

echo(
    "South block depth — provisional modelling value:",
    SOUTH_BLOCK_DEPTH
);

echo(
    "North block south Y:",
    NORTH_BLOCK_SOUTH_Y
);

echo(
    "House total depth:",
    HOUSE_TOTAL_DEPTH
);

echo(
    "Eastern extension width:",
    EAST_EXTENSION_WIDTH
);

echo(
    "House maximum width:",
    HOUSE_MAX_WIDTH
);

echo(
    "House maximum depth:",
    HOUSE_MAX_DEPTH
);

echo(
    "Exterior wall thickness:",
    WALL_EXTERIOR
);

echo(
    "Legacy wall thickness:",
    WALL_LEGACY_EXTERIOR
);

echo(
    "Legacy south wall:",
    [
        LEGACY_SOUTH_WALL_X,
        LEGACY_SOUTH_WALL_Y,
        LEGACY_SOUTH_WALL_LENGTH
    ]
);

echo(
    "2013 legacy east wall:",
    [
        LEGACY_2013_EAST_WALL_X,
        LEGACY_2013_EAST_WALL_Y,
        LEGACY_2013_EAST_WALL_LENGTH
    ]
);

echo(
    "Current-extension legacy wall:",
    [
        LEGACY_CURRENT_EXTENSION_WALL_X,
        LEGACY_CURRENT_EXTENSION_WALL_Y,
        LEGACY_CURRENT_EXTENSION_WALL_LENGTH
    ]
);


// ---------------------------------------------------------------------------
// Southern-block height profile
// ---------------------------------------------------------------------------

echo(
    "South block ceiling height — south:",
    SOUTH_BLOCK_CEILING_SOUTH_HEIGHT
);

echo(
    "South block ceiling height — north:",
    SOUTH_BLOCK_CEILING_NORTH_HEIGHT
);

echo(
    "South block ceiling rise:",
    SOUTH_BLOCK_CEILING_RISE
);

echo(
    "South block ceiling run:",
    SOUTH_BLOCK_CEILING_RUN
);

echo(
    "South block ceiling slope angle:",
    SOUTH_BLOCK_CEILING_SLOPE_ANGLE
);


// ---------------------------------------------------------------------------
// Hailey's bedroom
// ---------------------------------------------------------------------------

echo(
    "Hailey room origin:",
    [
        HAILEY_ROOM_X,
        HAILEY_ROOM_Y
    ]
);

echo(
    "Hailey room clear size:",
    [
        HAILEY_ROOM_WIDTH,
        HAILEY_ROOM_DEPTH
    ]
);

echo(
    "Hailey room plan-depth difference:",
    HAILEY_ROOM_PLAN_DEPTH_DIFFERENCE
);

echo(
    "Hailey east partition:",
    [
        HAILEY_EAST_PARTITION_X,
        HAILEY_EAST_PARTITION_Y,
        WALL_PARTITION,
        HAILEY_EAST_PARTITION_LENGTH
    ]
);

echo(
    "Hailey ceiling height — south:",
    HAILEY_CEILING_SOUTH_HEIGHT
);

echo(
    "Hailey ceiling height — north:",
    HAILEY_CEILING_NORTH_HEIGHT
);


// ===========================================================================
// House geometry
// ===========================================================================

module house() {

    if (SHOW_FOOTPRINT) {
        house_footprint_preview();
    }

    if (SHOW_ROOMS) {
        rooms_preview(
            height = PREVIEW_ROOM_HEIGHT,
            z = PREVIEW_ROOM_Z
        );
    }

    if (SHOW_EXTERIOR_WALLS) {
        exterior_walls_preview(
            height = PREVIEW_WALL_HEIGHT
        );
    }

    if (SHOW_LEGACY_WALLS) {
        legacy_walls_preview(
            height = PREVIEW_WALL_HEIGHT
        );
    }

    if (SHOW_PARTITION_WALLS) {
        partition_walls_preview(
            height = PREVIEW_WALL_HEIGHT
        );
    }

    if (SHOW_ROOM_VOLUMES) {
        room_volumes_preview();
    }
}


// ===========================================================================
// Development scene
// ===========================================================================

module scene() {
    house();

    if (SHOW_COORDINATE_AXES) {
        coordinate_axes();
    }
}


// ===========================================================================
// Output
// ===========================================================================

scale([
    MINIATURE_SCALE,
    MINIATURE_SCALE,
    MINIATURE_SCALE
])
    scene();