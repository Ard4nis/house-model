/*
 * Print configuration, print pieces and dovetail joints
 *
 * Scale is chosen from the printed thickness of a standard 100 mm
 * partition, the thinnest wall in the house.
 *
 * The house is printed in four pieces, split along the centre lines of the
 * three 400 mm legacy (former exterior) walls, i.e. along the house's own
 * construction phases:
 *
 *   south_block     Hailey, Stue
 *   north_block     Nova, green bathroom, master bedroom, krea, Bryggers,
 *                   Alrum
 *   addition_2013   Caleb, hallway, pink bathroom, playroom (+ corridor)
 *   extension       office, tech room, hobby room
 *
 * plus the hobby room stair as a fifth, separate piece, printed on its
 * side so its open underside needs no supports.
 *
 * Each legacy wall keeps 200 mm (4 mm printed at 1:50) on either side of
 * its seam.
 *
 * Pieces are joined by dovetails in the base, hidden under a thin skin of
 * floor. Joint sizes are in PRINTED mm because fit depends on the printer,
 * not on the house.
 *
 * Must be included after dimensions.scad, walls.scad, base.scad and
 * features.scad.
 */


// ===========================================================================
// Scale
// ===========================================================================

// Printed thickness of a standard 100 mm partition, in mm.
PRINT_PARTITION_THICKNESS = 2;


// 2 mm / 100 mm = 1:50.
MINIATURE_SCALE =
    PRINT_PARTITION_THICKNESS
    / WALL_PARTITION;


// Converts printed mm to real (model) mm.
function print_mm(mm) =
    mm / MINIATURE_SCALE;


// ===========================================================================
// Printer
// ===========================================================================

// Approximate usable build volume, in printed mm.
PRINT_BED_SIZE = [250, 250, 250];


// ===========================================================================
// Dovetail joints (printed mm)
// ===========================================================================

// Narrow end, at the seam.
PRINT_JOINT_NECK_WIDTH = 6;

// Wide end, inside the socket piece.
PRINT_JOINT_HEAD_WIDTH = 9;

// How far the tab reaches into the socket piece.
PRINT_JOINT_DEPTH = 6;

// Gap per side between tab and socket.
PRINT_JOINT_CLEARANCE = 0.2;

// Floor material left above the joint so it is hidden from above.
PRINT_JOINT_TOP_SKIN = 1;

// Tabs per seam, spread evenly along its interior length.
PRINT_JOINTS_PER_SEAM = 3;


// ===========================================================================
// Stair locating nub and pocket (printed mm)
// ===========================================================================
//
// The separately printed stair has a nub under its foot that drops into a
// matching pocket in the hobby room floor, locating it against the east
// wall. Glue on the east face and the foot.
//

// Nub height below the stair foot.
PRINT_STAIR_NUB_HEIGHT = 0.4;

// Nub inset from the edges of the foot contact strip.
PRINT_STAIR_NUB_INSET = 0.5;


// ===========================================================================
// Floor engraving (printed mm)
// ===========================================================================

// Depth of plan markers (e.g. the Alrum skylight) cut into the floor.
// 0.4 mm = two 0.2 mm layers.
PRINT_ENGRAVE_DEPTH = 0.4;


// ===========================================================================
// Seams (real mm)
// ===========================================================================

// Centre line of the legacy south wall.
PRINT_SEAM_SOUTH_Y =
    LEGACY_SOUTH_WALL_Y
    + WALL_LEGACY_EXTERIOR / 2;


// Centre line of the 2013 legacy wall.
PRINT_SEAM_2013_X =
    LEGACY_2013_EAST_WALL_X
    + WALL_LEGACY_EXTERIOR / 2;


// Centre line of the current-extension legacy wall.
PRINT_SEAM_EXTENSION_X =
    LEGACY_CURRENT_EXTENSION_WALL_X
    + WALL_LEGACY_EXTERIOR / 2;


// ---------------------------------------------------------------------------
// Cut positions
// ---------------------------------------------------------------------------
//
// Where a seam runs exactly along a wall height step (the legacy south
// wall steps 2500 -> 2200 at its centre line; the extension legacy wall
// steps down to the office ceiling at its centre line), the step's riser
// face would lie ON the cut plane and leave a zero-thickness face in the
// neighbouring piece (non-manifold).
//
// Those cuts are moved by PRINT_CUT_EPSILON towards the lower side so each
// riser lies inside one piece. 1 mm real = 0.02 mm printed.
//

PRINT_CUT_EPSILON = 1;


PRINT_CUT_SOUTH_Y =
    PRINT_SEAM_SOUTH_Y
    + PRINT_CUT_EPSILON;


PRINT_CUT_2013_X =
    PRINT_SEAM_2013_X;


