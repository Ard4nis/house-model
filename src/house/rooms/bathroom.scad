/*
 * Bathroom
 *
 * North-west corner bathroom, directly north of Nova's bedroom.
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

module bathroom_2d() {
    translate([
        BATHROOM_X,
        BATHROOM_Y
    ])
        square([
            BATHROOM_WIDTH,
            BATHROOM_DEPTH
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

module bathroom_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            bathroom_2d();
}
