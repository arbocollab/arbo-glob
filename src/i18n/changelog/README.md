# Changelog

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
