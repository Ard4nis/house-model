/*
 * Architectural feature markers
 *
 * Features represented here are useful to the floor plan but are not
 * necessarily physical floor-level geometry.
 */


include <features/skylights.scad>
include <features/stairs.scad>


// ===========================================================================
// Combined feature-marker preview
// ===========================================================================

module feature_markers_preview(
    height = 25,
    z = 75
) {
    alrum_skylight_marker_preview(
        height = height,
        z = z
    );
}