/*
 * Master bedroom
 *
 * One room combining the historical Entré and the former bedroom east of
 * it. The partition between them was removed.
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
//
// L-shaped: the south-west corner steps north around Nova's bedroom.
//

module master_bedroom_2d() {
    polygon(
        points = MASTER_BEDROOM_POINTS
    );
}


// ===========================================================================
// Development preview
// ===========================================================================
//
// Thin raised slab showing the clear room area.
//
// This is NOT the final printable house floor.
//

module master_bedroom_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            master_bedroom_2d();
}
