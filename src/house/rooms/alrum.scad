/*
 * Alrum / kitchen
 *
 * The Alrum is one continuous open room containing:
 *
 *   - dining / general Alrum area
 *   - kitchen
 *   - circulation / Gang
 *
 * The kitchen is therefore NOT a separate room.
 *
 * The half-wall remains physical wall geometry in walls.scad.
 */


// ===========================================================================
// Clear room area
// ===========================================================================
//
// The current room boundary is deliberately provisional.
//
// It will become more accurate as the rooms surrounding Alrum are added.
//

module alrum_2d() {
    difference() {

        union() {
            translate([
                ALRUM_ROOM_X,
                ALRUM_ROOM_Y
            ])
                square([
                    ALRUM_ROOM_WIDTH,
                    ALRUM_ROOM_DEPTH
                ]);


            // Extension north beneath the Bryggers.
            translate([
                ALRUM_NORTH_BUMP_X,
                ALRUM_NORTH_BUMP_Y
            ])
                square([
                    ALRUM_NORTH_BUMP_WIDTH,
                    ALRUM_NORTH_BUMP_DEPTH
                ]);
        }


        // The half-wall occupies physical floor-plan space.
        translate([
            ALRUM_HALF_WALL_X,
            ALRUM_HALF_WALL_Y
        ])
            square([
                ALRUM_HALF_WALL_THICKNESS,
                ALRUM_HALF_WALL_LENGTH
            ]);
    }
}


// ===========================================================================
// Semantic sub-zones
// ===========================================================================
//
// These do not create separate rooms or walls.
//
// They are reference zones for later:
//   - fixtures
//   - furniture
//   - labels
//   - floor finishes
//   - planning
//

// The kitchen has two parts:
//
//   - main kitchen against the 2013 legacy wall, south of the Gang
//   - fridge / freezer alcove in the north bump beneath the Bryggers
//
module alrum_kitchen_zone_2d() {
    union() {
        translate([
            ALRUM_KITCHEN_X,
            ALRUM_KITCHEN_Y
        ])
            square([
                ALRUM_KITCHEN_WIDTH,
                ALRUM_KITCHEN_DEPTH
            ]);


        // Fridge / freezer alcove.
        translate([
            ALRUM_NORTH_BUMP_X,
            ALRUM_NORTH_BUMP_Y
        ])
            square([
                ALRUM_NORTH_BUMP_WIDTH,
                ALRUM_NORTH_BUMP_DEPTH
            ]);
    }
}


module alrum_gang_zone_2d() {
    translate([
        ALRUM_GANG_X,
        ALRUM_GANG_Y
    ])
        square([
            ALRUM_GANG_WIDTH,
            ALRUM_GANG_DEPTH
        ]);
}


// ===========================================================================
// Development preview
// ===========================================================================
//
// Thin raised region showing the clear Alrum floor area.
//
// This is NOT the final printable floor.
//

module alrum_preview(
    height = 25,
    z = 25
) {
    translate([0, 0, z])
        linear_extrude(height = height)
            alrum_2d();
}