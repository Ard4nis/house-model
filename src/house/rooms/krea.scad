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

module krea_2d() {
    translate([
        KREA_ROOM_X,
        KREA_ROOM_Y
    ])
        square([
            KREA_ROOM_WIDTH,
            KREA_ROOM_DEPTH
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

module krea_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            krea_2d();
}
