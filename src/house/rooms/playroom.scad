/*
 * Playroom
 *
 * North part of the old NE bedroom of the 2013 addition.
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

module playroom_2d() {
    translate([
        PLAYROOM_X,
        PLAYROOM_Y
    ])
        square([
            PLAYROOM_WIDTH,
            PLAYROOM_DEPTH
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

module playroom_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            playroom_2d();
}
