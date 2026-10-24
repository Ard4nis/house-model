/*
 * Stairs
 *
 * Stairs show where the main-house model connects to the separate Hems
 * model. They are physical floor geometry, not plan markers.
 *
 * Flights are modelled with an open underside where the space below is
 * used (e.g. storage).
 */


// ===========================================================================
// Hobby room stair to the Hems
// ===========================================================================
//
// Climbs south: step 1 is at the foot (north end), the last step is level
// with the hobby room ceiling.
//
// Side profile (u = distance south from the foot, v = height above floor):
//
//   - stepped top: risers and treads
//   - sloped soffit parallel to the pitch, HOBBY_STAIR_WAIST below the
//     inner step corners
//
// Everything under the soffit is open (storage).
//

function hobby_stair_profile() =
    let(
        n  = HOBBY_STAIR_STEPS,
        g  = HOBBY_STAIR_GOING,
        r  = HOBBY_STAIR_RISE,
        wv = HOBBY_STAIR_WAIST_VERTICAL,

        // Where the soffit meets the floor.
        u0 = HOBBY_STAIR_FOOT_CONTACT_LENGTH
    )
    concat(
        [[0, 0]],

        // Stepped top.
        [
            for (i = [0 : n - 1])
                for (p = [[i * g, (i + 1) * r], [(i + 1) * g, (i + 1) * r]])
                    p
        ],

        // Top end, then soffit back down to the floor.
        [
            [n * g, n * r - wv],
            [u0,    0]
        ]
    );


module hobby_room_stair_3d() {
    // Profile drawn as (y, z) and extruded east along X.
    translate([HOBBY_STAIR_X, 0, 0])
        rotate([90, 0, 90])
            linear_extrude(height = HOBBY_STAIR_WIDTH)
                polygon([
                    for (p = hobby_stair_profile())
                        [
                            HOBBY_STAIR_FOOT_Y - p[0],
                            HOBBY_STAIR_BOTTOM_Z + p[1]
                        ]
                ]);
}


// Strip of floor the stair stands on (plan).
module hobby_room_stair_foot_contact_2d() {
    translate([
        HOBBY_STAIR_X,
        HOBBY_STAIR_FOOT_Y - HOBBY_STAIR_FOOT_CONTACT_LENGTH
    ])
        square([
            HOBBY_STAIR_WIDTH,
            HOBBY_STAIR_FOOT_CONTACT_LENGTH
        ]);
}


// Plan footprint.
module hobby_room_stair_2d() {
    translate([
        HOBBY_STAIR_X,
        HOBBY_STAIR_TOP_Y
    ])
        square([
            HOBBY_STAIR_WIDTH,
            HOBBY_STAIR_RUN
        ]);
}


// ===========================================================================
// All stairs
// ===========================================================================

module stairs_3d() {
    hobby_room_stair_3d();
}


module stairs_2d() {
    hobby_room_stair_2d();
}
