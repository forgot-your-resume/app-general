import 'package:flutter_test/flutter_test.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_view_model.dart';

import '../mocks/meetings_mock_definitions.dart';

void main() {
  late AssessmentPresentationViewState model;
  late AssessmentViewModel presenter;
  late MockAssessmentNavigator navigator;

  test(
    'sample test',
        () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = AssessmentPresentationViewState.initial(const AssessmentInitialParams());
    navigator = MockAssessmentNavigator();
    presenter = AssessmentViewModel(
      model,
      navigator,
    );
  });
}
