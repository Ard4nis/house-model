/*
 * HomeOpenSCAD house model
 *
 * The project models the house primarily as a printable 3D floor plan.
 *
 * Intended geometry includes:
 *
 *   - floors
 *   - walls
 *   - doors
 *   - windows
 *   - stairs
 *   - fixed architectural features
 *   - optional furniture
 *
 * It is NOT intended to become a complete roof/structural house model.
 *
 *
 * All source dimensions are real-world millimetres.
 *
 * Coordinate system:
 *
 *   Origin = south-west exterior corner of the current house footprint
 *            at main-house finished-floor level
 *
 *   +X = East
 *   +Y = North
 *   +Z = Up
 *
 *   Main finished floor = Z 0
 */


// ===========================================================================
// Includes
// ===========================================================================

include <lib/coordinates.scad>

include <house/dimensions.scad>
include <house/footprint.scad>
include <house/walls.scad>
include <house/doors.scad>
include <house/windows.scad>
include <house/base.scad>
include <house/rooms.scad>
include <house/features.scad>
include <house/print.scad>


// ===========================================================================
// Model configuration
// ===========================================================================

// MINIATURE_SCALE is derived in house/print.scad from the printed
// partition thickness (PRINT_PARTITION_THICKNESS).


// "preview"  development scene: everything below, controlled by SHOW_*.
// "print"    printable solids only: base, walls, half-walls, stairs.
OUTPUT_MODE = "preview";


// Print mode only. One of:
//
//   "all"            every piece in place, with joints (assembly check)
//   "south_block"
//   "north_block"
//   "addition_2013"
//   "extension"
PRINT_PIECE = "all";


// ===========================================================================
// Preview configuration
// ===========================================================================

SHOW_COORDINATE_AXES = true;

SHOW_FOOTPRINT = false;

SHOW_BASE = true;

SHOW_EXTERIOR_WALLS = true;

SHOW_LEGACY_WALLS = true;

SHOW_PARTITION_WALLS = true;

SHOW_HALF_WALLS = true;

SHOW_ROOMS = true;

SHOW_SKYLIGHT_MARKERS = true;

SHOW_STAIRS = true;


// ---------------------------------------------------------------------------
// Development-only preview dimensions
// ---------------------------------------------------------------------------

PREVIEW_ROOM_HEIGHT = 25;

PREVIEW_ROOM_Z = 25;


PREVIEW_FEATURE_HEIGHT = 25;

PREVIEW_FEATURE_Z = 75;


// ===========================================================================
// Diagnostics
// ===========================================================================


// ---------------------------------------------------------------------------
// Overall house
// ---------------------------------------------------------------------------

echo(
    "North row clear width:",
    PLAN_NORTH_CLEAR_WIDTH
);

echo(
    "North block width — modelling value:",
    NORTH_BLOCK_WIDTH
);

echo(
    "North block depth — provisional modelling value:",
    NORTH_BLOCK_DEPTH
);

echo(
    "South block width — modelling value:",
    SOUTH_BLOCK_WIDTH
);

echo(
    "South block depth — provisional modelling value:",
    SOUTH_BLOCK_DEPTH
);

echo(
    "House maximum width:",
    HOUSE_MAX_WIDTH
);

echo(
    "House maximum depth:",
    HOUSE_MAX_DEPTH
);


// ---------------------------------------------------------------------------
// Floor levels
// ---------------------------------------------------------------------------

echo(
    "Main house floor Z:",
    MAIN_FLOOR_Z
);

echo(
    "East extension floor drop:",
    EAST_EXTENSION_FLOOR_DROP
);

echo(
    "East extension floor Z:",
    EAST_EXTENSION_FLOOR_Z
);


// ---------------------------------------------------------------------------
// Structural walls
// ---------------------------------------------------------------------------

echo(
    "Legacy south wall:",
    [
        LEGACY_SOUTH_WALL_X,
        LEGACY_SOUTH_WALL_Y,
        LEGACY_SOUTH_WALL_LENGTH
    ]
);

echo(
    "2013 legacy east wall:",
    [
        LEGACY_2013_EAST_WALL_X,
        LEGACY_2013_EAST_WALL_Y,
        LEGACY_2013_EAST_WALL_LENGTH
    ]
);

echo(
    "Current-extension legacy wall:",
    [
        LEGACY_CURRENT_EXTENSION_WALL_X,
        LEGACY_CURRENT_EXTENSION_WALL_Y,
        LEGACY_CURRENT_EXTENSION_WALL_LENGTH
    ]
);


// ---------------------------------------------------------------------------
// Southern-block wall heights
// ---------------------------------------------------------------------------

echo(
    "South block wall height — south:",
    SOUTH_BLOCK_CEILING_SOUTH_HEIGHT
);

echo(
    "South block wall height — north:",
    SOUTH_BLOCK_CEILING_NORTH_HEIGHT
);

