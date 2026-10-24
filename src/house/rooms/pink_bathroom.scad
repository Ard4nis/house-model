/*
 * Pink bathroom
 *
 * The "little bathroom" in the 2013 addition.
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

module pink_bathroom_2d() {
    translate([
        PINK_BATHROOM_X,
        PINK_BATHROOM_Y
    ])
        square([
            PINK_BATHROOM_WIDTH,
            PINK_BATHROOM_DEPTH
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

module pink_bathroom_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            pink_bathroom_2d();
}
