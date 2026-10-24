/*
 * Door schedule and door openings
 *
 * Every door is one record in DOORS. Wall previews subtract door_cuts_3d(),
 * so walls stay simple 2D plans and openings are defined in one place.
 *
 * Door record:
 *
 *   [name, axis, x, y, size_x, size_y, z, height]
 *
 *   axis   "x" = door in a wall running east-west  (thickness along Y)
 *          "y" = door in a wall running north-south (thickness along X)
 *
 *   x, y   south-west corner of the opening in plan
 *   z      bottom of the opening (the floor level it opens from)
 *
 * Widths and heights are ROUGH OPENING sizes in the wall, not door-leaf
 * sizes.
 *
 * Position status used below:
 *
 *   MEASURED     position measured in the house
 *   DERIVED      follows from other known layout (e.g. kitchen worktops)
 *   PLACEHOLDER  the door is known to exist, but its position is not; it is
 *                centred in its wall segment until measured
 *   CONFIRMED    centred position checked against the house and accepted
 *
 * Must be included after dimensions.scad.
 */


// ===========================================================================
// Defaults
// ===========================================================================

// PROVISIONAL. Typical Danish 9M interior-door rough opening.
DOOR_DEFAULT_WIDTH = 900;

// PROVISIONAL. Typical 21M rough opening height.
DOOR_DEFAULT_HEIGHT = 2100;


// Small overshoot so cuts pass cleanly through wall faces.
DOOR_CUT_EPSILON = 1;


// ===========================================================================
// Helpers
// ===========================================================================

// Start position that centres an opening of `width` in a wall segment.
function door_centred(
    segment_start,
    segment_length,
    width = DOOR_DEFAULT_WIDTH
) =
    segment_start
    + (segment_length - width) / 2;


// Door in a wall running east-west.
//
// x       west edge of the opening
// wall_y  south face of the wall
function door_in_x_wall(
    name,
    x,
    wall_y,
    thickness,
    width = DOOR_DEFAULT_WIDTH,
    z = MAIN_FLOOR_Z,
    height = DOOR_DEFAULT_HEIGHT
) =
    [name, "x", x, wall_y, width, thickness, z, height];


// Door in a wall running north-south.
//
// wall_x  west face of the wall
// y       south edge of the opening
function door_in_y_wall(
    name,
    wall_x,
    y,
    thickness,
    width = DOOR_DEFAULT_WIDTH,
    z = MAIN_FLOOR_Z,
    height = DOOR_DEFAULT_HEIGHT
) =
    [name, "y", wall_x, y, thickness, width, z, height];


// ===========================================================================
// Southern block
// ===========================================================================

// MEASURED (approx.). Gap from the south exterior wall to the door.
DOOR_HAILEY_STUE_SOUTH_GAP = 300;

DOOR_HAILEY_STUE =
    door_in_y_wall(
        "Hailey / Stue",
        wall_x = HAILEY_EAST_PARTITION_X,
        y = HAILEY_ROOM_Y
            + DOOR_HAILEY_STUE_SOUTH_GAP,
        thickness = WALL_PARTITION
    );


// Double doors through the legacy south wall.
//
// MEASURED (approx.). Gap from Stue's west wall to the doors.
DOOR_STUE_ALRUM_WEST_GAP = 1500;

// MEASURED.
DOOR_STUE_ALRUM_WIDTH = 1800;

DOOR_STUE_ALRUM =
    door_in_x_wall(
        "Stue / Alrum (double doors, legacy wall)",
        x = STUE_ROOM_X
            + DOOR_STUE_ALRUM_WEST_GAP,
        wall_y = LEGACY_SOUTH_WALL_Y,
        thickness = WALL_LEGACY_EXTERIOR,
        width = DOOR_STUE_ALRUM_WIDTH
    );


// ===========================================================================
// Original northern block
// ===========================================================================

// MEASURED (approx.). Gap from Nova's north wall (the green bathroom wall)
// to the north edge of the door.
DOOR_NOVA_ALRUM_NORTH_GAP = 1500;

