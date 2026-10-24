/*
 * Playroom corridor
 *
 * South strip of the old NE bedroom, leading east to the current extension.
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

module playroom_corridor_2d() {
    translate([
        PLAYROOM_CORRIDOR_X,
        PLAYROOM_CORRIDOR_Y
    ])
        square([
            PLAYROOM_CORRIDOR_WIDTH,
            PLAYROOM_CORRIDOR_DEPTH
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

module playroom_corridor_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            playroom_corridor_2d();
}
