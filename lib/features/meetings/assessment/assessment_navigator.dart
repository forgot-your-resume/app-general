import 'package:forgot_your_resume/features/meetings/assessment/assessment_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_page.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_navigator.dart';
import 'package:forgot_your_resume/navigation/app_navigator.dart';

class AssessmentNavigator with GiveFeedbackRoute {
  AssessmentNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

mixin AssessmentRoute {
  Future<void> openAssessment(AssessmentInitialParams initialParams) async {
    return appNavigator.push(
      materialRoute(AssessmentPage(initialParams: initialParams)),
    );
  }

  AppNavigator get appNavigator;
}
