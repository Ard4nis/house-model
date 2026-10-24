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
 * Door and window openings are defined in doors.scad / windows.scad and
 * subtracted in the 3D wall geometry.
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
// Green bathroom / master bedroom
// ---------------------------------------------------------------------------

module green_bathroom_east_partition_2d() {
    translate([
        GREEN_BATHROOM_EAST_PARTITION_X,
        GREEN_BATHROOM_EAST_PARTITION_Y
    ])
        square([
            WALL_PARTITION,
            GREEN_BATHROOM_EAST_PARTITION_LENGTH
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


// Notch taken by the kitchen fridge / freezer alcove.
module krea_notch_west_partition_2d() {
    translate([
        KREA_NOTCH_WEST_PARTITION_X,
        KREA_NOTCH_WEST_PARTITION_Y
    ])
        square([
            WALL_PARTITION,
            KREA_NOTCH_WEST_PARTITION_LENGTH
        ]);
}


module krea_notch_north_partition_2d() {
    translate([
        KREA_NOTCH_NORTH_PARTITION_X,
        KREA_NOTCH_NORTH_PARTITION_Y
    ])
        square([
            KREA_NOTCH_NORTH_PARTITION_LENGTH,
            WALL_PARTITION
        ]);
}


// ---------------------------------------------------------------------------
// Bryggers / Alrum
// ---------------------------------------------------------------------------

module bryggers_south_partition_2d() {
    translate([
        BRYGGERS_SOUTH_PARTITION_X,
        BRYGGERS_SOUTH_PARTITION_Y
    ])
        square([
            BRYGGERS_SOUTH_PARTITION_LENGTH,
            WALL_PARTITION
        ]);
}


// ---------------------------------------------------------------------------
// 2013 addition
// ---------------------------------------------------------------------------

module caleb_north_partition_2d() {
    translate([
        CALEB_NORTH_PARTITION_X,
        CALEB_NORTH_PARTITION_Y
    ])
        square([
            CALEB_NORTH_PARTITION_LENGTH,
            WALL_PARTITION
        ]);
}


module addition_2013_corridor_north_partition_2d() {
    translate([
        ADDITION_2013_CORRIDOR_NORTH_PARTITION_X,
        ADDITION_2013_CORRIDOR_NORTH_PARTITION_Y
    ])
        square([
            ADDITION_2013_CORRIDOR_NORTH_PARTITION_LENGTH,
            WALL_PARTITION
        ]);
}


// Has a door into the playroom corridor (cut later).
module hallway_east_partition_2d() {
    translate([
        HALLWAY_EAST_PARTITION_X,
        HALLWAY_EAST_PARTITION_Y
    ])
        square([
            WALL_PARTITION,
            HALLWAY_EAST_PARTITION_LENGTH
        ]);
}


module pink_bathroom_east_partition_2d() {
    translate([
        PINK_BATHROOM_EAST_PARTITION_X,
        PINK_BATHROOM_EAST_PARTITION_Y
    ])
        square([
            WALL_PARTITION,
            PINK_BATHROOM_EAST_PARTITION_LENGTH
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

        green_bathroom_east_partition_2d();

        master_bedroom_south_partition_2d();

        master_bedroom_east_partition_2d();

        krea_south_partition_2d();

        krea_east_partition_2d();

        krea_notch_west_partition_2d();

        krea_notch_north_partition_2d();

        bryggers_south_partition_2d();

        caleb_north_partition_2d();

        addition_2013_corridor_north_partition_2d();

        hallway_east_partition_2d();

        pink_bathroom_east_partition_2d();
    }
}


// ===========================================================================
// Current-extension partitions
// ===========================================================================
//
// Kept separate from the main-house partitions because they stand on the
// lower extension floors; the height envelope sets their bottom and top.
//

// Has a door into the tech room (cut later).
module office_east_partition_2d() {
    translate([
        OFFICE_EAST_PARTITION_X,
        OFFICE_EAST_PARTITION_Y
    ])
        square([
            WALL_PARTITION,
            OFFICE_EAST_PARTITION_LENGTH
        ]);
}


// Has a door from the office into the hobby room (cut later).
module extension_south_rooms_north_partition_2d() {
    translate([
        EXTENSION_SOUTH_ROOMS_NORTH_PARTITION_X,
        EXTENSION_SOUTH_ROOMS_NORTH_PARTITION_Y
    ])
        square([
            EXTENSION_SOUTH_ROOMS_NORTH_PARTITION_LENGTH,
            WALL_PARTITION
        ]);
}


module extension_partition_walls_2d() {
    union() {
        office_east_partition_2d();

        extension_south_rooms_north_partition_2d();
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

        extension_partition_walls_2d();

        half_walls_2d();
    }
}


// ===========================================================================
// Wall heights
// ===========================================================================
//
// Walls are extruded over the full Z range, then clipped to a height
// envelope built from the height regions in dimensions.scad.
//

module south_block_height_region_2d() {
    square([
        WALL_HEIGHT_SOUTH_BLOCK_EAST_X,
        WALL_HEIGHT_SOUTH_BLOCK_NORTH_Y
    ]);
}


// Extends south to Y = 0 (outside the house) so that no sliver of the
// default region touches the extension walls only along an edge, which
// would make the clipped walls non-manifold.
module extension_south_height_region_2d() {
    translate([
        WALL_HEIGHT_EXTENSION_WEST_X,
        0
    ])
        square([
            HOUSE_MAX_WIDTH - WALL_HEIGHT_EXTENSION_WEST_X,
            WALL_HEIGHT_EXTENSION_SPLIT_Y
        ]);
}


module extension_hobby_height_region_2d() {
    translate([
        WALL_HEIGHT_EXTENSION_WEST_X,
        WALL_HEIGHT_EXTENSION_SPLIT_Y
    ])
        square([
            HOUSE_MAX_WIDTH - WALL_HEIGHT_EXTENSION_WEST_X,
            HOUSE_MAX_DEPTH - WALL_HEIGHT_EXTENSION_SPLIT_Y
        ]);
}


// South block: ceiling slopes from SOUTH_BLOCK_CEILING_SOUTH_HEIGHT at the
// south wall's inside face to SOUTH_BLOCK_CEILING_NORTH_HEIGHT at the
// legacy south wall, and is flat beyond those points.
//
// Interior walls here (e.g. Hailey / Stue partition) follow the slope; the
// legacy south wall's south half sits at the slope top.
module south_block_height_envelope_3d() {
    // Profile drawn as (y, z), then extruded east along X.
    rotate([90, 0, 90])
        linear_extrude(height = WALL_HEIGHT_SOUTH_BLOCK_EAST_X)
            polygon([
                [0,                               MAIN_FLOOR_Z],
                [WALL_HEIGHT_SOUTH_BLOCK_NORTH_Y, MAIN_FLOOR_Z],
                [WALL_HEIGHT_SOUTH_BLOCK_NORTH_Y, MAIN_FLOOR_Z + SOUTH_BLOCK_CEILING_NORTH_HEIGHT],
                [SOUTH_BLOCK_CEILING_NORTH_Y,     MAIN_FLOOR_Z + SOUTH_BLOCK_CEILING_NORTH_HEIGHT],
                [SOUTH_BLOCK_CEILING_SOUTH_Y,     MAIN_FLOOR_Z + SOUTH_BLOCK_CEILING_SOUTH_HEIGHT],
                [0,                               MAIN_FLOOR_Z + SOUTH_BLOCK_CEILING_SOUTH_HEIGHT]
            ]);
}


module wall_height_envelope_3d() {
    // Default: main house and 2013 addition.
    translate([0, 0, MAIN_FLOOR_Z])
        linear_extrude(height = MAIN_WALL_HEIGHT)
            difference() {
                square([
                    HOUSE_MAX_WIDTH,
                    HOUSE_MAX_DEPTH
                ]);

                south_block_height_region_2d();

                extension_south_height_region_2d();

                extension_hobby_height_region_2d();
            }

    south_block_height_envelope_3d();

    translate([0, 0, EXTENSION_SOUTH_ROOMS_FLOOR_Z])
        linear_extrude(height = EXTENSION_SOUTH_ROOMS_WALL_HEIGHT)
            extension_south_height_region_2d();

    translate([0, 0, EAST_EXTENSION_FLOOR_Z])
        linear_extrude(height = HOBBY_ROOM_WALL_HEIGHT)
            extension_hobby_height_region_2d();
}


// ---------------------------------------------------------------------------
// Exterior walls
// ---------------------------------------------------------------------------
//
// Bottoms follow the floor regions; tops are uniform at EXTERIOR_WALL_TOP_Z
// except over the south block slope.
//
// Every exterior wall south of NORTH_BLOCK_SOUTH_Y belongs to the south
// block, so the top only depends on Y. Building the cap from Y alone avoids
// region boundaries along wall faces, which would make the clipped walls
// non-manifold.
//

module exterior_wall_floor_envelope_3d() {
    top_z = WALL_EXTRUDE_TOP_Z + 1;

    translate([0, 0, MAIN_FLOOR_Z])
        linear_extrude(height = top_z - MAIN_FLOOR_Z)
            difference() {
                square([
                    HOUSE_MAX_WIDTH,
                    HOUSE_MAX_DEPTH
                ]);

                extension_south_height_region_2d();

                extension_hobby_height_region_2d();
            }

    translate([0, 0, EXTENSION_SOUTH_ROOMS_FLOOR_Z])
        linear_extrude(height = top_z - EXTENSION_SOUTH_ROOMS_FLOOR_Z)
            extension_south_height_region_2d();

    translate([0, 0, EAST_EXTENSION_FLOOR_Z])
        linear_extrude(height = top_z - EAST_EXTENSION_FLOOR_Z)
            extension_hobby_height_region_2d();
}


module exterior_wall_top_cap_3d() {
    bottom_z = WALL_EXTRUDE_BOTTOM_Z - 1;

    // Profile drawn as (y, z), then extruded east along X.
    rotate([90, 0, 90])
        linear_extrude(height = HOUSE_MAX_WIDTH)
            polygon([
                [0,                           bottom_z],
                [HOUSE_MAX_DEPTH,             bottom_z],
                [HOUSE_MAX_DEPTH,             EXTERIOR_WALL_TOP_Z],
                [SOUTH_BLOCK_CEILING_NORTH_Y, EXTERIOR_WALL_TOP_Z],
                [SOUTH_BLOCK_CEILING_SOUTH_Y, MAIN_FLOOR_Z + SOUTH_BLOCK_CEILING_SOUTH_HEIGHT],
                [0,                           MAIN_FLOOR_Z + SOUTH_BLOCK_CEILING_SOUTH_HEIGHT]
            ]);
}


module exterior_wall_height_envelope_3d() {
    intersection() {
        exterior_wall_floor_envelope_3d();

        exterior_wall_top_cap_3d();
    }
}


// Extrudes 2D wall children to their real heights.
module walls_at_real_height_3d(
    exterior = false
) {
    intersection() {
        translate([0, 0, WALL_EXTRUDE_BOTTOM_Z])
            linear_extrude(height = WALL_EXTRUDE_TOP_Z - WALL_EXTRUDE_BOTTOM_Z)
                children();

        if (exterior) {
            exterior_wall_height_envelope_3d();
        } else {
            wall_height_envelope_3d();
        }
    }
}


// ===========================================================================
// Wall geometry
// ===========================================================================
//
// Real wall heights, with door and window openings subtracted.
//

module opening_cuts_3d() {
    door_cuts_3d();

    window_cuts_3d();
}


module exterior_walls_preview() {
    difference() {
        walls_at_real_height_3d(exterior = true)
            exterior_walls_2d();

        opening_cuts_3d();
    }
}


module legacy_walls_preview() {
    difference() {
        walls_at_real_height_3d()
            legacy_walls_2d();

        opening_cuts_3d();
    }
}


module partition_walls_preview() {
    difference() {
        walls_at_real_height_3d() {
            partition_walls_2d();

            extension_partition_walls_2d();
        }

        opening_cuts_3d();
    }
}


// Half-walls use their own real heights.
module half_walls_preview() {
    half_walls_3d();
}


module house_walls_preview() {
    exterior_walls_preview();

    legacy_walls_preview();

    partition_walls_preview();

    half_walls_preview();
}