DOOR_NOVA_ALRUM =
    door_in_y_wall(
        "Alrum / Nova",
        wall_x = NOVA_EAST_PARTITION_X,
        y = NOVA_NORTH_PARTITION_Y
            - DOOR_NOVA_ALRUM_NORTH_GAP
            - DOOR_DEFAULT_WIDTH,
        thickness = WALL_PARTITION
    );


// MEASURED (approx.). Gap from the west exterior wall to the door.
DOOR_NOVA_GREEN_BATHROOM_WEST_GAP = 700;

DOOR_NOVA_GREEN_BATHROOM =
    door_in_x_wall(
        "Nova / green bathroom",
        x = NOVA_ROOM_X
            + DOOR_NOVA_GREEN_BATHROOM_WEST_GAP,
        wall_y = NOVA_NORTH_PARTITION_Y,
        thickness = WALL_PARTITION
    );


// MEASURED (approx.). Gap from the north exterior wall to the north edge
// of the door.
DOOR_GREEN_BATHROOM_NORTH_GAP = 500;

DOOR_GREEN_BATHROOM_MASTER_BEDROOM =
    door_in_y_wall(
        "Green bathroom / master bedroom",
        wall_x = GREEN_BATHROOM_EAST_PARTITION_X,
        y = HOUSE_NORTH_INTERIOR_Y
            - DOOR_GREEN_BATHROOM_NORTH_GAP
            - DOOR_DEFAULT_WIDTH,
        thickness = WALL_PARTITION
    );


// MEASURED (approx.). Gap from the east face of Nova's wall to the door.
DOOR_MASTER_BEDROOM_ALRUM_OFFSET = 200;

DOOR_MASTER_BEDROOM_ALRUM =
    door_in_x_wall(
        "Master bedroom / Alrum",
        x = MASTER_BEDROOM_STEP_X
            + DOOR_MASTER_BEDROOM_ALRUM_OFFSET,
        wall_y = MASTER_BEDROOM_SOUTH_PARTITION_Y,
        thickness = WALL_PARTITION
    );


// MEASURED (approx.). Offset and width live in dimensions.scad because
// the krea notch wall starts at the door's east edge.
DOOR_KREA_ALRUM =
    door_in_x_wall(
        "Viktualierum/krea / Alrum",
        x = KREA_ROOM_X
            + KREA_ALRUM_DOOR_OFFSET,
        wall_y = KREA_SOUTH_PARTITION_Y,
        thickness = WALL_PARTITION,
        width = KREA_ALRUM_DOOR_WIDTH
    );


// ---------------------------------------------------------------------------
// Terrace door
// ---------------------------------------------------------------------------
//
// DERIVED from the kitchen layout:
//
//   600 worktop + 900 terrace door + 600 worktop = ALRUM_KITCHEN_WIDTH
//
// Through the south exterior wall of the northern block.
//

ALRUM_KITCHEN_WORKTOP_DEPTH = 600;

ALRUM_TERRACE_DOOR_WIDTH = 900;


DOOR_TERRACE =
    door_in_x_wall(
        "Kitchen / terrace (exterior)",
        x = ALRUM_KITCHEN_X + ALRUM_KITCHEN_WORKTOP_DEPTH,
        wall_y = NORTH_BLOCK_SOUTH_Y,
        thickness = WALL_EXTERIOR,
        width = ALRUM_TERRACE_DOOR_WIDTH
    );


// ---------------------------------------------------------------------------
// Bryggers door
// ---------------------------------------------------------------------------
//
// DERIVED. Directly in line with the terrace door, at the north end of the
// kitchen fridge / freezer alcove.
//

DOOR_BRYGGERS_ALRUM =
    door_in_x_wall(
        "Alrum (fridge alcove) / Bryggers",
        x = door_centred(
            DOOR_TERRACE[2],
            DOOR_TERRACE[4]
        ),
        wall_y = BRYGGERS_SOUTH_PARTITION_Y,
        thickness = WALL_PARTITION
    );


