// Re-trigger the OpenSCAD preview when an included file changes.
//
// The VS Code preview extension (thijsdaniels.vscode-openscad-preview) only
// watches the file being previewed, not its includes. This watcher touches
// the entry file whenever any other .scad file under src/ changes.
//
// Usage: npm run preview:watch

import { watch, utimesSync } from "node:fs";
import { join, resolve } from "node:path";

const SRC_DIR = resolve(import.meta.dirname, "..", "src");
const ENTRY_FILE = join(SRC_DIR, "house.scad");
const DEBOUNCE_MS = 200;

let timer;

watch(SRC_DIR, { recursive: true }, (_event, filename) => {
    if (!filename?.endsWith(".scad")) return;
    if (join(SRC_DIR, filename) === ENTRY_FILE) return;

    clearTimeout(timer);
    timer = setTimeout(() => {
        const now = new Date();
        utimesSync(ENTRY_FILE, now, now);
        console.log(`${now.toLocaleTimeString()}  ${filename} -> re-render`);
    }, DEBOUNCE_MS);
});

console.log(`Watching ${SRC_DIR} for .scad changes...`);
