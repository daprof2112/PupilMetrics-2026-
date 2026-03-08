/// Pupil Analysis Module for Flutter
/// 
/// A drop-in module for analyzing iris/pupil parameters from eye images.
/// 
/// ## Quick Start
/// 
/// ```dart
/// import 'package:pupil_analyzer/pupil_analyzer.dart';
/// 
/// // Analyze a single eye
/// final analyzer = PupilAnalyzer();
/// final result = await analyzer.analyzeEye(imageFile);
/// print('Pupil/Iris Ratio: ${result.pupilIrisRatio}%');
/// 
/// // Analyze both eyes
/// final bilateral = await analyzer.analyzeEyes(
///   leftEyeImage: leftFile,
///   rightEyeImage: rightFile,
/// );
/// print('Clinical notes: ${bilateral.clinicalNotes}');
/// ```
/// 
/// ## Using the Built-in UI
/// 
/// ```dart
/// Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (context) => AnalysisScreen(
///       leftEyeImage: leftFile,
///       rightEyeImage: rightFile,
///       onComplete: () => print('Done!'),
///     ),
///   ),
/// );
/// ```

library pupil_analyzer;

export 'src/pupil_analyzer.dart';
export 'src/analysis_widgets.dart';
export 'src/analysis_screen.dart';