// ---------------------------------------------------------------------------
// Front door
// ---------------------------------------------------------------------------
//
// DERIVED position. Through the north exterior wall of the Bryggers,
// centred on the kitchen / Bryggers door.
//

// MEASURED.
DOOR_FRONT_WIDTH = 1000;

DOOR_FRONT =
    door_in_x_wall(
        "Bryggers / outside (front door)",
        x = door_centred(
            DOOR_BRYGGERS_ALRUM[2],
            DOOR_BRYGGERS_ALRUM[4],
            DOOR_FRONT_WIDTH
        ),
        wall_y = HOUSE_NORTH_INTERIOR_Y,
        thickness = WALL_EXTERIOR,
        width = DOOR_FRONT_WIDTH
    );


// ===========================================================================
// 2013 addition
// ===========================================================================

// CONFIRMED (centred). Through the 2013 legacy wall, opposite the hallway.
DOOR_ALRUM_HALLWAY =
    door_in_y_wall(
        "Alrum / hallway (2013 legacy wall)",
        wall_x = LEGACY_2013_EAST_WALL_X,
        y = door_centred(
            HALLWAY_Y,
            HALLWAY_DEPTH
        ),
        thickness = WALL_LEGACY_EXTERIOR
    );


// CONFIRMED (centred).
DOOR_HALLWAY_PINK_BATHROOM =
    door_in_x_wall(
        "Hallway / pink bathroom",
        x = door_centred(
            HALLWAY_X,
            HALLWAY_WIDTH
        ),
        wall_y = ADDITION_2013_CORRIDOR_NORTH_PARTITION_Y,
        thickness = WALL_PARTITION
    );


// CONFIRMED (centred).
DOOR_HALLWAY_CALEB =
    door_in_x_wall(
        "Hallway / Caleb",
        x = door_centred(
            HALLWAY_X,
            HALLWAY_WIDTH
        ),
        wall_y = CALEB_NORTH_PARTITION_Y,
        thickness = WALL_PARTITION
    );


// CONFIRMED (centred).
DOOR_HALLWAY_PLAYROOM_CORRIDOR =
    door_in_y_wall(
        "Hallway / playroom corridor",
        wall_x = HALLWAY_EAST_PARTITION_X,
        y = door_centred(
            HALLWAY_Y,
            HALLWAY_DEPTH
        ),
        thickness = WALL_PARTITION
    );


// MEASURED (approx.). Door sits tight against the pink bathroom wall.
DOOR_PLAYROOM_OFFSET = 0;

DOOR_PLAYROOM_CORRIDOR_PLAYROOM =
    door_in_x_wall(
        "Playroom corridor / playroom",
        x = PLAYROOM_X
            + DOOR_PLAYROOM_OFFSET,
        wall_y = ADDITION_2013_CORRIDOR_NORTH_PARTITION_Y,
        thickness = WALL_PARTITION
    );


// ===========================================================================
// Current extension
// ===========================================================================

// CONFIRMED (centred). Through the current-extension legacy wall, at the end of the
// playroom corridor.
//
// Opens from the main floor; the hobby room floor is ~300 mm lower.
DOOR_PLAYROOM_CORRIDOR_HOBBY_ROOM =
    door_in_y_wall(
        "Playroom corridor / hobby room (legacy wall)",
        wall_x = LEGACY_CURRENT_EXTENSION_WALL_X,
        y = door_centred(
            PLAYROOM_CORRIDOR_Y,
            PLAYROOM_CORRIDOR_DEPTH
        ),
        thickness = WALL_LEGACY_EXTERIOR
    );


// MEASURED (approx.). Gap from the door to the hobby room wall (north).
DOOR_OFFICE_TECH_ROOM_NORTH_GAP = 300;

