# Changelog

## v1.0.13 - November 24, 2026

### 🔧 Details
- added `AS.mfa_required_by_workspace` ([E-0-AS-9](https://app.clickup.com/t/14zg7e2npm0)), `AS.app_mfa_enabled` ([E-0-AS-10](https://app.clickup.com/t/14zg7e2npmz)), `AS.email_setup_not_started` ([E-0-AS-11](https://app.clickup.com/t/14zg7e2npn0)) for the personal MFA choice ([CU-14zg7e2mdtw](https://app.clickup.com/t/14zg7e2mdtw))
- added `NAS.invalid_sync_key` ([E-0-NAS-1](https://app.clickup.com/t/14zg7e2nqpx)), `NAS.folder_not_linked` ([E-0-NAS-2](https://app.clickup.com/t/14zg7e2nqpy)), `NAS.scene_not_found` ([E-0-NAS-3](https://app.clickup.com/t/14zg7e2nqpz)), `NAS.scene_name_not_unique` ([E-0-NAS-4](https://app.clickup.com/t/14zg7e2nqq0)), `NAS.status_change_not_allowed` ([E-0-NAS-5](https://app.clickup.com/t/14zg7e2nqq1))
- added fallback titles `NAS.folder_not_linked_fallback`, `NAS.scene_not_found_fallback`, `NAS.scene_name_not_unique_fallback`, `NAS.scene_in_two_folders_fallback` (shown when the workspace level names are missing)
- added `NAS.scene_in_two_folders` ([E-0-NAS-8](https://app.clickup.com/t/14zg7e2nz7g)), `NAS.same_file_in_two_folders` ([E-0-NAS-9](https://app.clickup.com/t/14zg7e2nz7h))
- added `NAS.sync_failed` ([E-0-NAS-10](https://app.clickup.com/t/14zg7e2p992))
- added `NAS.folder_outside_shares` ([E-0-NAS-11](https://app.clickup.com/t/14zg7e2p9cj))
- added `GEN.validation_rules.no_repeated_password_pattern` for the password repeat check ([CU-14zg7e2pam6](https://app.clickup.com/t/14zg7e2pam6))
- added `AS.owned_workspaces_have_members` ([E-0-AS-12](https://app.clickup.com/t/14zg7e2p8qw))
- updated `GEN.validation_rules.integer`, `GEN.validation_rules.numeric`, `MRC.validation_rules.numeric`

## v1.0.12 - November 17, 2026

### 🔧 Details
- added `BLN.limit_reached`, `BLN.unavailable`, `GEN.confirmation_required`

## v1.0.11 - November 6, 2026

### 🔧 Details
- renamed keys to lower case so they match the key dev-api sends: `TM.no_entity_to_undeploy` ([E-0-TM-1](https://app.clickup.com/t/86d10kncm)), `TM.no_team_editor_role` ([E-0-TM-2](https://app.clickup.com/t/86d10m7ea)), `DIR.no_edit_entity_team_access` ([E-0-DIR-2](https://app.clickup.com/t/86d12nef9))

## v1.0.10 - November 4, 2026

### 🔧 Details
- updated `GEN.validation_rules.max`, `GEN.validation_rules.max_file_size`, `MDA.delete_last_review_file`
- added `GEN.validation_rules.file_corrupted`, `AS.password_change_required`

## v1.0.9 - October 27, 2026

### 🔧 Details
- added `MRC.validation_rules.numeric`

## v1.0.8 - October 27, 2026

### 🔧 Details
- updated `validation_rules.not_breached_password`, `validation_rules.no_context_words_in_password`, `validation_rules.no_password_pattern`

## v1.0.7 - October 23, 2026

### 🔧 Details
- added `pt.not_common_member`, `validation_rules.not_breached_password`, `validation_rules.no_context_words_in_password`, `validation_rules.no_password_pattern`

## v1.0.6 - October 20, 2026

### 🔧 Details
- update `mrc.validation_rules.between` to support `{min}` and `{max}`

## v1.0.5 - October 16, 2026

### 🔧 Details
- multiple copy change request
- added `mrc.invalid_value`, `as.invalid_otp` and `as.too_many_attempts`

## v1.0.4 - August 26, 2026

### 🔧 Details
- update TESSR Review module error message
- added `ws.insufficient_ws_storage` error message

## v1.0.3 - August 14, 2026

### 🔧 Details
- update account setting module error message

## v1.0.2 - August 12, 2026

### 🔧 Details
- update general message

## v1.0.1 - May 11, 2026

### 🔧 Details
- sync error messages from CU

## v1.0.0 - May 5, 2026

### 🎉 Initial Release
First stable release of error translation file

### ✨ Features
- Serve the error translation file based on i18n structure
