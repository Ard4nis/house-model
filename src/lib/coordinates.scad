/*
 * Coordinate-system helpers
 *
 * House coordinate system:
 *
 *   +X = East
 *   +Y = North
 *   +Z = Up
 *
 * Origin:
 *
 *   [0, 0, 0] is the south-west exterior corner of the main house
 *   footprint at finished-floor level.
 *
 * Units:
 *
 *   All source dimensions are real-world millimetres.
 *
 * Positioning convention:
 *
 *   Unless a module explicitly documents otherwise, rectangular objects
 *   are positioned from their south-west-bottom corner.
 *
 * Notes:
 *
 *   The coordinate axes below are preview/development geometry only.
 *
 *   Colors are retained for renderers that support them, but the current
 *   VS Code preview pipeline exports through STL, which does not preserve
 *   color. The E / N / U labels therefore exist as real geometry so that
 *   the axes remain identifiable in monochrome previews.
 */


// ---------------------------------------------------------------------------
// Coordinate axes
//
// Preview helper only.
//
// E = +X / East
// N = +Y / North
// U = +Z / Up
//
// Default length is 2000 mm in source space, which becomes 40 mm at 1:50.
// ---------------------------------------------------------------------------

module coordinate_axes(
    length = 2000,
    shaft_radius = 35,
    head_length = 250,
    head_radius = 110,
    label_size = 240,
    label_height = 40,
    label_offset = 120,
    origin_radius = 90
) {
    shaft_length = length - head_length;


    // -----------------------------------------------------------------------
    // Origin
    // -----------------------------------------------------------------------

    color("white")
        sphere(
            r = origin_radius,
            $fn = 32
        );


    // -----------------------------------------------------------------------
    // +X / East
    // -----------------------------------------------------------------------

    color("red") {
        // Shaft
        rotate([0, 90, 0])
            cylinder(
                h = shaft_length,
                r = shaft_radius,
                $fn = 24
            );

        // Arrow head
        translate([shaft_length, 0, 0])
            rotate([0, 90, 0])
                cylinder(
                    h = head_length,
                    r1 = head_radius,
                    r2 = 0,
                    $fn = 32
                );

        // Label
        translate([
            length + label_offset,
            0,
            0
        ])
            linear_extrude(height = label_height)
                text(
                    "E",
                    size = label_size,
                    halign = "left",
                    valign = "center"
                );
    }


    // -----------------------------------------------------------------------
    // +Y / North
    // -----------------------------------------------------------------------

    color("green") {
        // Shaft
        rotate([-90, 0, 0])
            cylinder(
                h = shaft_length,
                r = shaft_radius,
                $fn = 24
            );

        // Arrow head
        translate([0, shaft_length, 0])
            rotate([-90, 0, 0])
                cylinder(
                    h = head_length,
                    r1 = head_radius,
                    r2 = 0,
                    $fn = 32
                );

        // Label
        translate([
            0,
            length + label_offset,
            0
        ])
            linear_extrude(height = label_height)
                text(
                    "N",
                    size = label_size,
                    halign = "center",
                    valign = "bottom"
                );
    }


    // -----------------------------------------------------------------------
    // +Z / Up
    // -----------------------------------------------------------------------

    color("blue") {
        // Shaft
        cylinder(
            h = shaft_length,
            r = shaft_radius,
            $fn = 24
        );

        // Arrow head
        translate([0, 0, shaft_length])
            cylinder(
                h = head_length,
                r1 = head_radius,
                r2 = 0,
                $fn = 32
            );

        // Vertical label.
        //
        // Text is created in the XY plane and rotated into the XZ plane so
        // the label remains visible when viewing the model obliquely.
        translate([
            label_offset,
            0,
            length
        ])
            rotate([90, 0, 0])
                linear_extrude(height = label_height)
                    text(
                        "U",
                        size = label_size,
                        halign = "left",
                        valign = "center"
                    );
    }
}