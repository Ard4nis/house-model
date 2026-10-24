/*
 * Window schedule and window openings
 *
 * Uses the same opening record as doors.scad:
 *
 *   [name, axis, x, y, size_x, size_y, z, height]
 *
 *   axis    "x" = window in a wall running east-west  (thickness along Y)
 *           "y" = window in a wall running north-south (thickness along X)
 *
 *   x, y    south-west corner of the opening in plan
 *   z       sill level (floor level + sill height)
 *   height  opening height from sill to head
 *
 * Widths and heights are ROUGH OPENING sizes in the wall.
 *
 * The helpers deliberately have no default sizes. Regular windows use the
 * WINDOW_STANDARD_* constants below.
 *
 * Must be included after dimensions.scad and doors.scad.
 */


// ===========================================================================
// Helpers
// ===========================================================================

// Window in a wall running east-west.
//
// x        west edge of the opening
// wall_y   south face of the wall
// sill     sill height above floor_z
function window_in_x_wall(
    name,
    x,
    wall_y,
    thickness,
    width,
    sill,
    height,
    floor_z = MAIN_FLOOR_Z
) =
    [name, "x", x, wall_y, width, thickness, floor_z + sill, height];


// Window in a wall running north-south.
//
// wall_x   west face of the wall
// y        south edge of the opening
// sill     sill height above floor_z
function window_in_y_wall(
    name,
    wall_x,
    y,
    thickness,
    width,
    sill,
    height,
    floor_z = MAIN_FLOOR_Z
) =
    [name, "y", wall_x, y, thickness, width, floor_z + sill, height];


// Sill height for a window measured as a gap below the ceiling.
function window_sill_below_ceiling(
    ceiling_height,
    head_gap,
    height
) =
    ceiling_height
    - head_gap
    - height;


// ===========================================================================
// Standard window
// ===========================================================================
//
// MEASURED (approx.) on Hailey's window; the user believes all regular
// (non floor-to-ceiling) windows are this size.
//
// The top of the opening is ~250 mm below the ceiling.
//

WINDOW_STANDARD_WIDTH = 1200;

WINDOW_STANDARD_HEIGHT = 1100;

WINDOW_STANDARD_HEAD_GAP = 250;


// Standard window sill for a given ceiling height.
function window_standard_sill(ceiling_height) =
    window_sill_below_ceiling(
        ceiling_height,
        WINDOW_STANDARD_HEAD_GAP,
        WINDOW_STANDARD_HEIGHT
    );


// ===========================================================================
// Southern block
// ===========================================================================

// Hailey — south wall. Centred on the room.
WINDOW_HAILEY_SOUTH =
    window_in_x_wall(
        "Hailey south",
        x = door_centred(
            HAILEY_ROOM_X,
            HAILEY_ROOM_WIDTH,
            WINDOW_STANDARD_WIDTH
        ),
        wall_y = 0,
        thickness = WALL_EXTERIOR,
        width = WINDOW_STANDARD_WIDTH,
        sill = window_standard_sill(HAILEY_CEILING_SOUTH_HEIGHT),
        height = WINDOW_STANDARD_HEIGHT
    );


// ---------------------------------------------------------------------------
// Stue — window sections
// ---------------------------------------------------------------------------
//
// MEASURED (approx.). Tall glazed sections, each ~1000 mm wide, from ~50 mm
// above the floor to ~150 mm below the ceiling at the south wall.
//
// Rectangular: they do NOT follow the sloping ceiling.
//

STUE_WINDOW_SECTION_WIDTH = 1000;

STUE_WINDOW_SECTION_SILL = 50;

STUE_WINDOW_SECTION_HEAD_GAP = 150;


STUE_WINDOW_SECTION_HEIGHT =
    HAILEY_CEILING_SOUTH_HEIGHT
    - STUE_WINDOW_SECTION_HEAD_GAP
    - STUE_WINDOW_SECTION_SILL;


// Stue — south wall: three sections side by side.
//
// MEASURED (approx.). Gap from Stue's west wall.
WINDOW_STUE_SOUTH_SECTIONS = 3;