echo(
    "Main wall height:",
    MAIN_WALL_HEIGHT
);

echo(
    "Hobby room wall height / top Z:",
    [
        HOBBY_ROOM_WALL_HEIGHT,
        HOBBY_ROOM_WALL_TOP_Z
    ]
);

echo(
    "Office / tech wall height / top Z:",
    [
        EXTENSION_SOUTH_ROOMS_WALL_HEIGHT,
        EXTENSION_SOUTH_ROOMS_WALL_TOP_Z
    ]
);

echo(
    "South block slope angle:",
    SOUTH_BLOCK_CEILING_SLOPE_ANGLE
);


// ---------------------------------------------------------------------------
// Hailey
// ---------------------------------------------------------------------------

echo(
    "Hailey room origin:",
    [
        HAILEY_ROOM_X,
        HAILEY_ROOM_Y
    ]
);

echo(
    "Hailey room clear size:",
    [
        HAILEY_ROOM_WIDTH,
        HAILEY_ROOM_DEPTH
    ]
);


// ---------------------------------------------------------------------------
// Stue
// ---------------------------------------------------------------------------

echo(
    "Stue origin:",
    [
        STUE_ROOM_X,
        STUE_ROOM_Y
    ]
);

echo(
    "Stue clear size:",
    [
        STUE_ROOM_WIDTH,
        STUE_ROOM_DEPTH
    ]
);


// ---------------------------------------------------------------------------
// Nova
// ---------------------------------------------------------------------------

echo(
    "Nova room origin:",
    [
        NOVA_ROOM_X,
        NOVA_ROOM_Y
    ]
);

echo(
    "Nova room clear size:",
    [
        NOVA_ROOM_WIDTH,
        NOVA_ROOM_DEPTH
    ]
);

echo(
    "Nova room plan depth difference:",
    NOVA_ROOM_PLAN_DEPTH_DIFFERENCE
);

echo(
    "Nova east partition:",
    [
        NOVA_EAST_PARTITION_X,
        NOVA_EAST_PARTITION_Y,
        WALL_PARTITION,
        NOVA_EAST_PARTITION_LENGTH
    ]
);

echo(
    "Nova north partition:",
    [
        NOVA_NORTH_PARTITION_X,
        NOVA_NORTH_PARTITION_Y,
        NOVA_NORTH_PARTITION_LENGTH,
        WALL_PARTITION
    ]
);


// ---------------------------------------------------------------------------
// Green bathroom
// ---------------------------------------------------------------------------

echo(
    "Green bathroom origin:",
    [
        GREEN_BATHROOM_X,
        GREEN_BATHROOM_Y
    ]
);

echo(
    "Green bathroom clear size:",
    [
        GREEN_BATHROOM_WIDTH,
        GREEN_BATHROOM_DEPTH
    ]
);

echo(
    "Green bathroom plan depth difference:",
    GREEN_BATHROOM_PLAN_DEPTH_DIFFERENCE
);

echo(
    "Green bathroom east partition:",
    [
        GREEN_BATHROOM_EAST_PARTITION_X,
        GREEN_BATHROOM_EAST_PARTITION_Y,
        WALL_PARTITION,
        GREEN_BATHROOM_EAST_PARTITION_LENGTH
    ]
);


// ---------------------------------------------------------------------------
// Master bedroom
// ---------------------------------------------------------------------------

echo(
    "Master bedroom clear outline:",
    MASTER_BEDROOM_POINTS
);

echo(
    "Master bedroom approximate area m2:",
    MASTER_BEDROOM_AREA_M2
);

echo(
    "Master bedroom south partition:",
    [
        MASTER_BEDROOM_SOUTH_PARTITION_X,
        MASTER_BEDROOM_SOUTH_PARTITION_Y,
        MASTER_BEDROOM_SOUTH_PARTITION_LENGTH,
        WALL_PARTITION
    ]
);

echo(
    "Master bedroom east partition:",
    [
        MASTER_BEDROOM_EAST_PARTITION_X,
        MASTER_BEDROOM_EAST_PARTITION_Y,
        WALL_PARTITION,
        MASTER_BEDROOM_EAST_PARTITION_LENGTH
    ]
);


// ---------------------------------------------------------------------------
// Viktualierum / krea
// ---------------------------------------------------------------------------

echo(
    "Viktualierum/krea origin:",
    [
        KREA_ROOM_X,
        KREA_ROOM_Y
    ]
);

echo(
    "Viktualierum/krea envelope (before notch):",
    [
        KREA_ROOM_WIDTH,
        KREA_ROOM_DEPTH
    ]
);

echo(
    "Viktualierum/krea approximate area m2:",
    KREA_ROOM_AREA_M2
);

