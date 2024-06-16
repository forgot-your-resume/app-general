import 'package:flutter_test/flutter_test.dart';
import 'package:forgot_your_resume/dependency_injection/app_component.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_navigator.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_page.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_view_model.dart';

import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';

Future<void> main() async {
  late GiveFeedbackPage page;
  late GiveFeedbackInitialParams initParams;
  late GiveFeedbackPresentationViewState model;
  late GiveFeedbackViewModel presenter;
  late GiveFeedbackNavigator navigator;

  void initMvp() {
    initParams = const GiveFeedbackInitialParams();
    model = GiveFeedbackPresentationViewState.initial(
      initParams,
    );
    navigator = GiveFeedbackNavigator(Mocks.appNavigator);
    presenter = GiveFeedbackViewModel(
      model,
      navigator,
    );

    getIt.registerFactoryParam<GiveFeedbackViewModel, GiveFeedbackInitialParams, dynamic>(
      (initialParams, _) => presenter,
    );
    page = GiveFeedbackPage(initialParams: initParams);
  }

  await screenshotTest(
    "give_feedback_page",
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );
}
