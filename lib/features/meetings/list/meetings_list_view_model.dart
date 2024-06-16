import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgot_your_resume/core/data/dio/auth_header_interceptor.dart';
import 'package:forgot_your_resume/core/utils/bloc_extensions.dart';
import 'package:forgot_your_resume/core/utils/either_extensions.dart';
import 'package:forgot_your_resume/core/utils/logging.dart';
import 'package:forgot_your_resume/features/auth/login/login_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/conference.dart';
import 'package:forgot_your_resume/features/meetings/domain/repositories/conferences_repository.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_navigator.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_presentation_view_state.dart';

class MeetingsListViewModel extends Cubit<MeetingsListViewState> {
  MeetingsListViewModel(
    super.model,
    this.navigator,
    this._conferencesRepository,
  );

  final MeetingsListNavigator navigator;
  final ConferencesRepository _conferencesRepository;

  // ignore: unused_element
  MeetingsListPresentationViewState get _model => state as MeetingsListPresentationViewState;

  void onInit() {
    _conferencesRepository
        .getConferences()
        .doOn(
          success: (conferences) => emit(
            _model.copyWith(conferences: conferences),
          ),
          fail: (fail) => debugLog(fail.toString()),
        )
        .observeStatusChanges(
          (result) => emit(_model.copyWith(loadingResult: result)),
        );
  }

  void onTapConference(Conference conference) => navigator.openAssessment(
        AssessmentInitialParams(conference: conference),
      );

  void onTapSignOut() {
    authToken = '';
    navigator
      ..close()
      ..openLogin(const LoginInitialParams());
  }

  Future<void> onTapCreateMeeting() async {
    final conference = await navigator.openCreateMeeting(const CreateMeetingInitialParams());
    if (conference == null) return;

    await _conferencesRepository
        .createConference(conference)
        .doOn(fail: (fail) => debugLog(fail.toString()))
        .observeStatusChanges(
          (result) => emit(
            _model.copyWith(creatingResult: result),
          ),
        );

    onInit();
  }
}