DOOR_OFFICE_TECH_ROOM =
    door_in_y_wall(
        "Office / tech room",
        wall_x = OFFICE_EAST_PARTITION_X,
        y = EXTENSION_SOUTH_ROOMS_NORTH_PARTITION_Y
            - DOOR_OFFICE_TECH_ROOM_NORTH_GAP
            - DOOR_DEFAULT_WIDTH,
        thickness = WALL_PARTITION,
        z = EXTENSION_SOUTH_ROOMS_FLOOR_Z
    );


// MEASURED (approx.). Gap from the current-extension legacy wall.
DOOR_OFFICE_HOBBY_ROOM_OFFSET = 50;

// Opens from the raised office floor; one ~60 mm step down to the hobby
// room.
DOOR_OFFICE_HOBBY_ROOM =
    door_in_x_wall(
        "Office / hobby room",
        x = OFFICE_X
            + DOOR_OFFICE_HOBBY_ROOM_OFFSET,
        wall_y = EXTENSION_SOUTH_ROOMS_NORTH_PARTITION_Y,
        thickness = WALL_PARTITION,
        z = EXTENSION_SOUTH_ROOMS_FLOOR_Z
    );


// Terrace door in the north exterior wall, tight against the east wall.
//
// MEASURED (approx.). The full terrace-door unit is ~1200 mm wide; the door
// leaf itself is ~1000 mm. The wall opening is the full unit.
//
// Its lower third is a solid panel in the door leaf. Door leaves are not
// modelled, so the opening stays full height.
DOOR_HOBBY_ROOM_TERRACE_WIDTH = 1200;

DOOR_HOBBY_ROOM_TERRACE =
    door_in_x_wall(
        "Hobby room / terrace (exterior)",
        x = EXTENSION_EAST_X
            - DOOR_HOBBY_ROOM_TERRACE_WIDTH,
        wall_y = HOUSE_NORTH_INTERIOR_Y,
        thickness = WALL_EXTERIOR,
        width = DOOR_HOBBY_ROOM_TERRACE_WIDTH,
        z = EAST_EXTENSION_FLOOR_Z
    );


// ===========================================================================
// Door schedule
// ===========================================================================

DOORS = [
    DOOR_HAILEY_STUE,
    DOOR_STUE_ALRUM,

    DOOR_NOVA_ALRUM,
    DOOR_NOVA_GREEN_BATHROOM,
    DOOR_GREEN_BATHROOM_MASTER_BEDROOM,
    DOOR_MASTER_BEDROOM_ALRUM,
    DOOR_KREA_ALRUM,
    DOOR_TERRACE,
    DOOR_BRYGGERS_ALRUM,
    DOOR_FRONT,

    DOOR_ALRUM_HALLWAY,
    DOOR_HALLWAY_PINK_BATHROOM,
    DOOR_HALLWAY_CALEB,
    DOOR_HALLWAY_PLAYROOM_CORRIDOR,
    DOOR_PLAYROOM_CORRIDOR_PLAYROOM,

    DOOR_PLAYROOM_CORRIDOR_HOBBY_ROOM,
    DOOR_OFFICE_TECH_ROOM,
    DOOR_OFFICE_HOBBY_ROOM,
    DOOR_HOBBY_ROOM_TERRACE
];


// ===========================================================================
// Geometry
// ===========================================================================

// Solid volume of one opening record (door or window), slightly oversized
// through the wall thickness so it cuts cleanly.
module opening_cut_3d(opening) {
    axis   = opening[1];
    x      = opening[2];
    y      = opening[3];
    size_x = opening[4];
    size_y = opening[5];
    z      = opening[6];
    height = opening[7];

    e = DOOR_CUT_EPSILON;

    if (axis == "x") {
        translate([x, y - e, z - e])
            cube([size_x, size_y + 2 * e, height + e]);
    } else {
        translate([x - e, y, z - e])
            cube([size_x + 2 * e, size_y, height + e]);
    }
}


module door_cuts_3d() {
    for (door = DOORS) {
        opening_cut_3d(door);
    }
}


// Plan footprint of all openings.
module doors_2d() {
    for (door = DOORS) {
        translate([door[2], door[3]])
            square([door[4], door[5]]);
    }
}
