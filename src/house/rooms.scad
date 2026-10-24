/*
 * Room layout
 *
 * Aggregates individual room definitions.
 *
 * Room modules define CLEAR INTERIOR SPACE.
 *
 * They do not own walls.
 *
 * They also do not form the final printable floor.
 *
 * The final floor will be derived separately from the complete house
 * footprint once the room/wall layout has been established.
 */


include <rooms/hailey_bedroom.scad>
include <rooms/nova_bedroom.scad>
include <rooms/bathroom.scad>
include <rooms/master_bedroom.scad>
include <rooms/krea.scad>
include <rooms/stue.scad>
include <rooms/alrum.scad>


// ===========================================================================
// Combined room plan
// ===========================================================================

module rooms_2d() {
    union() {
        hailey_bedroom_2d();

        nova_bedroom_2d();

        bathroom_2d();

        master_bedroom_2d();

        krea_2d();

        stue_2d();

        alrum_2d();
    }
}


// ===========================================================================
// Development preview
// ===========================================================================

module rooms_preview(
    height = 25,
    z = 25
) {
    hailey_bedroom_preview(
        height = height,
        z = z
    );

    nova_bedroom_preview(
        height = height,
        z = z
    );

    bathroom_preview(
        height = height,
        z = z
    );

    master_bedroom_preview(
        height = height,
        z = z
    );

    krea_preview(
        height = height,
        z = z
    );

    stue_preview(
        height = height,
        z = z
    );

    alrum_preview(
        height = height,
        z = z
    );
}