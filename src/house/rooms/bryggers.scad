/*
 * Bryggers
 *
 * Utility room in the north-east corner of the original house.
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

module bryggers_2d() {
    translate([
        BRYGGERS_ROOM_X,
        BRYGGERS_ROOM_Y
    ])
        square([
            BRYGGERS_ROOM_WIDTH,
            BRYGGERS_ROOM_DEPTH
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

module bryggers_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            bryggers_2d();
}
