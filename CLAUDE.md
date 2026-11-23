# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

`arbocollab/arbo-glob` holds shared static assets for the TESSR front-end apps. It has no package manager, build step, linter, test suite or CI. Apps load the files at runtime straight from GitHub through jsDelivr, by branch:

- `https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@dev/<path>`
- `https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@live/<path>`

A change reaches apps only after it is merged and pushed. `dev` is the default branch and PR target. `live` is production and is updated by merging `dev` into `live`.

## Assets

| Asset | Edit this file | Apps load | Version line |
| :- | :- | :- | :- |
| Runtime config | `.env.json` | `.env.json` | not versioned |
| Design tokens | `src/style/tessr.css` | `dist/tessr.css`, `dist/tessr.styl` | 3.x |
| App-loader global CSS | `src/app-loader-style/app-loader-global-style.css` | `dist/app-loader-global-style.css` | 1.0.x |
| Error messages (i18n) | `src/i18n/en-error.json` | `src/i18n/...` (no `dist/` copy) | 1.0.x |

Each versioned asset uses the same layout: a latest file in `src/<area>/`, a full snapshot per version in `src/<area>/<X.Y.Z>/` (no `v` prefix), and a changelog at `src/<area>/changelog/README.md`. Old snapshots never change, so apps that pin a version path keep working.

## Publishing a change to a versioned asset

Nothing automates this, so do every step:

1. Edit the latest file in `src/<area>/`.
2. Copy it in full to a new folder `src/<area>/<next version>/`. Bump the patch version unless told otherwise. Each asset has its own version counter.
3. For CSS assets, copy the latest file over the matching `dist/` file too.
4. Add an entry at the top of the changelog: `## vX.Y.Z - <Month D, YYYY>`, then the same subheading and bullet style as the previous entry.
5. Check the copies match, for example `cmp src/i18n/en-error.json src/i18n/<ver>/en-error.json` (and the `dist/` copy for CSS).

Reference commits: `13c1500` (i18n 1.0.9, 3 files) and `35d3f0b` (app-loader CSS 1.0.5, 4 files).

## i18n error messages

- English only (`en-error.json`). There are no other locales. Earlier changes were synced from ClickUp, which is likely the source of truth (unverified).
- Top-level keys are uppercase module codes (`GEN`, `MRC`, `WS`, `PT`, `PPL`, `TM`, `DIR`, `DAR`, `AS`, `BLN`, `MDA`), plus lowercase `custom_default_msg` and `fallback`. Nested keys are mostly snake_case, with a few UPPER_SNAKE ones. Match the neighbouring keys.
- Placeholders use single braces: `{field}`, `{value}`, `{min}`, `{max}`.
- JSON uses 2-space indentation.
- `src/i18n/changelog/README.md` has two `v1.0.8` headings. The top one is really the 1.0.9 change.

## Commands

There is nothing to build, lint or test. The only commands:

- `make purge-dev`, `make purge-live`, `make purge-all`: purge the jsDelivr cache after a merge, otherwise apps keep getting the cached copy. Needs `make` and bash (Git Bash on Windows). The file list includes two files that no longer exist (`dist/tessr.scss`, `dist/notificationFirebaseConstant.js`) and no `src/i18n/` paths.
- Converters in `src/util/` (bash, LF line endings, run `chmod +x *.sh` first):
  - `./scss-converter.sh in.scss [out.css]`: SCSS variables to CSS custom properties under `:root`.
  - `./stylus-converter.sh in.scss [out.styl]`
  - `./css-stylus-converter.sh in.css [out.styl]`
  - `src/util/README.md` wrongly describes `scss-converter.sh` as CSS to Stylus.

## Branches and commits

- Branch names: `<clickup-task-id>_<snake_case_description>`, for example `14zg7e2kh2b_app_loader_stylesheet_1.0.5`. Some branches have no id, such as `i18n-1.0.10`.
- Commit messages are free-form. Recent publish commits look like `publish_i18n-1.0.9` or `update-app-loader-stylesheet-1.0.5 - <detail>`.

## Things to watch

- `.env.json` is committed and shared by every app, so a key change affects all of them. Never put real tokens in it (`WEB_SEARCH.DEV_TOKEN` stays empty).
- `dist/tessr.styl` is stale (still 3.0.0 content). Styles are at 3.0.2, and the 3.0.1 and 3.0.2 folders have no `.styl`. Use `css-stylus-converter.sh` if a fresh Stylus copy is needed.
- The structure tree in the root `README.md` is out of date.
