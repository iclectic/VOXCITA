# VoxCita

> Every insight has a source.

A private, local-first voice thinking companion for developers, community organisers, speakers, researchers and independent professionals.

VoxCita converts spoken ideas, permitted conversations, meetup discussions, interviews, talk rehearsals and personal reflections into timestamped transcripts, summaries, decisions, questions, ideas and action items. Every generated insight links to the precise transcript segments and audio timestamps that support it.

## The Problem

People who think aloud through voice recordings struggle to retrieve specific insights without replaying entire recordings. Existing AI note-taking applications produce summaries that cannot be verified. Users read a summary but cannot trace it to the source audio. If the summary is wrong, there is no way to find the error.

## The Product Thesis

VoxCita is built on a single principle: **every insight has a source**.

- Every claim links to specific transcript segments with timestamps
- A user can tap a citation (Source Tap) to hear the original audio
- Claims without valid sources are marked unverified or rejected
- The system abstains when the source material does not contain enough information
- The distinction between AI-generated, user-corrected and user-verified information is preserved

## Current Status

**Version 0.1.0** - Beta ready

All core features are implemented and tested:

- **Audio capture**: Resilient recording with real-time waveform, durable file storage, and recovery from interruptions
- **Library**: Unified note management with full-text search, collections, tags, and accessible interface
- **Encrypted archive**: AES-256 encrypted export and restoration with platform biometric authentication
- **Transcription**: Timestamped transcription with segment-level editing and revision history
- **Cited insights**: AI-generated summaries, decisions, actions, questions and ideas with source citations, validation, and Source Tap audio playback
- **Trustworthy Ask**: Cited answers with inline references, confidence scoring, and abstention when evidence is insufficient
- **Analytics**: Privacy-preserving local metrics (no data leaves the device)
- **User feedback**: Per-insight feedback with helpful/not helpful/incorrect/suggestion types

198 passing tests. Zero analysis issues.

## Features

### Audio Capture
- Resilient recording with real-time waveform display
- Durable file-system storage with SHA-256 integrity hashing
- Automatic recovery from interrupted recordings
- Recording session persistence

### Library
- Unified voice and text note management
- Full-text search across titles and bodies
- Collections and tags for organisation
- Note detail view with transcript and insights
- Accessible interface with semantic labels

### Transcription
- Timestamped transcription with segment-level granularity
- Transcript correction with revision history
- Original recognition result preservation
- Processing job tracking with progress

### Cited Insights
- Insight types: summary, decision, action, question, idea
- Every claim links to transcript segments and audio timestamps
- Citation validator verifies source references
- Source Tap: tap a citation to play the original audio
- Verification states: verified, corrected, unsupported, needs review
- Evidence timeline visualisation

### Trustworthy Ask
- Ask questions across selected recordings
- Cited answers with inline [1][2] references
- Confidence scoring with configurable threshold
- Abstention when evidence is insufficient
- Source Tap audio playback from source cards
- Ask history persistence

### Privacy and Analytics
- Local-first: all processing happens on device
- No telemetry, no cloud required
- Privacy-preserving analytics dashboard
- User feedback on insights (stays on device)
- Biometric lock for app access

## Architecture

VoxCita uses a feature-first modular structure with strict layer boundaries.

```
lib
  app           Bootstrap, routing, theme
  core          Audio, database, errors, security
  features      capture, library, transcription, insights,
                trustworthy_ask, review, feedback, analytics,
                settings
  shared        Utilities, widgets
```

**Architectural rules:**

1. Widgets must never call SQLite directly
2. Widgets must never call the file system directly
3. Widgets must never call an analytics provider directly
4. Widgets must never call an AI provider directly
5. Repositories are the single source of truth
6. Mutating commands expose explicit loading, success and failure states
7. Long-running processing uses persisted jobs, not widget-owned futures

See [Architecture Decision Records](docs/adr/) for detailed rationale.

## Privacy Position

- **Local-first**: Core recording, storage, organisation, search and playback work without an account or internet connection
- **No covert recording**: VoxCita must not contain hidden recording functionality
- **No data selling**: VoxCita must not sell recording data
- **No advertising**: VoxCita must not contain advertising
- **Consent before upload**: Explicit consent is required before sending material to a network provider
- **Processing receipts**: The app displays what was transmitted, which provider received it and when
- **Privacy-preserving analytics**: Note text, transcripts, prompts, audio, filenames and titles are never transmitted

See the [Threat Model](docs/security/threat-model.md) for the full security analysis.

## Development

### Prerequisites

- Flutter 3.41.0 or later
- Dart 3.11.0 or later
- Android Studio or Xcode for platform builds

### Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### Running the app

```bash
flutter run
```

### Code generation

After changing providers, database schema or other generated code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

For watch mode during development:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### Formatting

```bash
dart format .
```

### Static analysis

```bash
flutter analyze
```

### Tests

```bash
flutter test
```

## Implementation Roadmap

| Phase | Description | Status |
|-------|-------------|--------|
| 0 | Foundation: architecture, CI, ADRs, skeleton | Complete |
| 1 | Drift schema, repositories, migrations, fake data | Complete |
| 2 | Resilient audio capture, durable files, real waveform, recovery | Complete |
| 3 | Unified library, search, collections, tags, accessible interface | Complete |
| 4 | Encrypted archive export, restoration, platform authentication | Complete |
| 5 | Timestamped transcription contract, first adapter, benchmark harness | Complete |
| 6 | Transcript correction and revision history | Complete |
| 7 | Cited Insights, citation validation, Source Check, Source Tap | Complete |
| 8 | Trustworthy Ask with cited answers and abstention | Complete |
| 9 | Privacy-preserving analytics, user feedback, beta hardening | Complete |
| 10 | Release automation, store readiness, public documentation | Complete |

## Releasing

Releases are automated via GitHub Actions. To create a new release:

```bash
# Update version in pubspec.yaml
# Update CHANGELOG.md
# Commit and tag

git tag v0.x.x

git push origin v0.x.x
```

The release workflow will:
1. Run format, analysis and tests
2. Build Android APKs (per-ABI split)
3. Build iOS IPA
4. Create a GitHub Release with all build artifacts

For local release builds:

```bash
make release    # Run checks and build Android APK
make android    # Build Android APK only
make ios        # Build iOS only
```

See [CHANGELOG.md](CHANGELOG.md) for version history.

## Documentation

- [Product Brief](docs/product/product-brief.md)
- [Threat Model](docs/security/threat-model.md)
- [ADR-0001: Feature-First Architecture](docs/adr/0001-feature-first-architecture.md)
- [ADR-0002: Riverpod State Management](docs/adr/0002-riverpod-state-management.md)
- [ADR-0003: Drift and File-System Audio Storage](docs/adr/0003-drift-and-file-storage.md)
- [Store Listing Metadata](docs/product/store-listing.md)
- [Changelog](CHANGELOG.md)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Code of Conduct

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

## Security

See [SECURITY.md](SECURITY.md).

## Licence

MIT Licence. See [LICENSE](LICENSE).

## Founder

Ibim Braide

## AI Assistance Disclosure

Parts of this project were developed with AI assistance. All code has been reviewed, tested and is maintained under human technical ownership. Architecture decisions, product direction and engineering judgement are made by the founder.
