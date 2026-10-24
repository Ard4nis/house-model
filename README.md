# HomeOpenSCAD House Model

Parametric OpenSCAD model of our house, used for:

- floor-plan and furniture planning
- renovation planning
- speaker, network and electrical planning
- a printable miniature (1:50, printed in pieces)

The model is a **floor-plan / dollhouse-style cutaway**: floors, walls, doors,
windows, stairs, level changes and fixed features. It is deliberately **not** a
full building model, so there are no roof, rafters, ceilings or structural detail.

The upper floor (Hems) is planned as a **separate model**. The hobby room stair
shows where the two connect.

## Project structure

```text
house-model/
├── .devcontainer/            Dev Container (Debian Bookworm, native OpenSCAD)
├── .husky/                   commitlint hook
├── .vscode/
│   ├── extensions.json
│   ├── settings.json         native OpenSCAD preview, STL format
│   └── tasks.json            starts the preview watcher on folder open
├── exports/                  generated STL files (not source)
├── scripts/
│   └── preview-watch.mjs     re-renders the preview when an included file changes
├── src/
│   ├── house.scad            entry point: configuration, diagnostics, output
│   ├── lib/
│   │   └── coordinates.scad  coordinate-axes helper
│   ├── furniture/            (planned)
│   └── house/
│       ├── dimensions.scad   all measurements and derived layout values
│       ├── footprint.scad    current exterior footprint
│       ├── walls.scad        exterior, legacy, partition and half walls, real heights
│       ├── doors.scad        door schedule and openings
│       ├── windows.scad      window schedule and openings
│       ├── base.scad         printable floor slab with floor-level steps
│       ├── rooms.scad        room aggregator
│       ├── rooms/            one file per room (clear floor area only)
│       ├── features.scad     feature aggregator
│       ├── features/
│       │   ├── skylights.scad  skylight plan marker and floor engraving
│       │   └── stairs.scad     hobby room stair to the Hems
│       └── print.scad        scale, print pieces and dovetail joints
├── commitlint.config.cjs
├── package.json
└── README.md
```

## Development

The project is intended to be opened in VS Code using the included Dev Container.

The container provides:

- Debian Bookworm
- zsh
- Oh My Zsh
- Starship
- Node.js 24
- Husky
- commitlint
- the VS Code extensions used for OpenSCAD development

On container creation, `npm ci` installs the development tooling defined in `package-lock.json`, and `.devcontainer/setup-shell.sh` configures the interactive shell.

The npm tooling exists only to support repository development tasks: Conventional Commit validation and the preview watcher (`npm run preview:watch`). The house model itself is written in OpenSCAD.

### Shell

The interactive development shell uses:

```text
zsh
  └── Oh My Zsh
        └── Starship
```

Oh My Zsh provides shell functionality and plugins.

Starship owns the prompt.

The Starship configuration is stored in:

```text
.devcontainer/starship.toml
```

The shell setup creates:

```text
~/.config/starship.toml
```

as a symbolic link to the repository-controlled configuration.

### Nerd Font

The Starship prompt uses Nerd Font glyphs.

VS Code is configured to use:

```text
MesloLGS NF
```

The font must be installed on the host operating system because the VS Code terminal is rendered by the host rather than by the Dev Container.

Host installers are provided for macOS, Windows and Linux.

#### macOS

```bash
bash .devcontainer/host/install-font-macos.sh
```

#### Windows

