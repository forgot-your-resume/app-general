import 'package:flutter_test/flutter_test.dart';
import 'package:forgot_your_resume/dependency_injection/app_component.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_navigator.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_page.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_view_model.dart';

import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';

Future<void> main() async {
  late MeetingsListPage page;
  late MeetingsListInitialParams initParams;
  late MeetingsListPresentationViewState model;
  late MeetingsListViewModel presenter;
  late MeetingsListNavigator navigator;

  void initMvp() {
    initParams = const MeetingsListInitialParams();
    model = MeetingsListPresentationViewState.initial(
      initParams,
    );
    navigator = MeetingsListNavigator(Mocks.appNavigator);
    presenter = MeetingsListViewModel(
      model,
      navigator,
    );

    getIt.registerFactoryParam<MeetingsListViewModel, MeetingsListInitialParams, dynamic>(
      (initialParams, _) => presenter,
    );
    page = MeetingsListPage(initialParams: initParams);
  }

  await screenshotTest(
    "meetings_list_page",
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );
}
