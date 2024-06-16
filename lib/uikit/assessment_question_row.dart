import 'package:flutter/material.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/assessment_question.dart';

typedef QuestionAnswerChanged = void Function(String id, String answer);

class AssessmentQuestionRow extends StatefulWidget {
  const AssessmentQuestionRow({
    super.key,
    required this.question,
    required this.initialAnswer,
    required this.onChange,
  });

  final AssessmentQuestion question;
  final String? initialAnswer;
  final QuestionAnswerChanged onChange;

  @override
  State<AssessmentQuestionRow> createState() => _AssessmentQuestionRowState();
}

class _AssessmentQuestionRowState extends State<AssessmentQuestionRow> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController.fromValue(
      widget.initialAnswer == null ? null : TextEditingValue(text: widget.initialAnswer!),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(widget.question.question),
          ),
          Expanded(
            child: Text(widget.question.answer),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ответ',
              ),
              minLines: 3,
              maxLines: 5,
              onChanged: (answer) => widget.onChange(widget.question.id, answer),
            ),
          ),
        ],
      );
}
