import 'package:flutter_test/flutter_test.dart';
import 'package:forgot_your_resume/dependency_injection/app_component.dart';
import 'package:forgot_your_resume/features/auth/login/login_initial_params.dart';
import 'package:forgot_your_resume/features/auth/login/login_navigator.dart';
import 'package:forgot_your_resume/features/auth/login/login_page.dart';
import 'package:forgot_your_resume/features/auth/login/login_presentation_view_state.dart';
import 'package:forgot_your_resume/features/auth/login/login_view_model.dart';

import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';

Future<void> main() async {
  late LoginPage page;
  late LoginInitialParams initParams;
  late LoginPresentationViewState model;
  late LoginViewModel presenter;
  late LoginNavigator navigator;

  void initMvp() {
    initParams = const LoginInitialParams();
    model = LoginPresentationViewState.initial(
      initParams,
    );
    navigator = LoginNavigator(Mocks.appNavigator);
    presenter = LoginViewModel(
      model,
      navigator,
    );

    getIt.registerFactoryParam<LoginViewModel, LoginInitialParams, dynamic>(
      (initialParams, _) => presenter,
    );
    page = LoginPage(initialParams: initParams);
  }

  await screenshotTest(
    "login_page",
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );
}