Run from PowerShell:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .devcontainer\host\install-font-windows.ps1
```

#### Linux

```bash
bash .devcontainer/host/install-font-linux.sh
```

After installing the font, restart VS Code.

Inside the Dev Container, run:

```text
font-check
```

to display the glyphs used by the prompt and visually verify that the Nerd Font is rendering correctly.

### Transient prompt

The active shell displays the full segmented Starship prompt.

After a command is submitted, completed prompts collapse to a minimal prompt character to keep terminal history compact while retaining the full prompt for the active command line.

### OpenSCAD preview

The entry point is `src/house.scad`. The model is previewed with the
**native** OpenSCAD CLI through the `thijsdaniels.vscode-openscad-preview`
extension (`openscad.previewFormat` = `stl`). The native CLI resolves the
modular `include <...>` files correctly.

Two things to know:

- **STL has no colours.** Anything that must stay visible in the preview (axes
  labels, markers) is real geometry.
- **The preview only watches `src/house.scad`, not its includes.**
  `scripts/preview-watch.mjs` touches `house.scad` whenever another `.scad`
  file under `src/` changes, so edits to e.g. `dimensions.scad` re-render too.
  It starts automatically through `.vscode/tasks.json` once VS Code is allowed
  to run automatic tasks, or manually:

  ```bash
  npm run preview:watch
  ```

The container ships Debian's OpenSCAD **2021.01**, so the code avoids newer
language features.

## Coordinate system

The model uses a fixed Cartesian coordinate system based on the real-world orientation of the house.

```text
                     North
                      +Y
                       ↑
                       │
                       │
       West  ←──────── O ────────→  East
        -X           [0,0]          +X
                       │
                       │
                       ↓
                     South

                      +Z
                      ↑
                      Up
```

The origin `[0, 0, 0]` is the south-west exterior corner of the main house footprint at finished-floor level.

The axis conventions are:

| Axis | Direction |
|---|---|
| `+X` | East |
| `-X` | West |
| `+Y` | North |
| `-Y` | South |
| `+Z` | Up |
| `-Z` | Below finished-floor level |

`Z = 0` always represents finished-floor level.

Geometry below the finished floor, such as floor construction, joists, foundations, or other structural elements, may therefore use negative Z coordinates.

Unless a module explicitly documents otherwise, rectangular objects are positioned using their south-west-bottom corner as their local origin.

### Development axes

The development scene can display coordinate reference axes:

- red = `+X` / East
- green = `+Y` / North
- blue = `+Z` / Up

These axes are development helpers and are not part of the house geometry.

## Modelling conventions

### Units, scale and levels

- All source geometry is in **real-world millimetres at 1:1**.
- Scaling happens **only** at the output boundary in `src/house.scad`.
- `Z = 0` is the **main-house finished floor**. Other floors are relative to it:

| Area | Finished floor Z |
|---|---:|
| Main house and 2013 addition | 0 |
| Current extension: office and tech room | −240 |
| Current extension: hobby room | −300 |

### Measurement status

Every value in `dimensions.scad` (and the door/window schedules) is labelled:

| Label | Meaning |
|---|---|
| `MEASURED` | measured in the house (often "approx.") |
| `PLAN` | taken from the historical floor plan, which is marked as approximate |
| `DERIVED` | calculated from other values and wall thicknesses |
| `PROVISIONAL` | a deliberate working assumption, to be replaced when measured |

When real-world knowledge and the old plan disagree, the real world wins.

### Walls

Walls are shared construction, so they live in `walls.scad`, not in rooms:

| Class | Thickness | Notes |
|---|---:|---|
| `WALL_EXTERIOR` | 400 | generated from the footprint |
| `WALL_LEGACY_EXTERIOR` | 400 | former exterior walls left inside the house by later additions |
| `WALL_PARTITION` | 100 | ordinary internal walls |
| half-wall | 100 | Alrum / kitchen, 1200 high |

The legacy walls record the house's construction history:

```text
original house + southern block
        ↓  legacy south wall      (y ≈ 5100)
2013 eastern addition
        ↓  legacy 2013 wall       (x ≈ 11760)
current 4 m extension (≈ 300 mm lower)
        ↓  legacy extension wall  (x ≈ 16740)
