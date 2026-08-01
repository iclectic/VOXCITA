# ADR-0002: Riverpod for State Management

## Status

Accepted

## Context

VoxCita requires state management that supports:

1. Dependency injection for repositories and services
2. Asynchronous state management for database queries, file operations and processing jobs
3. Test overrides for unit and widget tests
4. Granular interface updates so that a transcript update does not rebuild the entire library
5. Explicit provider lifetimes for long-running audio and AI jobs

The application must not combine multiple state-management approaches. The existing React prototype used ad hoc state management with localStorage, which made it difficult to test and reason about state transitions.

## Decision

Use Riverpod with generated providers (`riverpod_annotation` and `riverpod_generator`) as the sole state-management solution.

Riverpod provides:

1. **Dependency injection**: Providers expose repositories and services to widgets and other providers
2. **Asynchronous state management**: `AsyncValue` handles loading, data and error states explicitly
3. **Test overrides**: `ProviderContainer` and `overrideWith` make it straightforward to inject fakes
4. **Granular updates**: Only widgets that watch a specific provider rebuild when that provider changes
5. **Explicit lifetimes**: `autoDispose` and non-autoDispose providers give control over resource cleanup

Do not combine Riverpod with Bloc, Provider or ad hoc global singletons.

## Consequences

**Positive**:
- Single state-management paradigm reduces cognitive load
- Generated providers are type-safe and reduce boilerplate
- Test overrides are clean and compile-time checked
- AsyncValue forces explicit handling of loading and error states
- riverpod_lint catches common mistakes at analysis time

**Negative**:
- Code generation adds a build step (`dart run build_runner build`)
- Learning curve for developers unfamiliar with Riverpod
- Generated files must be excluded from analysis and committed to version control

## Alternatives Considered

1. **Bloc**: Rejected because it introduces a second paradigm and more boilerplate. Bloc's event-driven model is powerful but adds complexity that is not justified for this application's state shape.

2. **Provider**: Rejected because it lacks first-class async support, does not support auto-disposal, and is less type-safe than Riverpod.

3. **Ad hoc ChangeNotifier / setState**: Rejected because it does not scale to shared state across features and is difficult to test.

## References

- [Riverpod documentation](https://riverpod.dev)
- [riverpod_generator package](https://pub.dev/packages/riverpod_generator)
- [riverpod_lint package](https://pub.dev/packages/riverpod_lint)
