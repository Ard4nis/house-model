/*
 * Tech room
 *
 * South-east room of the current extension.
 *
 * Stands on the raised south-room floor (EXTENSION_SOUTH_ROOMS_FLOOR_Z),
 * ~60 mm above the hobby room.
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

module tech_room_2d() {
    translate([
        TECH_ROOM_X,
        TECH_ROOM_Y
    ])
        square([
            TECH_ROOM_WIDTH,
            TECH_ROOM_DEPTH
        ]);
}


// ===========================================================================
// Development preview
// ===========================================================================
//
// Thin raised slab showing the clear room area.
//
// This is NOT the final printable house floor.
//

module tech_room_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, EXTENSION_SOUTH_ROOMS_FLOOR_Z + z])
        linear_extrude(height = height)
            tech_room_2d();
}
