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

**Phase 0: Foundation**

This repository contains the Flutter project skeleton with:

- Feature-first modular architecture (presentation, application, domain, data)
- Riverpod state management with code generation
- Drift and SQLite persistence configuration
- go_router navigation with bottom navigation
- Light, dark and high-contrast themes
- Strict static analysis
- CI for formatting, analysis and tests
- Architecture Decision Records
- Product brief and threat model

Recording, transcription and AI functionality will be added in subsequent phases.

## Architecture

VoxCita uses a feature-first modular structure with strict layer boundaries.

```
lib
  app           Bootstrap, routing, theme
  core          Audio, database, errors, security, telemetry
  features      capture, library, transcription, insights,
                trustworthy_ask, review, settings
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
| 0 | Foundation: architecture, CI, ADRs, skeleton | In progress |
| 1 | Drift schema, repositories, migrations, fake data | Pending |
| 2 | Resilient audio capture, durable files, real waveform, recovery | Pending |
| 3 | Unified library, search, collections, tags, accessible interface | Pending |
| 4 | Encrypted archive export, restoration, platform authentication | Pending |
| 5 | Timestamped transcription contract, first adapter, benchmark harness | Pending |
| 6 | Transcript correction and revision history | Pending |
| 7 | Cited Insights, citation validation, Source Check, Source Tap | Pending |
| 8 | Trustworthy Ask with cited answers and abstention | Pending |
| 9 | Privacy-preserving analytics, user feedback, beta hardening | Pending |
| 10 | Release automation, store readiness, public documentation | Pending |

## Documentation

- [Product Brief](docs/product/product-brief.md)
- [Threat Model](docs/security/threat-model.md)
- [ADR-0001: Feature-First Architecture](docs/adr/0001-feature-first-architecture.md)
- [ADR-0002: Riverpod State Management](docs/adr/0002-riverpod-state-management.md)
- [ADR-0003: Drift and File-System Audio Storage](docs/adr/0003-drift-and-file-storage.md)

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
