// House model
// All dimensions are real-world millimetres.

PRINT_SCALE = 1 / 50;

module test_room() {
    cube([4000, 5000, 2400]);
}

// For now, just verify preview works.
scale([PRINT_SCALE, PRINT_SCALE, PRINT_SCALE])
    test_room();