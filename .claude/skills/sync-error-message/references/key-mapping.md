# ClickUp to en-error.json key mapping

This doc explains how a task in the ClickUp "Error code" list (`901603957966`) maps to a key path in `src/i18n/en-error.json`. The rules were checked against all 133 tasks in the list on November 4, 2026.

## Which field holds the key

- **Top-level tasks:** use the "Error title" field.
- **Subtasks:** use the task name. Most subtasks have no "Error title" field, and when they do, it equals the name. The exception is the "Custom Error Message" subtasks (rule 4).
- Never use the "Message title" field. It is sometimes lowercase or has a prefix (for example `no_entity_to_undeploy` or `gen.locked`), so it doesn't match the JSON.
- Don't use the number in the error code or the "HTTP Response" field. `E-0-GEN-401` maps by its Error title `unauthenticated`, not by 401.
- Copy the key exactly as written, because case matters. `TM.NO_ENTITY_TO_UNDEPLOY` is uppercase in both ClickUp and the JSON.

The module code is the third part of the error code: `E-0-MRC-1` gives `MRC`. See `module-codes.md` for the list of codes.

## Rules

| # | ClickUp | Local key path | Example |
| :- | :- | :- | :- |
| 1 | Top-level error-code task `E-0-<MOD>-<n>` | `<MOD>.<Error title>` | [E-0-AS-1](https://app.clickup.com/t/86d2jfnc8), Error title `tnc_not_accepted`, gives `AS.tnc_not_accepted` |
| 2 | Subtask of `E-0-GEN-422` | `GEN.validation_rules.<subtask name>` | [required](https://app.clickup.com/t/86d1fmuaj) gives `GEN.validation_rules.required` |
| 3 | Validation-rule subtask of another error-code parent (today only `E-0-MRC-1`) | `<MOD>.validation_rules.<subtask name>` | [numeric](https://app.clickup.com/t/14zg7e2kzgc) under `E-0-MRC-1` gives `MRC.validation_rules.numeric` |
| 4 | Subtask of "Custom Error Message" | `custom_default_msg.<Error title>`. The Error title is already `<group>.<key>`. | [[network] network_problem](https://app.clickup.com/t/86d2xxk40), Error title `network.network_problem`, gives `custom_default_msg.network.network_problem` |
| 5 | Subtask of "Fallback" | `fallback.<subtask name>` | [unknownError](https://app.clickup.com/t/86d2xxpx0) gives `fallback.unknownError` |

Parents that have subtasks still have their own key under rule 1. `E-0-GEN-422` (Error title `validation_error`) gives `GEN.validation_error`, and `E-0-MRC-1` (Error title `invalid_value`) gives `MRC.invalid_value`. "Custom Error Message" and "Fallback" only group their subtasks and have no message of their own.

A module rule under rule 3 can share its name with a GEN rule, for example `MRC.validation_rules.numeric` and `GEN.validation_rules.numeric`. This is intended: the app tries the module rule first and falls back to the GEN one.

## Tasks that don't fit a rule (ask the user)

| ClickUp | Why |
| :- | :- |
| Subtasks of `E-0-GEN-400` (`file_corrupted`, `query_exception`, `relation_not_found`) | They aren't validation rules, and none of them is in the JSON today. Rule 2 or 3 would give the wrong path. |
| `E-1-...` tasks, for example [E-1-GEN-403](https://app.clickup.com/t/86d4ajb1t) | They map to the same key as the matching `E-0-` task (`GEN.unauthorized`), but with different wording. What `E-1` means is unknown. |
| Tasks with Environment "Frontend" outside "Custom Error Message", for example [E-0-GEN-408](https://app.clickup.com/t/86d1bkhdx) | `GEN.network_problem` isn't in the JSON. The same message is at `custom_default_msg.network.network_problem`. |

## Tasks to skip

- `R2-*` and `FFMPEG-*` tasks (Environment "Automation").
- [Error 444](https://app.clickup.com/t/86d40xq8v) (Environment "Server").

These are not app error messages and have no key in the JSON. Two of the R2 and FFMPEG tasks were read; the rest are inferred to be the same.

## Known gaps (as of November 4, 2026)

- `GEN.validation_rules.decimal` has no ClickUp task.
- Some ClickUp "Error message" fields differ from the JSON wording, for example `E-0-TM-1`, `E-0-TM-2`, `unique`, `email` and `regex`. `thumbnail_size_limit` uses `{max}` in ClickUp but `{value}` in the JSON. Not every key was compared. These only change when a task for them is processed.
