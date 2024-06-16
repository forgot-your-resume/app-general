import 'package:flutter_test/flutter_test.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_view_model.dart';

import '../mocks/meetings_mock_definitions.dart';

void main() {
  late MeetingsListPresentationViewState model;
  late MeetingsListViewModel presenter;
  late MockMeetingsListNavigator navigator;

  test(
    'sample test',
        () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = MeetingsListPresentationViewState.initial(const MeetingsListInitialParams());
    navigator = MockMeetingsListNavigator();
    presenter = MeetingsListViewModel(
      model,
      navigator,
    );
  });
}
