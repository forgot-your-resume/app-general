import 'package:flutter/material.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/assessment_question.dart';
import 'package:forgot_your_resume/uikit/assessment_question_row.dart';
import 'package:forgot_your_resume/uikit/assessment_question_row_header.dart';

class AssessmentQuestionsList extends StatelessWidget {
  const AssessmentQuestionsList({
    super.key,
    required this.questions,
    required this.answers,
    required this.onChange,
  });

  final List<AssessmentQuestion> questions;
  final Map<String, String> answers;
  final QuestionAnswerChanged onChange;

  @override
  Widget build(BuildContext context) => ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: questions.length + 1,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => index == 0
            ? const AssessmentQuestionRowHeader()
            : AssessmentQuestionRow(
                question: questions[index - 1],
                initialAnswer: answers.containsKey(questions[index - 1].id) ? answers[questions[index - 1].id] : null,
                onChange: onChange,
              ),
      );
}
