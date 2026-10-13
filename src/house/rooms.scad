/*
 * Room layout
 *
 * Aggregates the individual room definitions.
 *
 * Room modules define CLEAR INTERIOR SPACE.
 *
 * They do not own walls and they do not form the final printable floor.
 */


include <rooms/hailey_bedroom.scad>


// ===========================================================================
// Combined room plan
// ===========================================================================

module rooms_2d() {
    union() {
        hailey_bedroom_2d();
    }
}


// ===========================================================================
// Development previews
// ===========================================================================

module rooms_preview(
    height = 25,
    z = 25
) {
    hailey_bedroom_preview(
        height = height,
        z = z
    );
}


module room_volumes_preview() {
    hailey_bedroom_volume_3d();
}