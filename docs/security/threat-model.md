# VoxCita Threat Model

## Scope

This threat model covers the VoxCita mobile application during development and the first public beta. It identifies threats to user data confidentiality, integrity and availability, and defines mandatory controls.

## Assets

1. Audio recordings (the Original Record and derived copies)
2. Transcript segments and revision history
3. Cited Insights and claim-to-source relationships
4. User notes, tags, collections and metadata
5. Provider credentials (when Bring Your Own Provider is used)
6. Backup archives
7. Processing job state and model run history

## Threats

### T1: Another person opens an unlocked device

An unauthorised person picks up an unlocked device and browses private recordings and transcripts.

**Severity**: High
**Controls**:
- Biometric or device-credential lock
- Sensitive content hidden behind authentication
- Automatic re-lock after a configurable period

### T2: A device backup exposes files

Cloud or local device backups contain unencrypted VoxCita audio and database files.

**Severity**: High
**Controls**:
- Encrypt sensitive local data using a key protected by the platform keystore where practical
- Document backup behaviour in the privacy policy
- Set iOS `NSFileProtectionComplete` where supported
- Use Android `EncryptedSharedPreferences` or equivalent for key material

### T3: A malicious archive attempts path traversal

A crafted backup archive contains paths like `../../sensitive_file` to overwrite application or system files during restoration.

**Severity**: High
**Controls**:
- Validate every manifest entry path before extraction
- Reject absolute paths and paths containing `..`
- Restore into a temporary location first
- Commit only after every validation check passes

### T4: Logs capture transcript information

Debug or crash logs contain transcript text, note titles, prompts or file paths.

**Severity**: Medium
**Controls**:
- Never log transcript text, note content, prompts, audio data or private file paths
- Use a redaction layer for any diagnostic output
- Review logging in CI

### T5: Analytics capture private content

Analytics events contain note text, transcript fragments or audio metadata.

**Severity**: High
**Controls**:
- Track only privacy-preserving event names and counts
- Never transmit note text, transcript text, prompts, audio, filenames or user-entered titles
- Document the full analytics schema publicly

### T6: A remote provider retains sensitive audio or text

A transcription or AI provider retains uploaded audio or text after processing.

**Severity**: High
**Controls**:
- Obtain explicit consent before sending material to a network provider
- Display a processing receipt showing what was transmitted, which provider received it and when
- Document provider retention policies where known
- Prefer on-device processing where practical

### T7: A user shares an export accidentally

A user exports an archive and shares it unintentionally, exposing private recordings.

**Severity**: Medium
**Controls**:
- Encrypt backup archives
- Display a clear warning before export
- Include export metadata (date, device, version) in the archive

### T8: A corrupted recording destroys the only copy

A recording file becomes corrupted, and no backup or copy exists.

**Severity**: High
**Controls**:
- Write audio to a temporary file first, then move atomically to final location
- Calculate and verify SHA-256 file hash
- Detect abandoned recording sessions on launch
- Offer recovery or deletion for abandoned sessions
- Keep the Original Record immutable after finalisation

### T9: A failed migration destroys data

A database schema migration fails partway through, leaving the database in an inconsistent state.

**Severity**: High
**Controls**:
- Use Drift migration transactions
- Test migrations from every released schema version
- Back up the database before applying a migration where practical

### T10: An incomplete restore changes the live database

A restore operation writes partial data into the live database, then fails.

**Severity**: High
**Controls**:
- Restore into a temporary location first
- Validate every manifest entry, file size, relative path and integrity hash
- Show the user a preview containing note, recording and transcript counts
- Commit the restoration only after every validation check passes
- Roll back completely on any validation failure

## Mandatory Controls Summary

1. Use platform authentication, not a home-grown plaintext passcode
2. Store provider credentials in platform secure storage
3. Store wrapped encryption keys in platform secure storage
4. Encrypt sensitive local data using a key protected by the platform keystore where practical
5. Never include titles, transcripts, prompts, audio, credentials or private file paths in telemetry
6. Obtain explicit consent before sending material to a network provider
7. Display a processing receipt showing what was transmitted, which provider received it and when
8. Validate archive manifests, sizes, hashes and paths before restoration
9. Complete deletion must remove database records, derived files, cached exports and generated outputs
10. Publish a readable privacy policy
11. Publish a technical data-flow document
12. Ensure security claims match the implementation

## Important Distinctions

- An application lock is not encryption
- Local-first does not automatically mean encrypted or private
- On-device processing does not automatically mean no data leaves the device
