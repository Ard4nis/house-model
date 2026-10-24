/*
 * Hallway
 *
 * Small hallway just inside the 2013 legacy wall, entered from Alrum.
 * Doors to the pink bathroom, Caleb's room and the playroom corridor.
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

module hallway_2d() {
    translate([
        HALLWAY_X,
        HALLWAY_Y
    ])
        square([
            HALLWAY_WIDTH,
            HALLWAY_DEPTH
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

module hallway_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            hallway_2d();
}