PRINT_CUT_EXTENSION_X =
    PRINT_SEAM_EXTENSION_X
    + PRINT_CUT_EPSILON;


// Seam record:
//
//   [name, start, end, normal, tab_piece, socket_piece, floor_z]
//
//   start, end  interior span along the seam where tabs may go
//   normal      unit vector pointing from the tab piece into the socket piece
//   floor_z     lowest finished floor on either side of the seam
//
PRINT_SEAMS = [
    [
        "south block / north block",
        [WALL_EXTERIOR,                    PRINT_SEAM_SOUTH_Y],
        [SOUTH_BLOCK_WIDTH - WALL_EXTERIOR, PRINT_SEAM_SOUTH_Y],
        [0, 1],
        "south_block",
        "north_block",
        MAIN_FLOOR_Z
    ],
    [
        "north block / 2013 addition",
        [PRINT_SEAM_2013_X, NORTH_BLOCK_SOUTH_Y + WALL_EXTERIOR],
        [PRINT_SEAM_2013_X, HOUSE_NORTH_INTERIOR_Y],
        [-1, 0],
        "addition_2013",
        "north_block",
        MAIN_FLOOR_Z
    ],
    [
        "2013 addition / extension",
        [PRINT_SEAM_EXTENSION_X, NORTH_BLOCK_SOUTH_Y + WALL_EXTERIOR],
        [PRINT_SEAM_EXTENSION_X, HOUSE_NORTH_INTERIOR_Y],
        [-1, 0],
        "extension",
        "addition_2013",
        EAST_EXTENSION_FLOOR_Z
    ]
];


PRINT_PIECES = [
    "south_block",
    "north_block",
    "addition_2013",
    "extension",
    "stair"
];


// ===========================================================================
// Piece regions (plan, real mm)
// ===========================================================================

// Generous margin so regions fully contain the footprint edges.
PRINT_REGION_MARGIN = 1000;


module print_piece_region_2d(piece) {
    m = PRINT_REGION_MARGIN;

    module south_block() {
        translate([-m, -m])
            square([
                SOUTH_BLOCK_WIDTH + m,
                PRINT_CUT_SOUTH_Y + m
            ]);
    }

    if (piece == "south_block") {
        south_block();
    } else if (piece == "north_block") {
        difference() {
            translate([-m, -m])
                square([
                    PRINT_CUT_2013_X + m,
                    HOUSE_MAX_DEPTH + 2 * m
                ]);

            south_block();
        }
    } else if (piece == "addition_2013") {
        translate([PRINT_CUT_2013_X, -m])
            square([
                PRINT_CUT_EXTENSION_X - PRINT_CUT_2013_X,
                HOUSE_MAX_DEPTH + 2 * m
            ]);
    } else if (piece == "extension") {
        translate([PRINT_CUT_EXTENSION_X, -m])
            square([
                HOUSE_MAX_WIDTH - PRINT_CUT_EXTENSION_X + m,
                HOUSE_MAX_DEPTH + 2 * m
            ]);
    }
}


// Clipped to the footprint in 2D first: this drops zero-area slivers where
// a raw region edge runs along the outside face of the house (e.g. the
// south block's east wall), which would otherwise leave degenerate faces
// and make the piece non-manifold.
module print_piece_region_3d(piece) {
    translate([0, 0, BASE_BOTTOM_Z - 1])
        linear_extrude(height = WALL_EXTRUDE_TOP_Z - BASE_BOTTOM_Z + 2)
            intersection() {
                print_piece_region_2d(piece);

                house_footprint_2d();
            }
}


// ===========================================================================
// Dovetails
// ===========================================================================

// Dovetail in local seam coordinates: u along the seam, v into the socket
// piece. grow > 0 enlarges it (used for sockets).
module print_dovetail_local_2d(grow = 0) {
    neck = print_mm(PRINT_JOINT_NECK_WIDTH);
    head = print_mm(PRINT_JOINT_HEAD_WIDTH);
    depth = print_mm(PRINT_JOINT_DEPTH);

    // Overlap back into the tab piece so the tab fuses to it, comfortably
    // more than PRINT_CUT_EPSILON.
    overlap = print_mm(0.1);

    offset(delta = grow)
        polygon([
            [-neck / 2, -overlap],
            [ neck / 2, -overlap],
            [ head / 2,  depth],
            [-head / 2,  depth]
        ]);
}


// Positions of the tabs along a seam (evenly spaced, away from the ends).
function print_seam_joint_points(seam) =
    let(
        a = seam[1],
        b = seam[2],
        n = PRINT_JOINTS_PER_SEAM
    )
    [
        for (i = [1 : n])
            a + (b - a) * (i / (n + 1))
    ];


