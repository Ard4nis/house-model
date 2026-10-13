/*
 * House walls
 *
 * Contains:
 *
 *   - current exterior wall shell
 *   - retained former exterior walls
 *
 * Doors and windows are NOT modelled yet.
 *
 * All walls are therefore currently continuous solid construction.
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
//
// This runs continuously from the north wall to the south wall.
//
// It separates the older house on the west from the eastern block added
// during the 2013 renovation.
//
// Openings through it are intentionally ignored for now.
//

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
//
// This wall became internal when the current 4000 mm eastern extension
// was added.
//

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
// Combined wall plan
// ===========================================================================

module house_walls_2d() {
    union() {
        exterior_walls_2d();
        legacy_walls_2d();
    }
}


// ===========================================================================
// Preview geometry
// ===========================================================================
//
// Real wall height has not yet been established.
//
// These extrusions are development geometry only.
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


module house_walls_preview(
    height = 1000
) {
    linear_extrude(height = height)
        house_walls_2d();
}