```

Wall heights are real. They come from **height regions**, each with a floor and
ceiling level, and walls between two regions step at their centre line:

- main house and 2013 addition: 2200
- south block: slopes from 2200 at the south wall to 2500 at the legacy wall
- hobby room: 2500 above its floor; office and tech room: 2300 above theirs
- **exterior walls** all share one top level (2500, the top of the south block
  slope), except where they follow that slope

### Rooms

Room modules describe **clear usable floor area** only. They are semantic: they
do not own walls and are not used to build the printed floor. Semantic zones
inside a room, such as Alrum's kitchen, gang and fridge alcove, are kept the same way.

### Doors and windows

`doors.scad` and `windows.scad` hold schedules of opening records:

```text
[name, axis, x, y, size_x, size_y, z, height]
```

Openings are subtracted from the 3D walls. Door sizes are **frame** sizes, the
hole in the wall (standard 900 × 2100). Positions are expressed as measured gaps
from a named wall or corner.

### Features

- **Skylights** are plan markers, not roof openings. In the print they are
  engraved into the floor.
- **Stairs** are physical geometry. The hobby room stair has an open underside
  (storage).

## Printing

### Scale

The scale is chosen from the printed thickness of a standard 100 mm partition,
the thinnest wall:

```scad
PRINT_PARTITION_THICKNESS = 2;   // mm  →  MINIATURE_SCALE = 1:50
```

| Real size | Printed at 1:50 |
|---:|---:|
| 100 mm partition | 2 mm |
| 400 mm exterior wall | 8 mm |
| 1000 mm | 20 mm |
| whole house 21.1 × 13.0 m | 423 × 260 mm |

### Pieces

The whole house does not fit a 250 × 250 mm bed, so it is printed in pieces
split along the centre lines of the three legacy walls. Each side keeps half
the wall (4 mm):

| Piece | Rooms | Printed size |
|---|---|---|
| `south_block` | Hailey, Stue | 198 × 112 × 60 mm |
| `north_block` | Nova, green bathroom, master bedroom, viktualierum/krea, Bryggers, Alrum | 239 × 158 × 60 mm |
| `addition_2013` | Caleb, hallway, pink bathroom, playroom | 106 × 158 × 60 mm |
| `extension` | office, tech room, hobby room | 90 × 158 × 60 mm |
| `stair` | hobby room stair, printed on its side | 50 × 56 × 20 mm |

The base is one continuous slab under the footprint. Its top is each finished
floor and its underside is flat (200 mm below the lowest floor). Pieces are
joined by **dovetails in the base**, hidden under 1 mm of floor. Joint sizes are
set in printed millimetres in `print.scad`:

| Setting | Default |
|---|---:|
| `PRINT_JOINT_NECK_WIDTH` | 6 mm |
| `PRINT_JOINT_HEAD_WIDTH` | 9 mm |
| `PRINT_JOINT_DEPTH` | 6 mm |
| `PRINT_JOINT_CLEARANCE` (per side) | 0.2 mm |
| `PRINT_JOINTS_PER_SEAM` | 3 |

### Exporting

In `src/house.scad`, `OUTPUT_MODE = "print"` outputs printable solids only, and
`PRINT_PIECE` selects a piece (`"all"` shows every piece assembled for
checking). Each piece is placed on the bed at Z = 0.

Export every piece:

```bash
for p in south_block north_block addition_2013 extension stair; do openscad -D 'OUTPUT_MODE="print"' -D "PRINT_PIECE=\"$p\"" -o "exports/house-1-50-$p.stl" src/house.scad; done
```

Tips:

- Print a small piece (e.g. `extension`) first to check the dovetail fit, and
  adjust `PRINT_JOINT_CLEARANCE` if needed.
- `north_block` leaves only about 5 mm per side on a 250 mm bed. Skip the brim,
  or rotate the piece slightly.
- The stair has a 0.4 mm nub under its foot that drops into a matching pocket
  in the hobby room floor, which puts it in the right spot against the east wall.
  Glue it along the east-wall face and the foot (CA / superglue works well).

## Git

The primary branch is:

```text
mother
```

The project follows the Conventional Commits specification.

Commit messages are validated locally using Husky and commitlint.

### Examples

```text
feat(house): add ground floor outline
feat(living-room): add south wall
feat(furniture): add dining table
fix(kitchen): correct east wall length
refactor(lib): extract reusable wall module
docs(readme): document modelling conventions
chore(repo): update development tooling
```

Breaking changes can be expressed using `!`:

```text
refactor(walls)!: change wall coordinate convention
```

or with a `BREAKING CHANGE` footer:

```text
refactor(walls): change wall coordinate convention

Walls now use their inner face as the coordinate origin.

BREAKING CHANGE: existing wall coordinates must be migrated.
```
