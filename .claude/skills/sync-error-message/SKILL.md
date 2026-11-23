---
name: sync-error-message
description: Sync TESSR error messages in arbo-glob (src/i18n/en-error.json) from ClickUp "Error code" tasks, publish them as a new i18n version (version snapshot folder plus changelog entry), then move the changed tasks to "in progress". Use this whenever someone says "update error message", "update error messages", "sync error message" or "sync error messages", or uses the old skill name update-error-message. Also use it when someone asks to add, change, sync or publish error messages, apply a copywriter's copy change, bump the i18n or en-error version, or gives a task ID or link from the ClickUp Error code list (901603957966), even if they don't mention en-error.json. With no task given, it picks up the list's "to do" tasks.
---

# Sync error message

Turn ClickUp "Error code" tasks into changes in `src/i18n/en-error.json`, its version snapshot and the changelog. All the changes from one run go into a single version, with one snapshot and one changelog entry, however many tasks or keys are involved. After the files are edited and checked, move the changed tasks to "in progress" in ClickUp. Make no other ClickUp changes, and don't commit or push: the developer reviews the summary and does those steps.

## Background

- The ClickUp list "Error code" (`901603957966`) is the source of truth. One task holds one message:
  - "Error title" field: the key name for top-level tasks. Most subtasks use the task name instead (see `references/key-mapping.md`).
  - "Error message" field: the approved English wording.
  - "Description", "Module" and "Environment" fields: context only. If the Module field disagrees with the error code, the error code wins.
- Apps load the latest `src/i18n/en-error.json` by branch (`@dev`, `@live`). They look messages up as `<MODULE>.<key>`, and validation rules as `<MODULE>.validation_rules.<rule>`, falling back to `GEN.validation_rules.<rule>`. The error helper fills placeholders such as `{field}`, `{value}`, `{min}` and `{max}` from the API response. A wrong key path or placeholder makes users see a generic message instead.
- Version folders `src/i18n/<X.Y.Z>/` are frozen snapshots for anyone pinning a version. Several tasks are usually bundled into one version and one PR.

## Step 1: Pick the tasks

- If the user gave task IDs or links, use those.
- Otherwise, find the "to do" tasks with `clickup_filter_tasks`, using `list_ids: ["901603957966"]`, `statuses: ["to do"]` and `subtasks: true`. Many messages are subtasks of an error-code task, so keep subtasks on. Results come in pages of about 100: while `has_more` is true, call again with `page` set to `next_page`. Don't use `clickup_search` for this, because it only filters by status group (such as "unstarted"), not by status name.
- The filter results don't include custom fields, so get "Error title" and "Error message" with `clickup_get_task` for each task.
- Show the tasks as a short list (link, Error title, Error message) and ask the user to confirm. Include all of them unless the user drops some. If none are found, say so and stop.

## Step 2: Read each task

Do Steps 2 to 4 for every task before editing anything, so the whole batch is known up front. For each task, collect the following. Read several tasks in parallel.
- The task name, and the "Error title" and "Error message" custom fields.
- The parent task's name: an error code such as `E-0-MRC-1`, or "Custom Error Message".

Which field holds the key name depends on the task: the "Error title" field for top-level tasks, and the task name for most subtasks. `references/key-mapping.md` has the details.

Skip a task, and say why in the summary, if it has no key name or no "Error message".

## Step 3: Work out the key path

Map each task to a key path with the rules in `references/key-mapping.md`. The module code is the third part of the error code (`E-0-MRC-1` gives `MRC`), and the valid codes are in `references/module-codes.md`. Skip the task types that the mapping doc says to skip. For the ones it lists as not fitting a rule, or any task that fits no rule, ask the user instead of guessing, because a wrong path makes users see a generic message.

If the key path already exists in the file, this is an update. Otherwise it is a new key. If the same key name already exists elsewhere in the same module, ask before adding it.

## Step 4: Choose the wording and the action

Before every comparison, trim leading and trailing whitespace, because ClickUp fields often end with a newline. Otherwise compare exactly, so even a trailing period counts as a difference.

Two values are compared:
- **Local:** the value at the key path in `src/i18n/en-error.json` on disk.
- **Baseline:** the value in the baseline branch. Work out the baseline now, as described in Step 5, item 1 (fetch `origin/dev`, or fall back to local `dev`), and read the file with `git show <baseline>:src/i18n/en-error.json`. Step 5 then reuses the same baseline.

1. Pick the target wording.
   - If the "Error message" field differs from local, or the key is missing locally, the target is the field.
     - Exception: if local already equals the new wording of an unresolved copy-change comment, an earlier run applied that comment. The target is then the comment's wording, so the change isn't undone.
   - If the field equals local, read the unresolved comments, plus the threaded replies of any comment that has replies.
     - A copywriter comment that starts with "Copy change requested" gives the new wording after "New (copy from below):". That wording is the target. If a reply revises it, use the latest revision. If there are several such comments, use the newest.
     - For any other unresolved comment that seems to ask for a change, show it to the user and ask instead of guessing.
     - With no unresolved comments, the target is the field.
   - If the target is the field and the task also has unresolved comments, list them in the summary as open questions, because they may ask for something newer.
2. Pick the action by comparing the target with local and baseline:

