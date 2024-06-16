import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgot_your_resume/core/data/dio/auth_header_interceptor.dart';
import 'package:forgot_your_resume/core/utils/bloc_extensions.dart';
import 'package:forgot_your_resume/core/utils/either_extensions.dart';
import 'package:forgot_your_resume/features/meetings/domain/repositories/assessment_repository.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_navigator.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_presentation_view_state.dart';

class GiveFeedbackViewModel extends Cubit<GiveFeedbackViewState> {
  GiveFeedbackViewModel(
    super.model,
    this.navigator,
    this._assessmentRepository,
  );

  final GiveFeedbackNavigator navigator;
  final AssessmentRepository _assessmentRepository;

  // ignore: unused_element
  GiveFeedbackPresentationViewState get _model => state as GiveFeedbackPresentationViewState;

  void onChangeFeedback(String feedback) => emit(_model.copyWith(comment: feedback));

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

  void onTapSendFeedback() => _assessmentRepository
      .giveFeedback(
        _model.conference.userIds.where((e) => e != userIdFromToken).firstOrNull ?? '',
        _model.conference.id,
        10,
        true,
        _model.comment,
      )
      .doOn(
        success: (_) => navigator.close(),
      )
      .observeStatusChanges(
        (result) => emit(_model.copyWith(loadingResult: result)),
      );
}
