import 'package:flutter/material.dart';
import 'package:forgot_your_resume/core/utils/mvp_extensions.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_view_model.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_initial_params.dart';
import 'package:forgot_your_resume/uikit/assessment_questions_list.dart';
import 'package:forgot_your_resume/uikit/progress_indicator.dart';

class GiveFeedbackPage extends StatefulWidget with HasInitialParams {
  const GiveFeedbackPage({
    super.key,
    required this.initialParams,
  });

  @override
  final GiveFeedbackInitialParams initialParams;

  @override
  State<GiveFeedbackPage> createState() => _GiveFeedbackPageState();
}

class _GiveFeedbackPageState extends State<GiveFeedbackPage>
    with ViewModelStateMixinAuto<GiveFeedbackViewState, GiveFeedbackViewModel, GiveFeedbackPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Оценка кандидата'),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Center(
            child: SizedBox(
              width: 400,
              child: stateObserver(
                builder: (context, state) => OutlinedButton(
                  onPressed: state.isLoading ? null : viewModel.onTapSendFeedback,
                  child: state.isLoading ? const LoadingIndicator() : const Text('Сохранить оценку'),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: AssessmentQuestionsList(
                    questions: state.questions,
                    answers: state.answers,
                    onChange: viewModel.onChangeAnswer,
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Общий комментарий',
                    ),
                    minLines: 3,
                    maxLines: 5,
                    onChanged: viewModel.onChangeFeedback,
                  ))
            ],
          ),
        ),
      );
}
