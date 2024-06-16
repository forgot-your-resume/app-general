import 'package:flutter/material.dart';

class AssessmentQuestionRowHeader extends StatelessWidget {
  const AssessmentQuestionRowHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final label = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        );

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            'Вопрос',
            style: label,
          ),
        ),
        Expanded(
          child: Text(
            'Правильный ответ',
            style: label,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            'Ответ',
            style: label,
          ),
        )
      ],
    );
  }
}
