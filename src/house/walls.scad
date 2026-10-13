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


// ---------------------------------------------------------------------------
// Former south exterior wall
// ---------------------------------------------------------------------------

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


// ---------------------------------------------------------------------------
// 2013 former east exterior wall
// ---------------------------------------------------------------------------

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


// ---------------------------------------------------------------------------
// Former east exterior wall before current extension
// ---------------------------------------------------------------------------

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


// ---------------------------------------------------------------------------
// Combined legacy walls
// ---------------------------------------------------------------------------

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
// Western bedroom / Alrum
// ---------------------------------------------------------------------------
//
// Provisional north end.
//
// This gets confirmed when the western bedroom is modelled.
//

module alrum_west_partition_2d() {
    translate([
        ALRUM_WEST_PARTITION_X,
        ALRUM_WEST_PARTITION_Y
    ])
        square([
            WALL_PARTITION,
            ALRUM_WEST_PARTITION_LENGTH
        ]);
}


// ---------------------------------------------------------------------------
// Combined full-height partitions
// ---------------------------------------------------------------------------

module partition_walls_2d() {
    union() {
        hailey_east_partition_2d();

        alrum_west_partition_2d();
    }
}


// ===========================================================================
// Partial-height walls
// ===========================================================================


// ---------------------------------------------------------------------------
// Alrum / kitchen half-wall
// ---------------------------------------------------------------------------
//
// PLAN position only.
//
// Actual wall height has not yet been measured.
//

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


module half_walls_2d() {
    union() {
        alrum_half_wall_2d();
    }
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
// We are currently modelling a floor-plan/cutaway model.
//
// The common 1000 mm preview height remains intentionally artificial while
// the complete wall layout is established.
//
// Real wall heights can later replace this extrusion where useful.
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


module half_walls_preview(
    height = 1000
) {
    linear_extrude(height = height)
        half_walls_2d();
}


module house_walls_preview(
    height = 1000
) {
    linear_extrude(height = height)
        house_walls_2d();
}