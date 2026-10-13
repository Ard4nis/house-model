/*
 * House walls
 *
 * Current exterior walls are generated directly from the present-day
 * exterior footprint.
 *
 * The exterior wall shell is defined as:
 *
 *   current footprint
 *   MINUS
 *   the same footprint inset by the exterior wall thickness
 *
 * This means changes to the footprint automatically propagate to the
 * exterior walls.
 *
 * All source dimensions are real-world millimetres.
 *
 * Dependencies:
 *
 *   dimensions.scad
 *   footprint.scad
 */


// ===========================================================================
// Current interior envelope
// ===========================================================================
//
// Represents the inside face of the CURRENT exterior walls.
//
// This is useful independently of the wall shell because later room,
// flooring and internal-wall geometry can reference the inside face of the
// exterior envelope.
//

module house_inner_envelope_2d(
    thickness = WALL_EXTERIOR
) {
    offset(delta = -thickness)
        house_footprint_2d();
}


// ===========================================================================
// Current exterior walls
// ===========================================================================
//
// Subtracting the inset footprint from the full exterior footprint gives us
// a uniform wall shell around the complete present-day perimeter.
//
// This includes the exposed wall at the L-shaped step.
//
// It intentionally does NOT include any retained former exterior walls,
// because those are now internal construction and will be added separately.
//

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
// Preview geometry
// ===========================================================================
//
// We do not yet know the authoritative real-world wall height.
//
// The supplied height is therefore DEVELOPMENT/PREVIEW geometry only.
// Real wall height will be introduced later when we model the vertical
// structure of the house.
//

module exterior_walls_preview(
    height = 1000,
    thickness = WALL_EXTERIOR
) {
    linear_extrude(height = height)
        exterior_walls_2d(
            thickness = thickness
        );
}