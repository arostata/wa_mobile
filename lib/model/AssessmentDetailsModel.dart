import 'dart:ffi';

import 'package:intl/intl.dart';

class AssessmentDetailsModel {
  final int regId;
  final String examTitle;
  final String examSched;
  final String examType;

  AssessmentDetailsModel({
    required this.regId,
    required this.examTitle,
    required this.examSched,
    required this.examType,
  });

  factory AssessmentDetailsModel.fromJson(Map<String, dynamic> json) {
    return AssessmentDetailsModel(
        regId: json['regId'],
        examTitle: json['productName'],
        examSched: json['scheduledDate'],
        examType: json['examType']);
  }
}
