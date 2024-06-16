import 'package:equatable/equatable.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/assessment_question.dart';

class Conference extends Equatable {
  final String id;
  final String name;
  final DateTime dateTime;
  final List<AssessmentQuestion> questions;
  final String conferenceToken;
  final List<String> userIds;

  const Conference({
    required this.id,
    required this.name,
    required this.dateTime,
    required this.questions,
    required this.conferenceToken,
    required this.userIds,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        dateTime,
        questions,
        conferenceToken,
        userIds,
      ];
}
