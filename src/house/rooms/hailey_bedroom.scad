/*
 * Hailey's bedroom
 *
 * Defines the clear usable room space.
 *
 * The room does NOT own its surrounding walls.
 *
 * Walls are physical shared construction and therefore live in walls.scad.
 */


// ===========================================================================
// 2D clear room
// ===========================================================================

module hailey_bedroom_2d() {
    translate([
        HAILEY_ROOM_X,
        HAILEY_ROOM_Y
    ])
        square([
            HAILEY_ROOM_WIDTH,
            HAILEY_ROOM_DEPTH
        ]);
}


// ===========================================================================
// Room-volume geometry
// ===========================================================================
//
// This represents the usable volume beneath the sloped ceiling.
//
// It is development/reference geometry, not printable floor geometry.
//
// South ceiling height: ~2200 mm
// North ceiling height: ~2600 mm
//

module hailey_bedroom_volume_3d() {

    x0 = HAILEY_ROOM_X;
    x1 = HAILEY_ROOM_X + HAILEY_ROOM_WIDTH;

    y0 = HAILEY_ROOM_Y;
    y1 = HAILEY_ROOM_Y + HAILEY_ROOM_DEPTH;

    z_south = HAILEY_CEILING_SOUTH_HEIGHT;
    z_north = HAILEY_CEILING_NORTH_HEIGHT;

    polyhedron(
        points = [

            // Bottom
            [x0, y0, 0],
            [x1, y0, 0],
            [x1, y1, 0],
            [x0, y1, 0],

            // Sloped top
            [x0, y0, z_south],
            [x1, y0, z_south],
            [x1, y1, z_north],
            [x0, y1, z_north]
        ],

        faces = [

            // Bottom
            [0, 3, 2, 1],

            // South
            [0, 1, 5, 4],

            // East
            [1, 2, 6, 5],

            // North
            [2, 3, 7, 6],

            // West
            [3, 0, 4, 7],

            // Sloped ceiling
            [4, 5, 6, 7]
        ],

        convexity = 10
    );
}


// ===========================================================================
// Development preview
// ===========================================================================
//
// Thin raised slab showing the clear room area.
//
// This is NOT the final printable house floor.
//

module hailey_bedroom_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            hailey_bedroom_2d();
}