echo(
    "Viktualierum/krea east partition:",
    [
        KREA_EAST_PARTITION_X,
        KREA_EAST_PARTITION_Y,
        WALL_PARTITION,
        KREA_EAST_PARTITION_LENGTH
    ]
);


// ---------------------------------------------------------------------------
// Bryggers
// ---------------------------------------------------------------------------

echo(
    "Bryggers origin:",
    [
        BRYGGERS_ROOM_X,
        BRYGGERS_ROOM_Y
    ]
);

echo(
    "Bryggers clear size:",
    [
        BRYGGERS_ROOM_WIDTH,
        BRYGGERS_ROOM_DEPTH
    ]
);

echo(
    "Bryggers approximate area m2:",
    BRYGGERS_ROOM_AREA_M2
);

echo(
    "Bryggers south partition:",
    [
        BRYGGERS_SOUTH_PARTITION_X,
        BRYGGERS_SOUTH_PARTITION_Y,
        BRYGGERS_SOUTH_PARTITION_LENGTH,
        WALL_PARTITION
    ]
);


// ---------------------------------------------------------------------------
// 2013 addition
// ---------------------------------------------------------------------------

echo(
    "2013 addition east-rooms width (plan 2980):",
    ADDITION_2013_EAST_ROOMS_WIDTH
);

echo(
    "Caleb room origin / clear size:",
    [
        CALEB_ROOM_X,
        CALEB_ROOM_Y,
        CALEB_ROOM_WIDTH,
        CALEB_ROOM_DEPTH
    ]
);

echo(
    "Caleb room approximate area m2:",
    CALEB_ROOM_AREA_M2
);

echo(
    "Old NE bedroom depth / plan difference:",
    [
        OLD_NE_BEDROOM_DEPTH,
        OLD_NE_BEDROOM_PLAN_DEPTH_DIFFERENCE
    ]
);

echo(
    "Hallway origin / clear size:",
    [
        HALLWAY_X,
        HALLWAY_Y,
        HALLWAY_WIDTH,
        HALLWAY_DEPTH
    ]
);

echo(
    "Playroom corridor origin / clear size:",
    [
        PLAYROOM_CORRIDOR_X,
        PLAYROOM_CORRIDOR_Y,
        PLAYROOM_CORRIDOR_WIDTH,
        PLAYROOM_CORRIDOR_DEPTH
    ]
);

echo(
    "Playroom origin / clear size:",
    [
        PLAYROOM_X,
        PLAYROOM_Y,
        PLAYROOM_WIDTH,
        PLAYROOM_DEPTH
    ]
);

echo(
    "Playroom approximate area m2:",
    PLAYROOM_AREA_M2
);

echo(
    "Pink bathroom origin / clear size:",
    [
        PINK_BATHROOM_X,
        PINK_BATHROOM_Y,
        PINK_BATHROOM_WIDTH,
        PINK_BATHROOM_DEPTH
    ]
);


// ---------------------------------------------------------------------------
// Current extension
// ---------------------------------------------------------------------------

echo(
    "Current extension clear width:",
    EXTENSION_CLEAR_WIDTH
);

echo(
    "Office / tech room floor Z:",
    EXTENSION_SOUTH_ROOMS_FLOOR_Z
);

echo(
    "Office origin / clear size:",
    [
        OFFICE_X,
        OFFICE_Y,
        OFFICE_WIDTH,
        OFFICE_DEPTH
    ]
);

echo(
    "Tech room origin / clear size:",
    [
        TECH_ROOM_X,
        TECH_ROOM_Y,
        TECH_ROOM_WIDTH,
        TECH_ROOM_DEPTH
    ]
);

echo(
    "Hobby room origin / clear size:",
    [
        HOBBY_ROOM_X,
        HOBBY_ROOM_Y,
        HOBBY_ROOM_WIDTH,
        HOBBY_ROOM_DEPTH
    ]
);

echo(
    "Hobby room approximate area m2:",
    HOBBY_ROOM_AREA_M2
);


// ---------------------------------------------------------------------------
// Alrum
// ---------------------------------------------------------------------------

echo(
    "Alrum origin:",
    [
        ALRUM_ROOM_X,
        ALRUM_ROOM_Y
    ]
);

echo(
    "Alrum provisional clear envelope:",
    [
        ALRUM_ROOM_WIDTH,
        ALRUM_ROOM_DEPTH
    ]
);

echo(
    "Alrum provisional north boundary:",
    ALRUM_ROOM_NORTH_Y
);

echo(
    "Alrum north bump (kitchen fridge/freezer alcove):",
    [
        ALRUM_NORTH_BUMP_X,
        ALRUM_NORTH_BUMP_Y,
        ALRUM_NORTH_BUMP_WIDTH,
        ALRUM_NORTH_BUMP_DEPTH
    ]
);

