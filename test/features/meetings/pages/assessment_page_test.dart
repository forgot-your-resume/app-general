import 'package:flutter_test/flutter_test.dart';
import 'package:forgot_your_resume/dependency_injection/app_component.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_navigator.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_page.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_view_model.dart';

import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';

Future<void> main() async {
  late AssessmentPage page;
  late AssessmentInitialParams initParams;
  late AssessmentPresentationViewState model;
  late AssessmentViewModel presenter;
  late AssessmentNavigator navigator;

  void initMvp() {
    initParams = const AssessmentInitialParams();
    model = AssessmentPresentationViewState.initial(
      initParams,
    );
    navigator = AssessmentNavigator(Mocks.appNavigator);
    presenter = AssessmentViewModel(
      model,
      navigator,
    );

    getIt.registerFactoryParam<AssessmentViewModel, AssessmentInitialParams, dynamic>(
      (initialParams, _) => presenter,
    );
    page = AssessmentPage(initialParams: initParams);
  }

  await screenshotTest(
    "assessment_page",
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );
}
