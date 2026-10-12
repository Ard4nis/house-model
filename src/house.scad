/*
 * HomeOpenSCAD house model
 *
 * All source dimensions are real-world millimetres.
 *
 * Coordinate system:
 *
 *   Origin = south-west exterior corner of the main house footprint
 *            at finished-floor level
 *
 *   +X = East
 *   +Y = North
 *   +Z = Up
 */

include <lib/coordinates.scad>


// ---------------------------------------------------------------------------
// Model configuration
// ---------------------------------------------------------------------------

// Intended physical miniature scale.
MINIATURE_SCALE = 1 / 50;


// ---------------------------------------------------------------------------
// Preview configuration
// ---------------------------------------------------------------------------

// Development helpers only.
// These are not part of the actual house model.
SHOW_COORDINATE_AXES = true;


// ---------------------------------------------------------------------------
// House geometry
// ---------------------------------------------------------------------------

module house() {
    // Actual house geometry starts here.
}


// ---------------------------------------------------------------------------
// Development scene
// ---------------------------------------------------------------------------

module scene() {
    house();

    if (SHOW_COORDINATE_AXES) {
        coordinate_axes();
    }
}


// ---------------------------------------------------------------------------
// Output
// ---------------------------------------------------------------------------

// Source geometry remains at real-world scale.
//
// The final scene is scaled only at the output boundary so that the source
// model never needs to contain manually converted 1:50 measurements.
scale([
    MINIATURE_SCALE,
    MINIATURE_SCALE,
    MINIATURE_SCALE
])
    scene();