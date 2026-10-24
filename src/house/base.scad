/*
 * Printable base
 *
 * Continuous slab under the house footprint, with its top at each floor
 * level and a single flat underside at BASE_BOTTOM_Z.
 *
 * Floor-level regions are shared with the wall height regions
 * (walls.scad), so floor steps fall on wall centre lines exactly where the
 * wall bottoms step.
 *
 * Must be included after footprint.scad and walls.scad.
 */


// ===========================================================================
// Floor regions (plan)
// ===========================================================================

module base_main_floor_2d() {
    difference() {
        house_footprint_2d();

        extension_south_height_region_2d();

        extension_hobby_height_region_2d();
    }
}


module base_extension_south_floor_2d() {
    intersection() {
        house_footprint_2d();

        extension_south_height_region_2d();
    }
}


module base_hobby_floor_2d() {
    intersection() {
        house_footprint_2d();

        extension_hobby_height_region_2d();
    }
}


// ===========================================================================
// Geometry
// ===========================================================================

// Slab from the base underside up to floor_z.
module base_slab_3d(floor_z) {
    translate([0, 0, BASE_BOTTOM_Z])
        linear_extrude(height = floor_z - BASE_BOTTOM_Z)
            children();
}


module printable_base_3d() {
    base_slab_3d(MAIN_FLOOR_Z)
        base_main_floor_2d();

    base_slab_3d(EXTENSION_SOUTH_ROOMS_FLOOR_Z)
        base_extension_south_floor_2d();

    base_slab_3d(EAST_EXTENSION_FLOOR_Z)
        base_hobby_floor_2d();
}
