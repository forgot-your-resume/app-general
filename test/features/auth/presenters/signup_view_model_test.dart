import 'package:flutter_test/flutter_test.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_initial_params.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_presentation_view_state.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_view_model.dart';

import '../mocks/auth_mock_definitions.dart';

void main() {
  late SignupPresentationViewState model;
  late SignupViewModel presenter;
  late MockSignupNavigator navigator;

  test(
    'sample test',
        () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = SignupPresentationViewState.initial(const SignupInitialParams());
    navigator = MockSignupNavigator();
    presenter = SignupViewModel(
      model,
      navigator,
    );
  });
}
