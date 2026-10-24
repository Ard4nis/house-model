/*
 * Office
 *
 * South-west room of the current extension.
 *
 * Stands on the raised south-room floor (EXTENSION_SOUTH_ROOMS_FLOOR_Z),
 * ~60 mm above the hobby room.
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

module office_2d() {
    translate([
        OFFICE_X,
        OFFICE_Y
    ])
        square([
            OFFICE_WIDTH,
            OFFICE_DEPTH
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

module office_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, EXTENSION_SOUTH_ROOMS_FLOOR_Z + z])
        linear_extrude(height = height)
            office_2d();
}
