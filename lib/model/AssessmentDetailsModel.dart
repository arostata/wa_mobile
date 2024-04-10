import 'dart:ffi';

import 'package:intl/intl.dart';

class AssessmentDetailsModel {
  final int regId;
  final String examTitle;
  final String examSched;
  final String examType;
  final String registrationProgress;
  final String? passFailStatus;

  AssessmentDetailsModel({
    required this.regId,
    required this.examTitle,
    required this.examSched,
    required this.examType,
    required this.registrationProgress,
    required this.passFailStatus,
  });

  factory AssessmentDetailsModel.fromJson(Map<String, dynamic> json) {
    return AssessmentDetailsModel(
        regId: json['regId'],
        examTitle: json['productName'],
        examSched: json['scheduledDate'],
        examType: json['examType'],
        registrationProgress: json['registrationProgress'],
        passFailStatus: json['passFailStatus']);
  }
}