WINDOW_STUE_SOUTH_WEST_GAP = 100;

WINDOW_STUE_SOUTH_WIDTH =
    WINDOW_STUE_SOUTH_SECTIONS
    * STUE_WINDOW_SECTION_WIDTH;

WINDOW_STUE_SOUTH =
    window_in_x_wall(
        "Stue south (3 sections)",
        x = STUE_ROOM_X
            + WINDOW_STUE_SOUTH_WEST_GAP,
        wall_y = 0,
        thickness = WALL_EXTERIOR,
        width = WINDOW_STUE_SOUTH_WIDTH,
        sill = STUE_WINDOW_SECTION_SILL,
        height = STUE_WINDOW_SECTION_HEIGHT
    );


// Stue — east wall: one section.
//
// PLACEHOLDER position: centred on the wall until measured.
WINDOW_STUE_EAST =
    window_in_y_wall(
        "Stue east (1 section)",
        wall_x = STUE_ROOM_X + STUE_ROOM_WIDTH,
        y = door_centred(
            STUE_ROOM_Y,
            STUE_ROOM_DEPTH,
            STUE_WINDOW_SECTION_WIDTH
        ),
        thickness = WALL_EXTERIOR,
        width = STUE_WINDOW_SECTION_WIDTH,
        sill = STUE_WINDOW_SECTION_SILL,
        height = STUE_WINDOW_SECTION_HEIGHT
    );


// ===========================================================================
// Original northern block
// ===========================================================================

// Nova — west wall.
//
// MEASURED (approx.). Gap from Nova's north wall to the window.
WINDOW_NOVA_WEST_NORTH_GAP = 1500;

WINDOW_NOVA_WEST =
    window_in_y_wall(
        "Nova west",
        wall_x = 0,
        y = NOVA_ROOM_NORTH_Y
            - WINDOW_NOVA_WEST_NORTH_GAP
            - WINDOW_STANDARD_WIDTH,
        thickness = WALL_EXTERIOR,
        width = WINDOW_STANDARD_WIDTH,
        sill = window_standard_sill(MAIN_WALL_HEIGHT),
        height = WINDOW_STANDARD_HEIGHT
    );


// Green bathroom — north wall.
//
// MEASURED (approx.). Gap from the west wall: the window starts where the
// shower (GREEN_BATHROOM_SHOWER_*) ends. Its east edge lands on the
// bathroom's east wall.
WINDOW_GREEN_BATHROOM_NORTH_WEST_GAP = 800;

WINDOW_GREEN_BATHROOM_NORTH =
    window_in_x_wall(
        "Green bathroom north",
        x = GREEN_BATHROOM_X
            + WINDOW_GREEN_BATHROOM_NORTH_WEST_GAP,
        wall_y = HOUSE_NORTH_INTERIOR_Y,
        thickness = WALL_EXTERIOR,
        width = WINDOW_STANDARD_WIDTH,
        sill = window_standard_sill(MAIN_WALL_HEIGHT),
        height = WINDOW_STANDARD_HEIGHT
    );


// Master bedroom — north wall.
//
// MEASURED (approx.). Gap from the master bedroom east wall to the window.
WINDOW_MASTER_BEDROOM_NORTH_EAST_GAP = 900;

WINDOW_MASTER_BEDROOM_NORTH =
    window_in_x_wall(
        "Master bedroom north",
        x = MASTER_BEDROOM_EAST_X
            - WINDOW_MASTER_BEDROOM_NORTH_EAST_GAP
            - WINDOW_STANDARD_WIDTH,
        wall_y = HOUSE_NORTH_INTERIOR_Y,
        thickness = WALL_EXTERIOR,
        width = WINDOW_STANDARD_WIDTH,
        sill = window_standard_sill(MAIN_WALL_HEIGHT),
        height = WINDOW_STANDARD_HEIGHT
    );


