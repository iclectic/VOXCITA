# ADR-0001: Feature-First Architecture and Repository Boundaries

## Status

Accepted

## Context

VoxCita is a mobile application with several distinct feature areas: audio capture, a unified library, transcription, cited insights, Trustworthy Ask, review and settings. Each feature has presentation, application, domain and data concerns.

The application must enforce strict separation between layers. Widgets must never call SQLite directly, call the file system directly, call an analytics provider directly, or call an AI provider directly. Repositories are the single source of truth. Long-running processing must use persisted jobs rather than widget-owned futures.

The existing React prototype mixed concerns at the component level, making it difficult to test business logic independently of the UI. The Flutter implementation must avoid this from the start.

## Decision

Adopt a feature-first modular structure with four boundaries per feature:

```
lib
  app
    bootstrap
    routing
    theme
  core
    audio
    database
    errors
    security
    telemetry
  features
    capture
      application
      data
      domain
      presentation
    library
    transcription
    insights
    trustworthy_ask
    review
    settings
  shared
    utilities
    widgets
```

Architectural rules:

1. Widgets must never call SQLite directly
2. Widgets must never call the file system directly
3. Widgets must never call an analytics provider directly
4. Widgets must never call an AI provider directly
5. Repositories are the single source of truth
6. Mutating commands must expose explicit loading, success and failure states
7. Long-running processing must use persisted jobs rather than widget-owned futures
8. State-provider lifetimes, cancellation and invalidation must be tested
9. Platform-specific code must sit behind Dart interfaces
10. Generated code must be reproducible and checked in CI

## Consequences

**Positive**:
- Features can be developed and tested independently
- Business logic in the domain layer is pure Dart and fast to test
- Repository boundaries make it easy to swap data sources or add fakes for testing
- Clear ownership of concerns reduces the risk of coupling

**Negative**:
- More files and boilerplate compared to a flat structure
- Developers must understand the layer boundaries before contributing
- Some shared utilities may blur the boundary between features

## Alternatives Considered

1. **Layer-first structure** (folders for models, views, controllers): Rejected because it scatters a single feature across many folders, making it harder to understand a feature end to end.

2. **Flat structure**: Rejected because it does not scale beyond a prototype and makes layer enforcement impossible.

3. **Clean Architecture with separate packages per feature**: Considered but rejected for the first release because the overhead of multi-package setup is not justified yet. Can be revisited if the team grows.

## References

- [Feature-First Architecture in Flutter](https://docs.flutter.dev/app-architecture)
- VoxCita Product Brief