echo(
    "Alrum half-wall:",
    [
        ALRUM_HALF_WALL_X,
        ALRUM_HALF_WALL_Y,
        ALRUM_HALF_WALL_THICKNESS,
        ALRUM_HALF_WALL_LENGTH
    ]
);

echo(
    "Alrum half-wall height — measured:",
    ALRUM_HALF_WALL_HEIGHT
);

echo(
    "Kitchen zone:",
    [
        ALRUM_KITCHEN_X,
        ALRUM_KITCHEN_Y,
        ALRUM_KITCHEN_WIDTH,
        ALRUM_KITCHEN_DEPTH
    ]
);

echo(
    "Gang zone:",
    [
        ALRUM_GANG_X,
        ALRUM_GANG_Y,
        ALRUM_GANG_WIDTH,
        ALRUM_GANG_DEPTH
    ]
);

echo(
    "Gang approximate area m2:",
    ALRUM_GANG_AREA_M2
);

echo(
    "Alrum skylight:",
    [
        ALRUM_SKYLIGHT_X,
        ALRUM_SKYLIGHT_Y,
        ALRUM_SKYLIGHT_WIDTH,
        ALRUM_SKYLIGHT_DEPTH
    ]
);


// ---------------------------------------------------------------------------
// Printable base
// ---------------------------------------------------------------------------

echo(
    "Base underside Z / min thickness:",
    [
        BASE_BOTTOM_Z,
        BASE_MIN_THICKNESS
    ]
);

echo(
    "Output mode / print piece / miniature scale (1:n):",
    [
        OUTPUT_MODE,
        PRINT_PIECE,
        1 / MINIATURE_SCALE
    ]
);

echo(
    "Printed whole-house size mm [x, y, z]:",
    [
        HOUSE_MAX_WIDTH * MINIATURE_SCALE,
        HOUSE_MAX_DEPTH * MINIATURE_SCALE,
        (EXTERIOR_WALL_TOP_Z - BASE_BOTTOM_Z) * MINIATURE_SCALE
    ]
);


// ---------------------------------------------------------------------------
// Hobby room stair
// ---------------------------------------------------------------------------

echo(
    "Hobby stair plan [x, top y, width, run]:",
    [
        HOBBY_STAIR_X,
        HOBBY_STAIR_TOP_Y,
        HOBBY_STAIR_WIDTH,
        HOBBY_STAIR_RUN
    ]
);

echo(
    "Hobby stair steps / rise / going / angle:",
    [
        HOBBY_STAIR_STEPS,
        HOBBY_STAIR_RISE,
        HOBBY_STAIR_GOING,
        HOBBY_STAIR_ANGLE
    ]
);


// ---------------------------------------------------------------------------
// Door schedule
// ---------------------------------------------------------------------------
//
// [name, axis, x, y, size_x, size_y, z, height]
//

for (door = DOORS) {
    echo("Door:", door);
}

for (window = WINDOWS) {
    echo("Window:", window);
}


// ===========================================================================
// House geometry
// ===========================================================================

module house() {

    if (SHOW_FOOTPRINT) {
        house_footprint_preview();
    }


    if (SHOW_BASE) {
        printable_base_3d();
    }


    if (SHOW_ROOMS) {
        rooms_preview(
            height = PREVIEW_ROOM_HEIGHT,
            z = PREVIEW_ROOM_Z
        );
    }


    if (SHOW_EXTERIOR_WALLS) {
        exterior_walls_preview();
    }


    if (SHOW_LEGACY_WALLS) {
        legacy_walls_preview();
    }


    if (SHOW_PARTITION_WALLS) {
        partition_walls_preview();
    }


    if (SHOW_HALF_WALLS) {
        half_walls_preview();
    }


    if (SHOW_SKYLIGHT_MARKERS) {
        feature_markers_preview(
            height = PREVIEW_FEATURE_HEIGHT,
            z = PREVIEW_FEATURE_Z
        );
    }


    if (SHOW_STAIRS) {
        stairs_3d();
    }
}


// ===========================================================================
// Scene
// ===========================================================================

module scene() {
    if (OUTPUT_MODE == "print") {
        print_output_3d(PRINT_PIECE);
    } else {
        house();

        if (SHOW_COORDINATE_AXES) {
            coordinate_axes();
        }
    }
}


// ===========================================================================
// Output
// ===========================================================================
//
// All architectural geometry above remains in real-world millimetres.
//
// Miniature scaling occurs only here.
//
// In print mode the model is also lifted so the base underside sits on the
// print bed (Z = 0). House coordinates themselves are unchanged.
//

OUTPUT_LIFT_Z =
    OUTPUT_MODE == "print"
        ? -BASE_BOTTOM_Z
        : 0;


scale([
    MINIATURE_SCALE,
    MINIATURE_SCALE,
    MINIATURE_SCALE
])
    translate([0, 0, OUTPUT_LIFT_Z])
        scene();