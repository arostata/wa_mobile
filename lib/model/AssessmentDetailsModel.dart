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

//   DateTime parseDateString(String dateString) {
//   // Split the string to extract date and time parts
//   List<String> parts = dateString.split(' ');

//   // Parse date part
//   String dateStr = parts.sublist(0, 3).join(' ');
//   DateTime date = DateFormat("d MMMM yyyy").parse(dateStr);

//   // Parse time part
//   String timeStr = parts[3].substring(0, 4);
//   DateTime time = DateFormat("HHmm").parse(timeStr);

//   // Combine date and time
//   DateTime dateTime = DateTime(
//     date.year,
//     date.month,
//     date.day,
//     time.hour,
//     time.minute,
//   );

//   return dateTime;
// }
}
