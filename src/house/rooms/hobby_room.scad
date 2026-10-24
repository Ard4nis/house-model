/*
 * Hobby room
 *
 * North part of the current extension, entered from the playroom corridor.
 *
 * Stands on the lower current-extension floor (EAST_EXTENSION_FLOOR_Z).
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

module hobby_room_2d() {
    translate([
        HOBBY_ROOM_X,
        HOBBY_ROOM_Y
    ])
        square([
            HOBBY_ROOM_WIDTH,
            HOBBY_ROOM_DEPTH
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

module hobby_room_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, EAST_EXTENSION_FLOOR_Z + z])
        linear_extrude(height = height)
            hobby_room_2d();
}
