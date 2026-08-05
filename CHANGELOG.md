# Changelog

All notable changes to VoxCita are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-08-05

### Added - Foundation (Phase 0)

- Feature-first modular architecture (presentation, application, domain, data)
- Riverpod state management with code generation
- Drift and SQLite persistence configuration
- go_router navigation with bottom navigation bar
- Light, dark and high-contrast themes
- Strict static analysis with `flutter_lints`
- CI workflow for formatting, analysis, tests and Android build
- Architecture Decision Records (ADR-0001, ADR-0002, ADR-0003)
- Product brief and threat model
- Contributing guidelines, code of conduct, security policy

### Added - Database and Repositories (Phase 1)

- Drift schema for notes, audio assets, recording sessions, transcript segments, transcript revisions, insight claims, claim sources, collections, note collections, tags, note tags, processing jobs, model runs, user feedback, schema migrations
- Repository implementations for notes, tags, collections, transcripts, insights, audio assets
- Database migration strategy with versioned schema migrations
- Fake data seeder for development and testing

### Added - Audio Capture (Phase 2)

- Resilient audio recording with `record` package
- Real-time waveform display during recording
- Durable file-system audio storage with SHA-256 integrity hashing
- Recording session state machine (idle, recording, paused, stopped, completed, error)
- Automatic recovery from interrupted recordings
- Recording session persistence to database

### Added - Library (Phase 3)

- Unified library screen with voice and text notes
- Full-text search across note titles and bodies
- Collections for organising notes
- Tags with colour-coded display
- Note detail screen with transcript and insights
- Note editor for text notes
- Accessible interface with semantic labels and tooltips

### Added - Encrypted Archive (Phase 4)

- Encrypted archive export using AES-256
- Archive restoration from encrypted backup files
- Platform authentication via biometric lock (local_auth)
- Secure key storage in platform keystore

### Added - Transcription (Phase 5)

- Timestamped transcription contract with segment-level granularity
- First transcription adapter integration
- Transcript detail screen with segment editing
- Benchmark harness for transcription accuracy measurement
- Processing job tracking with progress and status

### Added - Transcript Correction (Phase 6)

- Transcript segment correction with revision history
- Original recognition result preservation
- Diff view between original and corrected text
- Revision timestamp tracking

### Added - Cited Insights (Phase 7)

- Insight claim generation (summary, decision, action, question, idea)
- Claim sources linking insights to transcript segments and audio timestamps
- Citation validator service for verifying source references
- Evidence timeline widget for visualising validated citations
- Source Tap: tap a citation to play the original audio segment
- Source Check: verification states (verified, corrected, unsupported, needs review)
- Audio player service with seek-to-segment functionality
- Insights list screen with filter chips by verification state
- Review screen for needs-review insights with quick actions

### Added - Trustworthy Ask (Phase 8)

- AskResultType enum (answered, abstained, noSources)
- AskAnswerService for composing cited answers with inline [1][2] references
- Relevance scoring with token coverage and phrase match bonus
- Abstention logic: system refuses to answer when evidence is insufficient
- Confidence scoring with configurable threshold
- Source Tap audio playback from ask source cards
- Ask history persistence with Drift database table
- Trustworthy Ask screen with confidence badge, inline citations, and source cards
- Bottom navigation bar entry for Trustworthy Ask

### Added - Analytics and Feedback (Phase 9)

- User feedback system (helpful, not helpful, incorrect, suggestion) on insight claims
- Feedback entity, repository, and controller with per-claim feedback
- Privacy-preserving analytics: all metrics computed locally on device
- Analytics dashboard in settings showing content, transcript, insight, ask and feedback counts
- Total interactions summary metric
- Beta hardening: loading states, error handling, and empty state checks across screens

### Technical

- 198 passing tests across unit and widget tests
- Zero analysis issues with `flutter analyze --fatal-infos`
- Consistent code formatting with `dart format`
- Drift schema version 2 with migration support
