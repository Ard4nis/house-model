/*
 * Green bathroom
 *
 * The "big bathroom": north-west corner, directly north of Nova's bedroom.
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

module green_bathroom_2d() {
    translate([
        GREEN_BATHROOM_X,
        GREEN_BATHROOM_Y
    ])
        square([
            GREEN_BATHROOM_WIDTH,
            GREEN_BATHROOM_DEPTH
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

module green_bathroom_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            green_bathroom_2d();
}
