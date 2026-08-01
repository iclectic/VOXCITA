# VoxCita Product Brief

## Problem

People who think aloud through voice recordings, including developers, community organisers, speakers, researchers and independent professionals, struggle to retrieve specific insights from their own recordings without replaying them in full.

Existing voice-note applications treat transcription and summarisation as opaque processes. A user reads a summary but cannot verify where it came from. If the summary is wrong, the user has no way to trace the error to the source audio. If the transcription contains an error, correcting it destroys the original recognition result.

The result is a trust gap. Users cannot rely on AI-generated notes because they cannot audit them.

## Product Thesis

VoxCita is a private, local-first voice thinking companion built on a single principle:

**Every insight has a source.**

Every generated summary point, decision, action, question, idea and answer must link to the precise transcript segments and audio timestamps that support it. A user can select a source citation and hear the original words from the recording. If the system cannot find sufficient supporting evidence, it must abstain or mark the output as unverified.

## Primary Users

- Developers who capture ideas while coding or walking
- Community organisers who record planning discussions with permission
- Speakers who rehearse talks and want feedback on structure
- Researchers who conduct interviews and need reliable extraction
- Independent professionals who think aloud and need structured output

## Key Differentiator

Source-linked intelligence. Unlike ordinary AI note-taking applications, VoxCita:

1. Links every claim to specific transcript segments with timestamps
2. Plays the original audio when a user taps a citation (Source Tap)
3. Rejects claims that reference unknown or invalid transcript segments
4. Preserves the distinction between AI-generated, user-corrected and user-verified information
5. Abstains when the source material does not contain enough information

## Processing Modes

1. **Device Only**: Audio, transcripts and insights remain on the device
2. **Bring Your Own Provider**: The user supplies credentials and explicitly consents to what is transmitted
3. **Optional Managed Service**: Not built until there is a lawful, secure and user-supported reason

The first public beta supports device-only storage.

## Non-Goals

- Medical, clinical or care-home documentation
- Hidden or automatic call recording
- Team administration platform
- Public social network or marketplace
- Chatbot that answers without sources
- Flutter web or desktop versions
- Payments, subscriptions, advertising or donations

## Current Status

Phase 0: Project foundation, architecture skeleton, documentation and CI. No recording, transcription or AI functionality yet.

## Brand Language

| Term | Meaning |
|------|---------|
| VoxCita | The product name |
| Cited Insight | A summary, decision, action, question or idea connected to supporting transcript sources |
| Source Tap | The interaction that plays the audio supporting a Cited Insight |
| Evidence Map | The timeline or visual structure connecting recordings, transcript segments and Cited Insights |
| Trustworthy Ask | The question-answering mode that answers only from selected recordings with timestamp citations |
| Source Check | The user action for verifying, correcting or rejecting a generated claim |
| Original Record | The immutable, finalised audio file and its integrity hash |
