# Contributing to VoxCita

Thank you for your interest in contributing to VoxCita. This document describes how to contribute effectively.

## Development Workflow

1. Open an issue describing the change you intend to make
2. Fork the repository and create a branch from `main`
3. Write code and tests for the smallest coherent change
4. Run `dart format .` and ensure it passes
5. Run `flutter analyze --fatal-infos` and fix all issues
6. Run `flutter test` and ensure all tests pass
7. Open a pull request with a clear description

## Code Style

- Use British English in documentation and user-facing text
- Do not use em dashes
- Follow the lint rules defined in `analysis_options.yaml`
- Use single quotes for strings
- Use trailing commas
- Use `const` constructors where possible

## Architecture

VoxCita uses a feature-first modular structure. See [ADR-0001](docs/adr/0001-feature-first-architecture.md) for the full architectural rules.

Key rules:
- Widgets must never call SQLite, the file system, analytics or AI providers directly
- Repositories are the single source of truth
- State management uses Riverpod exclusively
- Long-running processing uses persisted jobs, not widget-owned futures

## Testing

- Write meaningful tests with every feature
- Do not add placeholder tests
- Unit tests cover domain rules and business logic
- Widget tests cover user interactions and accessibility
- Integration tests cover end-to-end flows

## Pull Requests

- Keep pull requests small and focused
- Explain the change, the design choices and the tests
- Include screenshots for UI changes
- Disclose AI assistance honestly
- Demonstrate human review and technical ownership

## Commit Messages

Use semantic commit format:

```
type(scope): description

type: feat, fix, docs, style, refactor, test, chore, build, ci
```

## Code of Conduct

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

## Security

See [SECURITY.md](SECURITY.md) for reporting security vulnerabilities.
