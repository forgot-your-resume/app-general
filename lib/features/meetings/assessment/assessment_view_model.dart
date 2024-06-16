import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_navigator.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_initial_params.dart';

class AssessmentViewModel extends Cubit<AssessmentViewState> {
  AssessmentViewModel(
    super.model,
    this.navigator,
  );

  final AssessmentNavigator navigator;

  // ignore: unused_element
  AssessmentPresentationViewState get _model => state as AssessmentPresentationViewState;

  void onChangeAnswer(String id, String answer) {
    final answers = Map<String, String>.from(_model.answers);

    if (!answers.containsKey(id)) {
      answers[id] = '';
    }

    answers[id] = answer;

    emit(
      _model.copyWith(answers: UnmodifiableMapView(answers)),
    );
  }

  void addQuestion() {}

  void onFinishTap() => navigator.openGiveFeedback(
        GiveFeedbackInitialParams(
          questions: _model.questions,
          answers: _model.answers,
          conference: _model.conference,
        ),
      );
}
