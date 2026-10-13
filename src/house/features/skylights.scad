/*
 * Skylight plan markers
 *
 * Skylights are features above the floor plan.
 *
 * The project is not intended to model a complete roof, so these are stored
 * as architectural plan markers rather than roof openings.
 *
 * They do NOT:
 *
 *   - cut the floor
 *   - create roof geometry
 *   - create ceiling geometry
 *
 * They may later become shallow engraved markings in the printable floor.
 */


// ===========================================================================
// Alrum double skylight
// ===========================================================================
//
// Drawn as a rectangular frame rather than a filled region.
//

module alrum_skylight_marker_2d(
    frame = 100
) {
    difference() {

        translate([
            ALRUM_SKYLIGHT_X,
            ALRUM_SKYLIGHT_Y
        ])
            square([
                ALRUM_SKYLIGHT_WIDTH,
                ALRUM_SKYLIGHT_DEPTH
            ]);


        translate([
            ALRUM_SKYLIGHT_X + frame,
            ALRUM_SKYLIGHT_Y + frame
        ])
            square([
                ALRUM_SKYLIGHT_WIDTH - (2 * frame),
                ALRUM_SKYLIGHT_DEPTH - (2 * frame)
            ]);
    }
}


// ===========================================================================
// Development preview
// ===========================================================================

module alrum_skylight_marker_preview(
    height = 25,
    z = 75
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            alrum_skylight_marker_2d();
}