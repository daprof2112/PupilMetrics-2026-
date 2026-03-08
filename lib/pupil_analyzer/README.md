# 👁️ Pupil Analyzer - Flutter Module

A drop-in Flutter module for analyzing iris and pupil parameters from eye images. Based on the Bexel IRINA algorithm (reverse-engineered from 712 clinical cases).

## ✨ Features

- **Pupil/Iris Ratio** - Measures pupil size relative to iris diameter
- **Ellipseness** - Detects non-circular pupil shapes  
- **Decentralization** - Measures pupil offset from iris center
- **ANW Ratio** - Detects autonomic nerve wreath (collarette) position
- **Bilateral Comparison** - Compares left and right eye asymmetry
- **Clinical Notes** - Automatic interpretation of findings
- **Quality Grading** - A/B/C/D image quality assessment

## 🚀 Quick Integration

### Step 1: Copy Files

Copy the `lib/` folder into your Flutter project:

```
your_app/
├── lib/
│   ├── main.dart
│   └── pupil_analyzer/          ← Copy this folder!
│       ├── pupil_analyzer.dart
│       └── src/
│           ├── pupil_analyzer.dart
│           ├── analysis_widgets.dart
│           └── analysis_screen.dart
```

### Step 2: Check Dependencies

Make sure you have `image` in your `pubspec.yaml` (you already do!):

```yaml
dependencies:
  image: ^4.1.7
```

### Step 3: Import and Use

```dart
import 'pupil_analyzer/pupil_analyzer.dart';

// After capturing both eyes, navigate to results:
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => AnalysisScreen(
      leftEyeImage: leftImageFile,
      rightEyeImage: rightImageFile,
      onComplete: () {
        Navigator.pop(context);
      },
      onRetake: () {
        Navigator.pop(context);
        // Go back to camera
      },
    ),
  ),
);
```

## 📊 Programmatic Usage

### Analyze Single Eye

```dart
import 'pupil_analyzer/pupil_analyzer.dart';

final analyzer = PupilAnalyzer();

// From file
final result = await analyzer.analyzeEye(File('path/to/eye.jpg'));

// From bytes (e.g., after camera capture)
final resultFromBytes = await analyzer.analyzeEyeFromBytes(imageBytes);

// Access results
print('Pupil/Iris Ratio: ${result.pupilIrisRatio}%');
print('Ellipseness: ${result.ellipseness}%');
print('Decentralization: ${result.decentralization}%');
print('Zone: ${result.decentralizationZone}');
print('Quality Grade: ${result.qualityGrade}');
print('Clinically Significant: ${result.isDeformationSignificant}');
```

### Analyze Both Eyes

```dart
final bilateral = await analyzer.analyzeEyes(
  leftEyeImage: leftFile,
  rightEyeImage: rightFile,
);

// Bilateral comparison
print('Pupil Ratio Asymmetry: ${bilateral.pupilRatioAsymmetry}%');
print('Clinical Notes:');
for (final note in bilateral.clinicalNotes) {
  print('  • $note');
}

// Access individual eye results
if (bilateral.leftEye != null) {
  print('Left eye ratio: ${bilateral.leftEye!.pupilIrisRatio}%');
}
```

### Export to JSON

```dart
final json = result.toJson();
// Save or send to server
```

## 🎨 Custom UI Widgets

### Analysis Overlay (draw on image)

```dart
Stack(
  children: [
    Image.file(eyeImage),
    PupilAnalysisOverlay(
      analysis: result,
      imageWidth: 300,
      imageHeight: 225,
      showIris: true,
      showPupil: true,
      showANW: true,
      showMeasurements: true,
      irisColor: Colors.green,
      pupilColor: Colors.cyan,
    ),
  ],
)
```

### Result Card Widget

```dart
AnalysisResultCard(
  analysis: result,
  eyeLabel: 'Left',
)
```

### Bilateral Comparison Widget

```dart
BilateralComparisonWidget(result: bilateralResult)
```

## 📋 Output Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `pupilIrisRatio` | double | Pupil diameter as % of iris diameter (normal: 20-35%) |
| `ellipseness` | double | Minor/major axis ratio as % (normal: >90%) |
| `decentralization` | double | Pupil offset as % of iris radius (normal: <3%) |
| `decentralizationAngle` | double | Direction of offset in degrees |
| `decentralizationZone` | String | Anatomical zone (e.g., "upper-nasal") |
| `anwRatio` | double? | ANW position as % of iris radius (typical: 35-45%) |
| `confidence` | double | Detection confidence (0-1) |
| `qualityGrade` | String | Image quality: A, B, C, or D |
| `isDeformationSignificant` | bool | True if findings exceed 3% threshold |

## 🔬 Algorithm Details

The analyzer uses classical computer vision techniques calibrated against 712 Bexel IRINA clinical cases:

1. **Iris Detection**: Radial gradient voting to find limbus boundary
2. **Reflection Masking**: Detects and excludes flash reflections
3. **Pupil Detection**: 25th percentile thresholding + PCA ellipse fitting
4. **ANW Detection**: Radial profile gradient analysis
5. **Parameter Calculation**: Based on Bexel measurement formulas

### Performance Baseline

| Parameter | Accuracy |
|-----------|----------|
| Pupil/Iris Ratio | ~62% within 5% error |
| Ellipseness | ~80% within 10% error |
| Decentralization | ~43% within 5% error |

*Note: Accuracy improves significantly with good lighting and focus.*

## 📱 Integration with Your App

### After Camera Capture

In your camera capture callback:

```dart
void onBothEyesCaptured(File leftEye, File rightEye) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AnalysisScreen(
        leftEyeImage: leftEye,
        rightEyeImage: rightEye,
        onComplete: () {
          // Return to home or next screen
          Navigator.popUntil(context, (route) => route.isFirst);
        },
        onRetake: () {
          // Go back to camera
          Navigator.pop(context);
        },
      ),
    ),
  );
}
```

### With Your Existing Eye Detection

Your app already has eye detection - great! The module works with any cropped eye image. The detection quality indicators in your UI (Eye ✓, Center ✓, Light ✓, Ready ✓) are perfect for ensuring good input images.

## 🐛 Troubleshooting

### "Image could not be decoded"
- Ensure the file exists and is a valid JPG/PNG/BMP
- Check file permissions

### Low confidence / Grade D
- Improve lighting conditions
- Ensure eye is centered and in focus
- Reduce flash reflections if possible

### Unrealistic pupil ratio
- Image may be too dark or too bright
- Flash reflection may be covering the pupil
- Try recapturing with exposure adjustment

## 📄 License

Based on research into pupillometry and the Bexel IRINA system.
For research and educational purposes.

---

**Questions?** The algorithm parameters are calibrated from clinical data and can be fine-tuned in `pupil_analyzer.dart` if needed.