| Target vs local | Target vs baseline | Action |
| :- | :- | :- |
| Different, or key missing locally | Any | **Update:** edit the file in Step 6, and move the task to "in progress" in Step 8. |
| Same | Different, or key missing in baseline | **Already in this branch:** edit nothing, but still move the task to "in progress" in Step 8. |
| Same | Same | **Already released:** edit nothing and leave the status alone. Flag it in the summary, because a "to do" task that is already released probably has the wrong status. |

Ignore resolved comments, because they are normally already in the field. Copy the chosen wording exactly and don't restyle it.

## Step 5: Work out the version

All the changes go into one version. A branch also keeps that one version, however many times this skill runs on it.

1. Baseline: run `git fetch origin dev` and use `origin/dev`. If the fetch fails, use local `dev` and say so. If the user names a different baseline, use that.
2. List the versions in the baseline with `git ls-tree -d --name-only <baseline> src/i18n/`, and the `X.Y.Z` folders on disk in `src/i18n/`.
3. If exactly one version folder is on disk but not in the baseline, this branch already has its version. Reuse it.
4. If there is none, the new version is the highest baseline version with the patch number bumped. Compare the numbers, not the text: `1.0.10` is higher than `1.0.9`.
5. If there is more than one new folder, stop and ask.

## Step 6: Edit the files

Apply every update in the batch to the latest file first, then make the snapshot and the changelog entry once. If no task needs an update, edit nothing (no new version folder, no changelog bullet), skip Step 7 and go to Step 8, because tasks already in this branch may still need their status moved.

1. `src/i18n/en-error.json`:
   - Update an existing value in place, keeping the key's position.
   - Add a new key at the end of its group. Add a new module group after the last module group, before `custom_default_msg`.
   - Keep the 2-space indentation and the file's existing ending. Change nothing else.
   - Don't remove keys unless a task asks for it, and confirm with the user first.
2. Copy the whole file to `src/i18n/<version>/en-error.json`. Create the folder on the first run, and overwrite the copy on later runs in the same branch. Never touch other version folders.
3. `src/i18n/changelog/README.md`:
   - If the top entry is already this version (from an earlier run on this branch), add bullets to it.
   - Otherwise add a new entry at the top: `## v<version> - <Month D, YYYY>` with today's date, a blank line, the subheading line copied exactly from the newest entry, then the bullets.
   - The entry lists every key changed in the batch. Use one `added` bullet and one `updated` bullet, each naming the full key paths as written in the JSON, separated by commas. For example ``- added `MRC.validation_rules.numeric`, `PT.not_common_member` `` and ``- updated `AS.invalid_otp` ``.
   - Don't fix older entries even if they look wrong (for example, there are two `v1.0.8` headings). Mention it in the summary if it matters.

## Step 7: Check

- The JSON parses. Use python or node if installed. Otherwise use PowerShell: `powershell -NoProfile -c "Get-Content -Raw src/i18n/en-error.json | ConvertFrom-Json | Out-Null"`.
- `cmp src/i18n/en-error.json src/i18n/<version>/en-error.json` shows no difference.
- `git diff <baseline> -- src/i18n/en-error.json` shows only the intended keys.
- `git status --short src/i18n` lists the new version folder. A plain `git diff` doesn't show untracked files.
- Each changed message keeps the placeholders it had before. If they changed, flag it, because the API must send matching values.
- For tasks already in this branch, check that this branch's version folder and changelog entry include their keys. If they don't (for example, the file was edited by hand), flag it in the summary rather than fixing it.

## Step 8: Mark the tasks in progress

Set the status of every task with the action "update" (shown as added or updated in the summary) or "already in this branch" to "in progress". Do this only after the Step 7 checks pass, or straight away when nothing was edited. The status tells the team the change is in a branch.

- Leave these tasks as they are: tasks already released, skipped tasks, tasks still waiting on an answer from the user, and tasks already "in progress".
- If a task is further along (for example "qa ready", "in review", "accepted" or "Closed"), ask the user before moving it back.
- For several tasks, update them in one call with `clickup_execute_operator` (`task.update_many`, after checking its parameters with `clickup_get_operators`). For a single task, use `clickup_update_task`.
- If an update fails, report it in the summary and carry on. The file changes stand.

## Step 9: Summary

Reply with:
- The version, and whether it is new or reused.
- A table: task | key path | action (added, updated, already in this branch or already released) | wording source (field or comment) | old wording, new wording. Write each task as an inline markdown link with the task name as the text, for example `[numeric](https://app.clickup.com/t/14zg7e2kzgc)`.
- Skipped tasks and the reasons, plus any open questions.
- The files changed, and the checks run with their results.
- The tasks moved to "in progress", and any that weren't moved, with the reason.
- Next steps for the developer:
  - Commit and open a PR into `dev`.
  - After the merge, purge the CDN cache for the file, because the Makefile doesn't cover it: `curl https://purge.jsdelivr.net/gh/arbocollab/arbo-glob@dev/src/i18n/en-error.json`. Do the same with `@live` after the live merge.
  - Add the PR link to the ClickUp tasks and move them on (for example to "qa ready") as the team usually does. For tasks whose wording came from a comment, also update the "Error message" field so it matches the file.
