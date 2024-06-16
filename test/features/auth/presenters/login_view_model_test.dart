import 'package:flutter_test/flutter_test.dart';
import 'package:forgot_your_resume/features/auth/login/login_initial_params.dart';
import 'package:forgot_your_resume/features/auth/login/login_presentation_view_state.dart';
import 'package:forgot_your_resume/features/auth/login/login_view_model.dart';

import '../mocks/auth_mock_definitions.dart';

void main() {
  late LoginPresentationViewState model;
  late LoginViewModel presenter;
  late MockLoginNavigator navigator;

  test(
    'sample test',
        () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = LoginPresentationViewState.initial(const LoginInitialParams());
    navigator = MockLoginNavigator();
    presenter = LoginViewModel(
      model,
      navigator,
    );
  });
}
