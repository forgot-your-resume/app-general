import 'package:forgot_your_resume/features/meetings/assessment/assessment_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/assessment_question.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/conference.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class AssessmentPresentationViewState implements AssessmentViewState {
  /// Creates the initial state
  AssessmentPresentationViewState.initial(
    // ignore: avoid_unused_constructor_parameters
    AssessmentInitialParams initialParams,
  )   : conference = initialParams.conference,
        answers = const {};

  /// Used for the copyWith method
  AssessmentPresentationViewState._({
    required this.conference,
    required this.answers,
  });

  @override
  final Conference conference;

  @override
  final Map<String, String> answers;

  @override
  List<AssessmentQuestion> get questions => conference.questions;

  AssessmentPresentationViewState copyWith({
    List<AssessmentQuestion>? questions,
    Map<String, String>? answers,
  }) {
    return AssessmentPresentationViewState._(
      conference: conference,
      answers: answers ?? this.answers,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class AssessmentViewState {
  Conference get conference;
  List<AssessmentQuestion> get questions;
  Map<String, String> get answers;
}
