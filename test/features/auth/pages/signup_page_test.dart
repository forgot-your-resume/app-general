import 'package:flutter_test/flutter_test.dart';
import 'package:forgot_your_resume/dependency_injection/app_component.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_initial_params.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_navigator.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_page.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_presentation_view_state.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_view_model.dart';

import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';

Future<void> main() async {
  late SignupPage page;
  late SignupInitialParams initParams;
  late SignupPresentationViewState model;
  late SignupViewModel presenter;
  late SignupNavigator navigator;

  void initMvp() {
    initParams = const SignupInitialParams();
    model = SignupPresentationViewState.initial(
      initParams,
    );
    navigator = SignupNavigator(Mocks.appNavigator);
    presenter = SignupViewModel(
      model,
      navigator,
    );

    getIt.registerFactoryParam<SignupViewModel, SignupInitialParams, dynamic>(
      (initialParams, _) => presenter,
    );
    page = SignupPage(initialParams: initParams);
  }

  await screenshotTest(
    "signup_page",
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );
}
