/*
 * House walls
 *
 * Contains:
 *
 *   - current exterior wall shell
 *   - retained former exterior walls
 *   - ordinary internal partitions
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
// Combined legacy construction
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
// Hailey's bedroom / Stue
// ---------------------------------------------------------------------------
//
// Normal 100 mm partition.
//
// The clear bedroom ends at x = 3400.
//
// The partition therefore occupies:
//
//   x = 3400 -> 3500
//
// Stue will later begin at:
//
//   x = 3500
//

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
// Combined ordinary partitions
// ---------------------------------------------------------------------------

module partition_walls_2d() {
    union() {
        hailey_east_partition_2d();
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
    }
}


// ===========================================================================
// Development preview geometry
// ===========================================================================
//
// We intentionally keep the whole wall plan at a common preview height
// while reconstructing the layout.
//
// Real vertical wall profiles are being recorded in dimensions.scad and
// room definitions as they become known.
//
// Once enough of the layout is established, the diagnostic extrusion will
// be replaced by real 3D wall geometry.
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


module house_walls_preview(
    height = 1000
) {
    linear_extrude(height = height)
        house_walls_2d();
}