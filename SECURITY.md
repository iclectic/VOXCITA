# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 0.1.x   | Yes       |

## Reporting a Vulnerability

If you discover a security vulnerability in VoxCita, please report it responsibly:

1. Do not open a public issue
2. Email the repository owner directly
3. Include a description of the vulnerability and steps to reproduce
4. Allow reasonable time for a response before any public disclosure

## Security Principles

1. Use platform authentication rather than a home-grown plaintext passcode
2. Store provider credentials in platform secure storage
3. Store wrapped encryption keys in platform secure storage
4. Encrypt sensitive local data using a key protected by the platform keystore where practical
5. Never include titles, transcripts, prompts, audio, credentials or private file paths in telemetry
6. Obtain explicit consent before sending material to a network provider
7. Display a processing receipt showing what was transmitted, which provider received it and when
8. Validate archive manifests, sizes, hashes and paths before restoration
9. Complete deletion must remove database records, derived files, cached exports and generated outputs
10. Security claims must match the implementation

## Important Distinctions

- An application lock is not encryption
- Local-first does not automatically mean encrypted or private
- On-device processing does not automatically mean no data leaves the device

## Threat Model

See [docs/security/threat-model.md](docs/security/threat-model.md) for the full threat model.
