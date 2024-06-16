import 'package:equatable/equatable.dart';

class AssessmentQuestion extends Equatable {
  const AssessmentQuestion({
    required this.id,
    required this.question,
    required this.answer,
  });

  final String id;
  final String question;
  final String answer;

  @override
  List<Object?> get props => [id, question, answer];
}
