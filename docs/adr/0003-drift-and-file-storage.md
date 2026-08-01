# ADR-0003: Drift and File-System Audio Storage

## Status

Accepted

## Context

VoxCita needs durable, queryable storage for structured data (notes, transcripts, insights, tags, collections, processing jobs) and file-system storage for audio files, waveform data, exports and downloadable models.

The existing React prototype stored everything as loosely typed JSON in browser localStorage. Audio used temporary browser object URLs that were not preserved after restart. This caused data loss and made queries impossible.

Requirements for the Flutter implementation:

1. Structured data must be queryable (full-text search, filtering, relationships)
2. Audio files must survive application restarts and common interruptions
3. Large audio files must not be stored as database blobs
4. Schema changes must be migrated and tested
5. UUIDs for identifiers, UTC timestamps, foreign keys and indexes

## Decision

Use **Drift** with **SQLite** for structured data. Store audio, waveform information, exports and downloadable models in application-managed file storage.

### Database

Drift provides:

1. Type-safe queries with compile-time checking
2. Schema versioning and migration support
3. Transactions for atomic operations
4. Stream-based reactive queries

Minimum tables:

1. `notes`
2. `audio_assets`
3. `recording_sessions`
4. `transcript_segments`
5. `transcript_revisions`
6. `insight_claims`
7. `claim_sources`
8. `collections`
9. `note_collections`
10. `tags`
11. `note_tags`
12. `processing_jobs`
13. `model_runs`
14. `user_feedback`
15. `schema_migrations`

Conventions:
- UUID identifiers
- UTC timestamps
- Foreign keys enabled
- Appropriate indexes on search and filter columns
- Explicit schema versions
- Tested database migrations with a migration for every released schema change

### File System

Audio files are stored in the application's documents directory using a structured path layout. The database stores relative paths and integrity hashes, not file contents.

The Original Record is immutable after finalisation. Edited or compressed copies are stored as derived assets.

## Consequences

**Positive**:
- Type-safe database access reduces runtime errors
- SQLite is reliable, well-understood and available on both Android and iOS
- File-system storage for audio avoids bloating the database
- Drift migrations are testable from every released schema version
- Reactive queries enable efficient UI updates

**Negative**:
- Code generation adds a build step (`dart run build_runner build`)
- Orphan-file cleanup must be handled explicitly when database records are deleted
- File-system paths must be managed carefully to avoid path traversal in backup restoration

## Alternatives Considered

1. **Hive / Isar**: Rejected because they are NoSQL and lack the relational query capabilities needed for citation validation and cross-recording search.

2. **sqflite (raw SQLite)**: Rejected because it lacks type safety and migration tooling compared to Drift.

3. **Realm**: Rejected because of licensing concerns and less mature Flutter support.

4. **Storing audio as database blobs**: Rejected because it degrades database performance and makes backups inefficient.

## References

- [Drift documentation](https://drift.simonbinder.eu)
- [sqlite3_flutter_libs package](https://pub.dev/packages/sqlite3_flutter_libs)
- [path_provider package](https://pub.dev/packages/path_provider)
