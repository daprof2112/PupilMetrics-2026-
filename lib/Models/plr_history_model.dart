// lib/models/plr_history_model.dart
// PLR Analysis History Model for Database Storage

import 'dart:convert';

/// PLR Analysis Result for History Storage
class PLRHistoryRecord {
  final int? id;
  final DateTime timestamp;
  final String patientName;
  final int? patientAge;
  final String? patientSex;
  final bool isRightEye;
  final String videoPath;

  // PLR Metrics
  final int totalFrames;
  final int successfulFrames;
  final double? baselinePupilRatio;
  final double? minPupilRatio;
  final double? plrMagnitude;
  final double? plrConstrictionPercent;
  final bool plrDetected;

  // Frame data (stored as JSON string)
  final String? frameDataJson;

  // Quality
  final double averageConfidence;
  final String overallGrade;

  PLRHistoryRecord({
    this.id,
    required this.timestamp,
    required this.patientName,
    this.patientAge,
    this.patientSex,
    required this.isRightEye,
    required this.videoPath,
    required this.totalFrames,
    required this.successfulFrames,
    this.baselinePupilRatio,
    this.minPupilRatio,
    this.plrMagnitude,
    this.plrConstrictionPercent,
    required this.plrDetected,
    this.frameDataJson,
    required this.averageConfidence,
    required this.overallGrade,
  });

  String get eyeLabel => isRightEye ? 'OD (Right)' : 'OS (Left)';
  String get eyeShort => isRightEye ? 'OD' : 'OS';

  /// Convert to Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'patient_name': patientName,
      'patient_age': patientAge,
      'patient_sex': patientSex,
      'is_right_eye': isRightEye ? 1 : 0,
      'video_path': videoPath,
      'total_frames': totalFrames,
      'successful_frames': successfulFrames,
      'baseline_pupil_ratio': baselinePupilRatio,
      'min_pupil_ratio': minPupilRatio,
      'plr_magnitude': plrMagnitude,
      'plr_constriction_percent': plrConstrictionPercent,
      'plr_detected': plrDetected ? 1 : 0,
      'frame_data_json': frameDataJson,
      'average_confidence': averageConfidence,
      'overall_grade': overallGrade,
    };
  }

  /// Create from database Map
  factory PLRHistoryRecord.fromMap(Map<String, dynamic> map) {
    return PLRHistoryRecord(
      id: map['id'] as int?,
      timestamp: DateTime.parse(map['timestamp'] as String),
      patientName: map['patient_name'] as String? ?? 'Unknown',
      patientAge: map['patient_age'] as int?,
      patientSex: map['patient_sex'] as String?,
      isRightEye: (map['is_right_eye'] as int?) == 1,
      videoPath: map['video_path'] as String? ?? '',
      totalFrames: map['total_frames'] as int? ?? 0,
      successfulFrames: map['successful_frames'] as int? ?? 0,
      baselinePupilRatio: map['baseline_pupil_ratio'] as double?,
      minPupilRatio: map['min_pupil_ratio'] as double?,
      plrMagnitude: map['plr_magnitude'] as double?,
      plrConstrictionPercent: map['plr_constriction_percent'] as double?,
      plrDetected: (map['plr_detected'] as int?) == 1,
      frameDataJson: map['frame_data_json'] as String?,
      averageConfidence: map['average_confidence'] as double? ?? 0.0,
      overallGrade: map['overall_grade'] as String? ?? 'D',
    );
  }

  /// Convert to JSON for export
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'patient': {
        'name': patientName,
        'age': patientAge,
        'sex': patientSex,
      },
      'eye': eyeLabel,
      'videoPath': videoPath,
      'metrics': {
        'totalFrames': totalFrames,
        'successfulFrames': successfulFrames,
        'baselinePupilRatio': baselinePupilRatio,
        'minPupilRatio': minPupilRatio,
        'plrMagnitude': plrMagnitude,
        'plrConstrictionPercent': plrConstrictionPercent,
        'plrDetected': plrDetected,
      },
      'quality': {
        'averageConfidence': averageConfidence,
        'overallGrade': overallGrade,
      },
      'frameData': frameDataJson != null ? jsonDecode(frameDataJson!) : null,
    };
  }

  /// Create a copy with modified fields
  PLRHistoryRecord copyWith({
    int? id,
    DateTime? timestamp,
    String? patientName,
    int? patientAge,
    String? patientSex,
    bool? isRightEye,
    String? videoPath,
    int? totalFrames,
    int? successfulFrames,
    double? baselinePupilRatio,
    double? minPupilRatio,
    double? plrMagnitude,
    double? plrConstrictionPercent,
    bool? plrDetected,
    String? frameDataJson,
    double? averageConfidence,
    String? overallGrade,
  }) {
    return PLRHistoryRecord(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      patientName: patientName ?? this.patientName,
      patientAge: patientAge ?? this.patientAge,
      patientSex: patientSex ?? this.patientSex,
      isRightEye: isRightEye ?? this.isRightEye,
      videoPath: videoPath ?? this.videoPath,
      totalFrames: totalFrames ?? this.totalFrames,
      successfulFrames: successfulFrames ?? this.successfulFrames,
      baselinePupilRatio: baselinePupilRatio ?? this.baselinePupilRatio,
      minPupilRatio: minPupilRatio ?? this.minPupilRatio,
      plrMagnitude: plrMagnitude ?? this.plrMagnitude,
      plrConstrictionPercent: plrConstrictionPercent ?? this.plrConstrictionPercent,
      plrDetected: plrDetected ?? this.plrDetected,
      frameDataJson: frameDataJson ?? this.frameDataJson,
      averageConfidence: averageConfidence ?? this.averageConfidence,
      overallGrade: overallGrade ?? this.overallGrade,
    );
  }
}

/// Summary statistics for PLR history
class PLRHistoryStats {
  final int totalScans;
  final int scansThisWeek;
  final int totalPatients;
  final int plrDetectedCount;
  final double averagePlrMagnitude;

  PLRHistoryStats({
    required this.totalScans,
    required this.scansThisWeek,
    required this.totalPatients,
    required this.plrDetectedCount,
    required this.averagePlrMagnitude,
  });

  double get detectionRate => totalScans > 0 ? (plrDetectedCount / totalScans) * 100 : 0;
}