# Spike: Audio Capture Package Selection

## Objective

Select a Flutter package or native plugin approach for reliable, durable audio recording with real waveform amplitude sampling on Android and iOS.

## Background

VoxCita's core capability is voice capture. The existing React prototype used the browser MediaRecorder API with temporary object URLs that were not preserved after restart. The Flutter implementation must write durable audio files, capture genuine waveform samples, handle interruptions and produce integrity hashes.

The recorder must support: start, pause, resume, stop, cancel, checkpoint persistence, real microphone amplitude, safe encoder flush, SHA-256 hashing, atomic file move and session recovery.

## Method

1. Survey existing Flutter audio packages: `record`, `flutter_sound`, `audio_recorder`, `mic_stream`
2. Evaluate each against the VoxCita requirements
3. Build a minimal proof-of-concept with the top candidate
4. Test on a low-range Android device and a mid-range Android device
5. Test pause, resume, stop and cancel
6. Test interruption by incoming call
7. Test application backgrounding
8. Measure waveform amplitude accuracy against a known tone

## Success Criteria

- Package supports pause and resume on both Android and iOS
- Package provides real microphone amplitude (not random animation)
- Package writes to a file path we control (not only a temporary cache)
- Package handles permission denial gracefully
- Package is actively maintained with a compatible licence
- Proof-of-concept recording survives an application restart

## Timebox

1 week (Week 6 of the delivery plan)

## Findings

To be filled in after the spike.

## Recommendation

To be filled in after the spike.