// Viktualierum / krea — north wall.
//
// MEASURED (approx.). Gap from the krea west wall to the window.
WINDOW_KREA_NORTH_WEST_GAP = 500;

WINDOW_KREA_NORTH =
    window_in_x_wall(
        "Viktualierum/krea north",
        x = KREA_ROOM_X
            + WINDOW_KREA_NORTH_WEST_GAP,
        wall_y = HOUSE_NORTH_INTERIOR_Y,
        thickness = WALL_EXTERIOR,
        width = WINDOW_STANDARD_WIDTH,
        sill = window_standard_sill(MAIN_WALL_HEIGHT),
        height = WINDOW_STANDARD_HEIGHT
    );


// ===========================================================================
// 2013 addition
// ===========================================================================

// Pink bathroom — north wall.
//
// MEASURED (approx.). The window starts after the ~800 mm shower in the
// north-west corner.
//
// PROVISIONAL width: slimmer than standard; assumed to fill the remaining
// width to the east wall until measured. Standard height and head gap
// assumed.
WINDOW_PINK_BATHROOM_NORTH_WEST_GAP =
    PINK_BATHROOM_SHOWER_DEPTH;

WINDOW_PINK_BATHROOM_NORTH_WIDTH =
    PINK_BATHROOM_WIDTH
    - WINDOW_PINK_BATHROOM_NORTH_WEST_GAP;

WINDOW_PINK_BATHROOM_NORTH =
    window_in_x_wall(
        "Pink bathroom north",
        x = PINK_BATHROOM_X
            + WINDOW_PINK_BATHROOM_NORTH_WEST_GAP,
        wall_y = HOUSE_NORTH_INTERIOR_Y,
        thickness = WALL_EXTERIOR,
        width = WINDOW_PINK_BATHROOM_NORTH_WIDTH,
        sill = window_standard_sill(MAIN_WALL_HEIGHT),
        height = WINDOW_STANDARD_HEIGHT
    );


// Playroom — north wall. Centred on the room.
WINDOW_PLAYROOM_NORTH =
    window_in_x_wall(
        "Playroom north",
        x = door_centred(
            PLAYROOM_X,
            PLAYROOM_WIDTH,
            WINDOW_STANDARD_WIDTH
        ),
        wall_y = HOUSE_NORTH_INTERIOR_Y,
        thickness = WALL_EXTERIOR,
        width = WINDOW_STANDARD_WIDTH,
        sill = window_standard_sill(MAIN_WALL_HEIGHT),
        height = WINDOW_STANDARD_HEIGHT
    );


// Caleb — south wall (exterior, facing the terrace).
//
// MEASURED (approx.). Gap from Caleb's west wall (2013 legacy wall).
WINDOW_CALEB_SOUTH_WEST_GAP = 500;

WINDOW_CALEB_SOUTH =
    window_in_x_wall(
        "Caleb south",
        x = CALEB_ROOM_X
            + WINDOW_CALEB_SOUTH_WEST_GAP,
        wall_y = NORTH_BLOCK_SOUTH_Y,
        thickness = WALL_EXTERIOR,
        width = WINDOW_STANDARD_WIDTH,
        sill = window_standard_sill(MAIN_WALL_HEIGHT),
        height = WINDOW_STANDARD_HEIGHT
    );


// ===========================================================================
// Current extension
// ===========================================================================

// Office — south wall.
//
// MEASURED (approx.). Gap from the tech room wall (west face of the office
// east partition) to the window.
//
// Sill and head are at the SAME ABSOLUTE LEVELS as the main-house standard
// windows (Z 850 -> 1950), so the windows line up from outside. Relative to
// the raised office floor the sill is therefore ~1090.
WINDOW_OFFICE_SOUTH_EAST_GAP = 100;

WINDOW_OFFICE_SOUTH =
    window_in_x_wall(
        "Office south",
        x = OFFICE_EAST_PARTITION_X
            - WINDOW_OFFICE_SOUTH_EAST_GAP
            - WINDOW_STANDARD_WIDTH,
        wall_y = NORTH_BLOCK_SOUTH_Y,
        thickness = WALL_EXTERIOR,
        width = WINDOW_STANDARD_WIDTH,
        sill = window_standard_sill(MAIN_WALL_HEIGHT),
        height = WINDOW_STANDARD_HEIGHT
    );


