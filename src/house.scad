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


// ===========================================================================
// Model configuration
// ===========================================================================

// Intended physical miniature scale.
MINIATURE_SCALE = 1 / 50;


// ===========================================================================
// Preview configuration
// ===========================================================================

SHOW_COORDINATE_AXES = true;

// Keep the solid footprint disabled while working on walls so the interior
// void remains clearly visible.
SHOW_FOOTPRINT = false;

SHOW_EXTERIOR_WALLS = true;


// We do not yet have an authoritative physical wall height.
//
// 1000 mm is used purely as a convenient development extrusion so that the
// wall layout is easy to inspect in the 3D preview.
//
// Do not treat this value as part of the architectural model.
PREVIEW_WALL_HEIGHT = 1000;


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
    "Footprint points:",
    HOUSE_FOOTPRINT_POINTS
);

echo(
    "Exterior wall thickness:",
    WALL_EXTERIOR
);

echo(
    "Exterior wall thickness at current miniature scale:",
    WALL_EXTERIOR * MINIATURE_SCALE
);


// ===========================================================================
// House geometry
// ===========================================================================

module house() {

    if (SHOW_FOOTPRINT) {
        house_footprint_preview();
    }

    if (SHOW_EXTERIOR_WALLS) {
        exterior_walls_preview(
            height = PREVIEW_WALL_HEIGHT
        );
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
//
// All architectural geometry above remains in real-world millimetres.
//
// Miniature scaling occurs only here at the final output boundary.
//

scale([
    MINIATURE_SCALE,
    MINIATURE_SCALE,
    MINIATURE_SCALE
])
    scene();