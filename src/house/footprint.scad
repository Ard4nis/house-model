/*
 * Current house footprint
 *
 * Defines the present-day exterior silhouette of the house.
 *
 * Coordinate system:
 *
 *   +X = East
 *   +Y = North
 *
 *   [0, 0] = south-west exterior corner
 *
 * All coordinates are real-world millimetres.
 *
 * This describes the outside face of the current exterior envelope only.
 * Walls, rooms and openings will be modelled separately.
 */


// ===========================================================================
// Footprint
// ===========================================================================
//
// Present layout:
//
//                         NORTH
//
//       ┌─────────────────────────────────┐
//       │                                 │
//       │                                 │
//       │        NORTHERN BLOCK           │
//       │                                 │
//       │                                 │
//       │             ┌───────────────────┘
//       │             │
//       │ SOUTH BLOCK │
//       │             │
//       └─────────────┘
//
//                       EAST →
//
// Points are ordered counter-clockwise from the south-west corner.
//

HOUSE_FOOTPRINT_POINTS = [

    // South-west corner.
    [0, 0],

    // South-east corner of southern block.
    [SOUTH_BLOCK_WIDTH, 0],

    // Exterior step at the south face of the retained former exterior wall.
    [SOUTH_BLOCK_WIDTH, NORTH_BLOCK_SOUTH_Y],

    // South-east corner of the current northern/eastern block.
    [HOUSE_MAX_WIDTH, NORTH_BLOCK_SOUTH_Y],

    // North-east corner.
    [HOUSE_MAX_WIDTH, HOUSE_MAX_DEPTH],

    // North-west corner.
    [0, HOUSE_MAX_DEPTH]
];


// ===========================================================================
// 2D geometry
// ===========================================================================

module house_footprint_2d() {
    polygon(
        points = HOUSE_FOOTPRINT_POINTS
    );
}


// ===========================================================================
// Preview geometry
// ===========================================================================
//
// The current VS Code preview exports through STL, so a pure 2D polygon
// would not be visible.
//
// This extrusion is purely a development preview and does not represent
// actual floor construction.
//

module house_footprint_preview(
    height = 50
) {
    linear_extrude(height = height)
        house_footprint_2d();
}