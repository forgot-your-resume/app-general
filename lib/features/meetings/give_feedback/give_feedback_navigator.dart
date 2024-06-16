import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_page.dart';
import 'package:forgot_your_resume/navigation/app_navigator.dart';
import 'package:forgot_your_resume/navigation/close_route.dart';

class GiveFeedbackNavigator with CloseRoute {
  GiveFeedbackNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

mixin GiveFeedbackRoute {
  Future<void> openGiveFeedback(GiveFeedbackInitialParams initialParams) async {
    return appNavigator.pushReplacement(
      materialRoute(GiveFeedbackPage(initialParams: initialParams)),
    );
  }

  AppNavigator get appNavigator;
}
