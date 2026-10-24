/*
 * Caleb's room
 *
 * Old SE bedroom of the 2013 addition.
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

module caleb_bedroom_2d() {
    translate([
        CALEB_ROOM_X,
        CALEB_ROOM_Y
    ])
        square([
            CALEB_ROOM_WIDTH,
            CALEB_ROOM_DEPTH
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

module caleb_bedroom_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            caleb_bedroom_2d();
}
