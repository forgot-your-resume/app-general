import 'package:forgot_your_resume/features/auth/login/login_initial_params.dart';
import 'package:forgot_your_resume/features/auth/login/login_page.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_navigator.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_navigator.dart';
import 'package:forgot_your_resume/navigation/app_navigator.dart';

class LoginNavigator with SignupRoute, MeetingsListRoute {
  LoginNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

mixin LoginRoute {
  Future<void> openLogin(LoginInitialParams initialParams) async {
    return appNavigator.push(
      materialRoute(LoginPage(initialParams: initialParams)),
    );
  }

  AppNavigator get appNavigator;
}
