/*
 * Stue
 *
 * Defines the clear usable room space.
 *
 * The room does NOT own its surrounding walls.
 *
 * Physical walls remain in walls.scad.
 */


// ===========================================================================
// 2D clear room
// ===========================================================================

module stue_2d() {
    translate([
        STUE_ROOM_X,
        STUE_ROOM_Y
    ])
        square([
            STUE_ROOM_WIDTH,
            STUE_ROOM_DEPTH
        ]);
}


// ===========================================================================
// Room-volume geometry
// ===========================================================================
//
// Represents the usable volume beneath the southern block's sloped ceiling.
//
// This is reference/development geometry only.
//

module stue_volume_3d() {

    x0 = STUE_ROOM_X;
    x1 = STUE_ROOM_X + STUE_ROOM_WIDTH;

    y0 = STUE_ROOM_Y;
    y1 = STUE_ROOM_Y + STUE_ROOM_DEPTH;

    z_south = STUE_CEILING_SOUTH_HEIGHT;
    z_north = STUE_CEILING_NORTH_HEIGHT;

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
// This is NOT printable floor geometry.
//

module stue_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            stue_2d();
}