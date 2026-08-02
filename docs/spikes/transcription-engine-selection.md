# Spike: Transcription Engine Selection

## Objective

Select a transcription approach and package for timestamped, cancellable speech-to-text with model lifecycle management on Android and iOS.

## Background

VoxCita requires timestamped transcript segments with start time, end time, recognised text, detected language, confidence where available and model provenance. The transcription engine must be provider-neutral, cancellable and provide structured progress.

The brief requires investigating on-device transcription using whisper.cpp or another properly licensed runtime before selecting a package.

## Method

1. Survey existing Flutter transcription packages and native bindings
2. Evaluate whisper.cpp bindings for Android and iOS
3. Evaluate cloud provider options (OpenAI Whisper API, Google Speech-to-Text, Azure) for the Bring Your Own Provider mode
4. Build a minimal proof-of-concept with the top on-device candidate
5. Measure on a consented, non-sensitive benchmark set:
   - Accuracy (word error rate)
   - Timestamp alignment error
   - Processing time per audio minute
   - Peak memory usage
   - Battery impact
   - Model download size
6. Test on a low-range Android device
7. Test on a mid-range Android device
8. Verify iOS compatibility

## Success Criteria

- Engine produces timestamped segments (not just full text)
- Engine supports cancellation
- Engine provides progress reporting
- On-device option works on at least mid-range Android
- On-device option produces timestamps aligned within 500ms of actual speech
- Model size is documented and manageable for mobile download
- Licence is compatible with VoxCita's MIT licence or clearly documented
- If no existing package is adequate, document the gap and the plugin requirements

## Timebox

2 weeks (Weeks 12 to 13 of the delivery plan)

## Findings

To be filled in after the spike.

## Recommendation

To be filled in after the spike.
