/*
 * Viktualierum / krea
 *
 * One room used as both viktualierum (pantry) and krea (craft room).
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
// Rectangle with a notch in the south-east corner taken by the kitchen
// fridge / freezer alcove.
//

module krea_2d() {
    polygon(
        points = KREA_ROOM_POINTS
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

module krea_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            krea_2d();
}
