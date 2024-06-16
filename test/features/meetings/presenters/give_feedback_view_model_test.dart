import 'package:flutter_test/flutter_test.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_view_model.dart';

import '../mocks/meetings_mock_definitions.dart';

void main() {
  late GiveFeedbackPresentationViewState model;
  late GiveFeedbackViewModel presenter;
  late MockGiveFeedbackNavigator navigator;

  test(
    'sample test',
        () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = GiveFeedbackPresentationViewState.initial(const GiveFeedbackInitialParams());
    navigator = MockGiveFeedbackNavigator();
    presenter = GiveFeedbackViewModel(
      model,
      navigator,
    );
  });
}
