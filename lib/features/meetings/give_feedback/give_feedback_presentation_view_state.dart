import 'package:forgot_your_resume/core/utils/future_result.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/assessment_question.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/conference.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class GiveFeedbackPresentationViewState implements GiveFeedbackViewState {
  /// Creates the initial state
  GiveFeedbackPresentationViewState.initial(
    // ignore: avoid_unused_constructor_parameters
    GiveFeedbackInitialParams initialParams,
  )   : questions = initialParams.questions,
        answers = initialParams.answers,
        conference = initialParams.conference,
        loadingResult = const FutureResult.empty(),
        comment = '';

  /// Used for the copyWith method
  GiveFeedbackPresentationViewState._({
    required this.questions,
    required this.answers,
    required this.conference,
    required this.loadingResult,
    required this.comment,
  });

  final Conference conference;

  final FutureResult loadingResult;

  final String comment;

  @override
  final List<AssessmentQuestion> questions;

  @override
  final Map<String, String> answers;

  @override
  bool get isLoading => loadingResult.isPending();

  GiveFeedbackPresentationViewState copyWith({
    List<AssessmentQuestion>? questions,
    Map<String, String>? answers,
    FutureResult? loadingResult,
    String? comment,
  }) {
    return GiveFeedbackPresentationViewState._(
      conference: conference,
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      loadingResult: loadingResult ?? this.loadingResult,
      comment: comment ?? this.comment,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class GiveFeedbackViewState {
  List<AssessmentQuestion> get questions;
  Map<String, String> get answers;
  bool get isLoading;
}
