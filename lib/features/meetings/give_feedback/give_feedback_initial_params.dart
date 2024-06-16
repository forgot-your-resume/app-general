import 'package:forgot_your_resume/features/meetings/domain/models/assessment_question.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/conference.dart';

class GiveFeedbackInitialParams {
  const GiveFeedbackInitialParams({
    required this.questions,
    required this.answers,
    required this.conference,
  });

  final Conference conference;
  final List<AssessmentQuestion> questions;
  final Map<String, String> answers;
}
