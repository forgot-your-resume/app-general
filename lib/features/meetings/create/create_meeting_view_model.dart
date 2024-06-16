import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_navigator.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/conference.dart';

class CreateMeetingViewModel extends Cubit<CreateMeetingViewState> {
  CreateMeetingViewModel(
    super.model,
    this.navigator,
  );

  final CreateMeetingNavigator navigator;

  // ignore: unused_element
  CreateMeetingPresentationViewState get _model => state as CreateMeetingPresentationViewState;

  void onChangeName(String name) => emit(_model.copyWith(name: name));

  void onTapCreate() => navigator.closeWithResult(
        Conference(
          id: '',
          name: _model.name,
          dateTime: DateTime.now(),
          questions: const [],
          conferenceToken: '',
          userIds: const [],
        ),
      );
}
