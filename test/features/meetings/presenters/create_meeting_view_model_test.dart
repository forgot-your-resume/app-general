import 'package:flutter_test/flutter_test.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_view_model.dart';

import '../mocks/meetings_mock_definitions.dart';

void main() {
  late CreateMeetingPresentationViewState model;
  late CreateMeetingViewModel presenter;
  late MockCreateMeetingNavigator navigator;

  test(
    'sample test',
        () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = CreateMeetingPresentationViewState.initial(const CreateMeetingInitialParams());
    navigator = MockCreateMeetingNavigator();
    presenter = CreateMeetingViewModel(
      model,
      navigator,
    );
  });
}