// One seam's dovetails as plan shapes.
module print_seam_dovetails_2d(seam, grow = 0) {
    normal = seam[3];

    // Local +v (i.e. +Y) is rotated onto the seam normal.
    angle = atan2(normal[1], normal[0]) - 90;

    for (p = print_seam_joint_points(seam)) {
        translate(p)
            rotate(angle)
                print_dovetail_local_2d(grow = grow);
    }
}


// Top of the joint: just below the lowest floor at the seam.
function print_seam_joint_top_z(seam) =
    seam[6]
    - print_mm(PRINT_JOINT_TOP_SKIN);


module print_seam_tabs_3d(seam) {
    translate([0, 0, BASE_BOTTOM_Z])
        linear_extrude(height = print_seam_joint_top_z(seam) - BASE_BOTTOM_Z)
            print_seam_dovetails_2d(seam);
}


module print_seam_sockets_3d(seam) {
    clearance = print_mm(PRINT_JOINT_CLEARANCE);

    translate([0, 0, BASE_BOTTOM_Z - 1])
        linear_extrude(
            height = print_seam_joint_top_z(seam)
                + clearance
                - BASE_BOTTOM_Z
                + 1
        )
            print_seam_dovetails_2d(seam, grow = clearance);
}


// ===========================================================================
// Printable geometry
// ===========================================================================

// ---------------------------------------------------------------------------
// Stair nub / pocket
// ---------------------------------------------------------------------------

module print_stair_nub_2d(grow = 0) {
    offset(delta = grow - print_mm(PRINT_STAIR_NUB_INSET))
        hobby_room_stair_foot_contact_2d();
}


// Added to the stair print only.
module print_stair_nub_3d() {
    h = print_mm(PRINT_STAIR_NUB_HEIGHT);

    // Small overlap up into the stair so the nub fuses to it.
    translate([0, 0, HOBBY_STAIR_BOTTOM_Z - h])
        linear_extrude(height = h + 1)
            print_stair_nub_2d();
}


// Cut from the extension floor.
module print_stair_pocket_3d() {
    c = print_mm(PRINT_JOINT_CLEARANCE);
    h = print_mm(PRINT_STAIR_NUB_HEIGHT);

    translate([0, 0, HOBBY_STAIR_BOTTOM_Z - h - c])
        linear_extrude(height = h + c + 1)
            print_stair_nub_2d(grow = c);
}


// Base with plan markers engraved into the floor surface.
module printable_floor_3d() {
    difference() {
        printable_base_3d();

        floor_engravings_3d(
            depth = print_mm(PRINT_ENGRAVE_DEPTH)
        );
    }
}


// Solid architecture of the house pieces. No room slabs, raised markers,
// helpers, or stairs (the stair is its own piece).
module house_print_parts_3d() {
    printable_floor_3d();

    exterior_walls_preview();

    legacy_walls_preview();

    partition_walls_preview();

    half_walls_preview();
}


// Pieces in house coordinates (assembled position).
module print_piece_3d(piece) {
    if (piece == "stair") {
        stairs_3d();

        print_stair_nub_3d();
    } else if (piece == "extension") {
        difference() {
            print_house_piece_3d(piece);

            print_stair_pocket_3d();
        }
    } else {
        print_house_piece_3d(piece);
    }
}


module print_house_piece_3d(piece) {
    difference() {
        union() {
            intersection() {
                house_print_parts_3d();

                print_piece_region_3d(piece);
            }

            for (seam = PRINT_SEAMS) {
                if (seam[4] == piece) {
                    print_seam_tabs_3d(seam);
                }
            }
        }

        for (seam = PRINT_SEAMS) {
            if (seam[5] == piece) {
                print_seam_sockets_3d(seam);
            }
        }
    }
}


// The stair laid on its side: its width (house X) becomes height, so the
// stepped side profile sits flat on the bed and the open underside needs no
// supports. The nub ends up as a thin rib along one edge.
module print_stair_on_side_3d() {
    rotate([0, -90, 0])
        translate([
            -HOBBY_STAIR_X,
            -HOBBY_STAIR_TOP_Y,
            -HOBBY_STAIR_BOTTOM_Z
        ])
            print_piece_3d("stair");
}


// Final print output, placed on the bed (Z = 0).
//
//   "all"    every piece in its assembled position (assembly check)
//   "stair"  the stair on its side
//   other    one house piece in its assembled position
//
module print_output_3d(piece = "all") {
    if (piece == "stair") {
        print_stair_on_side_3d();
    } else {
        translate([0, 0, -BASE_BOTTOM_Z]) {
            if (piece == "all") {
                for (p = PRINT_PIECES) {
                    print_piece_3d(p);
                }
            } else {
                print_piece_3d(piece);
            }
        }
    }
}
