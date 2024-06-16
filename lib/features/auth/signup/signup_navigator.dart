import 'package:forgot_your_resume/features/auth/signup/signup_initial_params.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_page.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_navigator.dart';
import 'package:forgot_your_resume/navigation/app_navigator.dart';

class SignupNavigator with MeetingsListRoute {
  SignupNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

mixin SignupRoute {
  Future<void> openSignup(SignupInitialParams initialParams) async {
    return appNavigator.push(
      materialRoute(SignupPage(initialParams: initialParams)),
    );
  }

  AppNavigator get appNavigator;
}
