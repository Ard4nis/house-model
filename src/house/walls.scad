/*
 * House walls
 *
 * Contains:
 *
 *   - current exterior wall shell
 *   - retained former exterior walls
 *   - ordinary internal partitions
 *   - partial-height walls
 *
 * Doors and windows are NOT modelled yet.
 *
 * All source dimensions are real-world millimetres.
 */


// ===========================================================================
// Current exterior envelope
// ===========================================================================

module house_inner_envelope_2d(
    thickness = WALL_EXTERIOR
) {
    offset(delta = -thickness)
        house_footprint_2d();
}


// ===========================================================================
// Current exterior walls
// ===========================================================================

module exterior_walls_2d(
    thickness = WALL_EXTERIOR
) {
    difference() {
        house_footprint_2d();

        house_inner_envelope_2d(
            thickness = thickness
        );
    }
}


// ===========================================================================
// Retained former exterior walls
// ===========================================================================

module legacy_south_wall_2d() {
    translate([
        LEGACY_SOUTH_WALL_X,
        LEGACY_SOUTH_WALL_Y
    ])
        square([
            LEGACY_SOUTH_WALL_LENGTH,
            WALL_LEGACY_EXTERIOR
        ]);
}


module legacy_2013_east_wall_2d() {
    translate([
        LEGACY_2013_EAST_WALL_X,
        LEGACY_2013_EAST_WALL_Y
    ])
        square([
            WALL_LEGACY_EXTERIOR,
            LEGACY_2013_EAST_WALL_LENGTH
        ]);
}


module legacy_current_extension_wall_2d() {
    translate([
        LEGACY_CURRENT_EXTENSION_WALL_X,
        LEGACY_CURRENT_EXTENSION_WALL_Y
    ])
        square([
            WALL_LEGACY_EXTERIOR,
            LEGACY_CURRENT_EXTENSION_WALL_LENGTH
        ]);
}


module legacy_walls_2d() {
    union() {
        legacy_south_wall_2d();

        legacy_2013_east_wall_2d();

        legacy_current_extension_wall_2d();
    }
}


// ===========================================================================
// Ordinary internal partitions
// ===========================================================================


// ---------------------------------------------------------------------------
// Hailey / Stue
// ---------------------------------------------------------------------------

module hailey_east_partition_2d() {
    translate([
        HAILEY_EAST_PARTITION_X,
        HAILEY_EAST_PARTITION_Y
    ])
        square([
            WALL_PARTITION,
            HAILEY_EAST_PARTITION_LENGTH
        ]);
}


// ---------------------------------------------------------------------------
// Nova / Alrum
// ---------------------------------------------------------------------------
//
// This wall deliberately extends approximately 300 mm north of Alrum.
//
// That continuation corresponds to the small wall projection visible in the
// Entré area of the historical floor plan, now the master bedroom.
//

module nova_east_partition_2d() {
    translate([
        NOVA_EAST_PARTITION_X,
        NOVA_EAST_PARTITION_Y
    ])
        square([
            WALL_PARTITION,
            NOVA_EAST_PARTITION_LENGTH
        ]);
}


// ---------------------------------------------------------------------------
// Nova north wall
// ---------------------------------------------------------------------------

module nova_north_partition_2d() {
    translate([
        NOVA_NORTH_PARTITION_X,
        NOVA_NORTH_PARTITION_Y
    ])
        square([
            NOVA_NORTH_PARTITION_LENGTH,
            WALL_PARTITION
        ]);
}


// ---------------------------------------------------------------------------
// Bathroom / master bedroom
// ---------------------------------------------------------------------------

module bathroom_east_partition_2d() {
    translate([
        BATHROOM_EAST_PARTITION_X,
        BATHROOM_EAST_PARTITION_Y
    ])
        square([
            WALL_PARTITION,
            BATHROOM_EAST_PARTITION_LENGTH
        ]);
}


// ---------------------------------------------------------------------------
// Master bedroom
// ---------------------------------------------------------------------------

module master_bedroom_south_partition_2d() {
    translate([
        MASTER_BEDROOM_SOUTH_PARTITION_X,
        MASTER_BEDROOM_SOUTH_PARTITION_Y
    ])
        square([
            MASTER_BEDROOM_SOUTH_PARTITION_LENGTH,
            WALL_PARTITION
        ]);
}


module master_bedroom_east_partition_2d() {
    translate([
        MASTER_BEDROOM_EAST_PARTITION_X,
        MASTER_BEDROOM_EAST_PARTITION_Y
    ])
        square([
            WALL_PARTITION,
            MASTER_BEDROOM_EAST_PARTITION_LENGTH
        ]);
}


// ---------------------------------------------------------------------------
// Viktualierum / krea
// ---------------------------------------------------------------------------

module krea_south_partition_2d() {
    translate([
        KREA_SOUTH_PARTITION_X,
        KREA_SOUTH_PARTITION_Y
    ])
        square([
            KREA_SOUTH_PARTITION_LENGTH,
            WALL_PARTITION
        ]);
}


module krea_east_partition_2d() {
    translate([
        KREA_EAST_PARTITION_X,
        KREA_EAST_PARTITION_Y
    ])
        square([
            WALL_PARTITION,
            KREA_EAST_PARTITION_LENGTH
        ]);
}


// ---------------------------------------------------------------------------
// Combined full-height partitions
// ---------------------------------------------------------------------------

module partition_walls_2d() {
    union() {
        hailey_east_partition_2d();

        nova_east_partition_2d();

        nova_north_partition_2d();

        bathroom_east_partition_2d();

        master_bedroom_south_partition_2d();

        master_bedroom_east_partition_2d();

        krea_south_partition_2d();

        krea_east_partition_2d();
    }
}


// ===========================================================================
// Partial-height walls
// ===========================================================================


// ---------------------------------------------------------------------------
// Alrum / kitchen half-wall
// ---------------------------------------------------------------------------

module alrum_half_wall_2d() {
    translate([
        ALRUM_HALF_WALL_X,
        ALRUM_HALF_WALL_Y
    ])
        square([
            ALRUM_HALF_WALL_THICKNESS,
            ALRUM_HALF_WALL_LENGTH
        ]);
}


// Extruded to its MEASURED height rather than the diagnostic preview height.
module alrum_half_wall_3d() {
    translate([0, 0, MAIN_FLOOR_Z])
        linear_extrude(height = ALRUM_HALF_WALL_HEIGHT)
            alrum_half_wall_2d();
}


module half_walls_2d() {
    union() {
        alrum_half_wall_2d();
    }
}


module half_walls_3d() {
    alrum_half_wall_3d();
}


// ===========================================================================
// Combined wall plan
// ===========================================================================

module house_walls_2d() {
    union() {
        exterior_walls_2d();

        legacy_walls_2d();

        partition_walls_2d();

        half_walls_2d();
    }
}


// ===========================================================================
// Development previews
// ===========================================================================
//
// The common 1000 mm preview height is intentionally artificial while the
// wall layout is established. It is NOT an architectural wall height.
//

module exterior_walls_preview(
    height = 1000
) {
    linear_extrude(height = height)
        exterior_walls_2d();
}


module legacy_walls_preview(
    height = 1000
) {
    linear_extrude(height = height)
        legacy_walls_2d();
}


module partition_walls_preview(
    height = 1000
) {
    linear_extrude(height = height)
        partition_walls_2d();
}


// Half-walls use their own real heights.
module half_walls_preview() {
    half_walls_3d();
}


module house_walls_preview(
    height = 1000
) {
    linear_extrude(height = height)
        house_walls_2d();
}