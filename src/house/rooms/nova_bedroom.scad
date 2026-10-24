/*
 * Nova's bedroom
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

module nova_bedroom_2d() {
    translate([
        NOVA_ROOM_X,
        NOVA_ROOM_Y
    ])
        square([
            NOVA_ROOM_WIDTH,
            NOVA_ROOM_DEPTH
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

module nova_bedroom_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            nova_bedroom_2d();
}
