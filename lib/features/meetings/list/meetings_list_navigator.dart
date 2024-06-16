import 'package:forgot_your_resume/features/auth/login/login_navigator.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_navigator.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_navigator.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_page.dart';
import 'package:forgot_your_resume/navigation/app_navigator.dart';
import 'package:forgot_your_resume/navigation/close_route.dart';

class MeetingsListNavigator with AssessmentRoute, CloseRoute, LoginRoute, CreateMeetingRoute {
  MeetingsListNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

mixin MeetingsListRoute {
  Future<void> openMeetingsList(MeetingsListInitialParams initialParams) async {
    appNavigator.popUntilRoot();
    return appNavigator.push(
      materialRoute(MeetingsListPage(initialParams: initialParams)),
    );
  }

  AppNavigator get appNavigator;
}
