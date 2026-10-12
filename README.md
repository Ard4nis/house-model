# HomeOpenSCAD House Model

Parametric OpenSCAD model of our house for:

- floor-plan planning
- furniture layout
- renovation planning
- speaker, network, and electrical planning
- generating a 1:50 printable miniature

## Project structure

```text
house-model/
├── .devcontainer/
│   ├── host/
│   │   ├── install-font-linux.sh
│   │   ├── install-font-macos.sh
│   │   └── install-font-windows.ps1
│   ├── devcontainer.json
│   ├── devcontainer-lock.json
│   ├── setup-shell.sh
│   └── starship.toml
├── .husky/
│   └── commit-msg
├── .vscode/
│   ├── extensions.json
│   └── settings.json
├── exports/
│   └── .gitkeep
├── src/
│   ├── furniture/
│   │   └── .gitkeep
│   ├── lib/
│   │   └── .gitkeep
│   └── house.scad
├── .gitignore
├── commitlint.config.cjs
├── package.json
├── package-lock.json
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

The npm tooling exists only to support repository development tasks such as Conventional Commit validation. The house model itself is written in OpenSCAD.

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

The main OpenSCAD entry point is:

```text
src/house.scad
```

Open this file in VS Code and use the Carve OpenSCAD preview to view the model.

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

All source dimensions are written in real-world millimetres.

For example:

```scad
room_width = 4000;
room_length = 5000;
wall_height = 2400;
```

This represents a real room measuring:

- 4 metres wide
- 5 metres long
- 2.4 metres high

Printable scale is applied separately.

For example:

```scad
PRINT_SCALE = 1 / 50;
```

A real-world dimension of:

```text
1000 mm
```

therefore becomes:

```text
20 mm
```

in the printed 1:50 model.

Keeping the source geometry at real-world scale allows the same model to be reused for:

- dimensional planning
- floor plans
- furniture placement
- renovation planning
- 3D visualization
- miniature generation

## Source layout

### `src/house.scad`

Main entry point for the complete house model.

### `src/lib/`

Reusable OpenSCAD modules and utilities.

Examples may eventually include:

```text
walls.scad
doors.scad
windows.scad
openings.scad
dimensions.scad
utils.scad
```

### `src/furniture/`

Reusable furniture models.

Examples may eventually include:

```text
beds.scad
tables.scad
seating.scad
storage.scad
kitchen.scad
```

### `exports/`

Generated files are written here.

Possible outputs include:

```text
house-1-50.stl
house-1-50.3mf
floorplan.svg
floorplan.dxf
```

Generated exports are not intended to be treated as source files.

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

## Initial scale

The planned physical house miniature scale is:

```text
1:50
```

At this scale:

| Real size | Model size |
|---:|---:|
| 100 mm | 2 mm |
| 500 mm | 10 mm |
| 1000 mm | 20 mm |
| 2000 mm | 40 mm |
| 5000 mm | 100 mm |

The OpenSCAD source should still use the real-world dimensions.

Scaling should happen only when rendering or exporting the miniature.