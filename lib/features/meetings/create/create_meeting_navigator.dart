import 'package:forgot_your_resume/features/meetings/create/create_meeting_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_page.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/conference.dart';
import 'package:forgot_your_resume/navigation/app_navigator.dart';
import 'package:forgot_your_resume/navigation/close_with_result_route.dart';
import 'package:forgot_your_resume/navigation/pop_up_dialog.dart';

class CreateMeetingNavigator with CloseWithResultRoute<Conference> {
  CreateMeetingNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

mixin CreateMeetingRoute {
  Future<Conference?> openCreateMeeting(CreateMeetingInitialParams initialParams) async {
    return showPopUpDialog(CreateMeetingPage(initialParams: initialParams));
  }

  AppNavigator get appNavigator;
}