// Hobby room — north wall: two sections the width of the terrace door.
//
// DERIVED position. The terrace door (1200) plus two 1200 sections exactly
// fill the 3600 mm wall, so the sections run from the west wall to the
// terrace door.
//
// MEASURED (approx.). Each unit starts ~100 mm above the hobby room floor
// and ends level with the terrace door head.
//
// The bottom third of each unit is a solid panel, not glazing. It is left
// as wall; only the upper two thirds are cut.
//
HOBBY_ROOM_WINDOW_SECTIONS = 2;

HOBBY_ROOM_WINDOW_UNIT_SILL = 100;

HOBBY_ROOM_WINDOW_PANEL_FRACTION = 1 / 3;


HOBBY_ROOM_WINDOW_UNIT_BOTTOM_Z =
    EAST_EXTENSION_FLOOR_Z
    + HOBBY_ROOM_WINDOW_UNIT_SILL;


HOBBY_ROOM_WINDOW_UNIT_TOP_Z =
    DOOR_HOBBY_ROOM_TERRACE[6]
    + DOOR_HOBBY_ROOM_TERRACE[7];


HOBBY_ROOM_WINDOW_UNIT_HEIGHT =
    HOBBY_ROOM_WINDOW_UNIT_TOP_Z
    - HOBBY_ROOM_WINDOW_UNIT_BOTTOM_Z;


// Glazing starts above the solid panel.
HOBBY_ROOM_WINDOW_GLAZING_BOTTOM_Z =
    HOBBY_ROOM_WINDOW_UNIT_BOTTOM_Z
    + HOBBY_ROOM_WINDOW_UNIT_HEIGHT * HOBBY_ROOM_WINDOW_PANEL_FRACTION;


WINDOW_HOBBY_ROOM_NORTH =
    [
        for (i = [0 : HOBBY_ROOM_WINDOW_SECTIONS - 1])
            window_in_x_wall(
                str("Hobby room north section ", i + 1),
                x = EXTENSION_WEST_X
                    + i * DOOR_HOBBY_ROOM_TERRACE_WIDTH,
                wall_y = HOUSE_NORTH_INTERIOR_Y,
                thickness = WALL_EXTERIOR,
                width = DOOR_HOBBY_ROOM_TERRACE_WIDTH,
                sill = HOBBY_ROOM_WINDOW_GLAZING_BOTTOM_Z
                    - EAST_EXTENSION_FLOOR_Z,
                height = HOBBY_ROOM_WINDOW_UNIT_TOP_Z
                    - HOBBY_ROOM_WINDOW_GLAZING_BOTTOM_Z,
                floor_z = EAST_EXTENSION_FLOOR_Z
            )
    ];


// ===========================================================================
// Window schedule
// ===========================================================================

WINDOWS = concat([
    WINDOW_HAILEY_SOUTH,
    WINDOW_STUE_SOUTH,
    WINDOW_STUE_EAST,

    WINDOW_NOVA_WEST,
    WINDOW_GREEN_BATHROOM_NORTH,
    WINDOW_MASTER_BEDROOM_NORTH,
    WINDOW_KREA_NORTH,

    WINDOW_PINK_BATHROOM_NORTH,
    WINDOW_PLAYROOM_NORTH,
    WINDOW_CALEB_SOUTH,

    WINDOW_OFFICE_SOUTH
], WINDOW_HOBBY_ROOM_NORTH);


// ===========================================================================
// Geometry
// ===========================================================================

module window_cuts_3d() {
    for (window = WINDOWS) {
        opening_cut_3d(window);
    }
}


// Plan footprint of all window openings.
module windows_2d() {
    for (window = WINDOWS) {
        translate([window[2], window[3]])
            square([window[4], window[5]]);
    }
}
