import 'package:flutter_test/flutter_test.dart';
import 'package:forgot_your_resume/dependency_injection/app_component.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_navigator.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_page.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_view_model.dart';

import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';

Future<void> main() async {
  late CreateMeetingPage page;
  late CreateMeetingInitialParams initParams;
  late CreateMeetingPresentationViewState model;
  late CreateMeetingViewModel presenter;
  late CreateMeetingNavigator navigator;

  void initMvp() {
    initParams = const CreateMeetingInitialParams();
    model = CreateMeetingPresentationViewState.initial(
      initParams,
    );
    navigator = CreateMeetingNavigator(Mocks.appNavigator);
    presenter = CreateMeetingViewModel(
      model,
      navigator,
    );

    getIt.registerFactoryParam<CreateMeetingViewModel, CreateMeetingInitialParams, dynamic>(
      (initialParams, _) => presenter,
    );
    page = CreateMeetingPage(initialParams: initParams);
  }

  await screenshotTest(
    "create_meeting_page",
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );
}
