import 'package:forgot_your_resume/dependency_injection/app_component.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_navigator.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_view_model.dart';

import 'package:forgot_your_resume/features/meetings/assessment/assessment_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_navigator.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_view_model.dart';

import 'package:forgot_your_resume/features/meetings/data/rest_api_assessment_repository.dart';
import 'package:forgot_your_resume/features/meetings/domain/repositories/assessment_repository.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_navigator.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_view_model.dart';

import 'package:forgot_your_resume/features/meetings/data/rest_api_conferences_repository.dart';
import 'package:forgot_your_resume/features/meetings/domain/repositories/conferences_repository.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_navigator.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_view_model.dart';

//DO-NOT-REMOVE APP_COMPONENT_IMPORTS

/// registers all the dependencies in dependency graph in get_it package
void configureDependencies() {
  _configureGeneralDependencies();
  _configureRepositories();
  _configureStores();
  _configureUseCases();
  _configureMvp();
}

//ignore: long-method
void _configureGeneralDependencies() {
  // ignore: unnecessary_statements
  getIt
      //DO-NOT-REMOVE GENERAL_DEPS_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureRepositories() {
  // ignore: unnecessary_statements
  getIt
        ..registerFactory<AssessmentRepository>(
          () => RestApiAssessmentRepository(
            getIt(),
          ),
        )
        ..registerFactory<ConferencesRepository>(
          () => RestApiConferencesRepository(
            getIt(),
          ),
        )

//DO-NOT-REMOVE REPOSITORIES_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureStores() {
  // ignore: unnecessary_statements
  getIt
      //DO-NOT-REMOVE STORES_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureUseCases() {
  // ignore: unnecessary_statements
  getIt
      //DO-NOT-REMOVE USE_CASES_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureMvp() {
  // ignore: unnecessary_statements
  getIt
        ..registerFactory<MeetingsListNavigator>(
          () => MeetingsListNavigator(getIt()),
        )
        ..registerFactoryParam<MeetingsListViewState, MeetingsListInitialParams, dynamic>(
          (params, _) => MeetingsListPresentationViewState.initial(params),
        )
        ..registerFactoryParam<MeetingsListViewModel, MeetingsListInitialParams, dynamic>(
          (params, _) => MeetingsListViewModel(
            getIt(param1: params),
            getIt(),
            getIt(),
          ),
        )
        ..registerFactory<AssessmentNavigator>(
          () => AssessmentNavigator(getIt()),
        )
        ..registerFactoryParam<AssessmentViewState, AssessmentInitialParams, dynamic>(
          (params, _) => AssessmentPresentationViewState.initial(params),
        )
        ..registerFactoryParam<AssessmentViewModel, AssessmentInitialParams, dynamic>(
          (params, _) => AssessmentViewModel(getIt(param1: params), getIt()),
        )
        ..registerFactory<GiveFeedbackNavigator>(
          () => GiveFeedbackNavigator(getIt()),
        )
        ..registerFactoryParam<GiveFeedbackViewState, GiveFeedbackInitialParams, dynamic>(
          (params, _) => GiveFeedbackPresentationViewState.initial(params),
        )
        ..registerFactoryParam<GiveFeedbackViewModel, GiveFeedbackInitialParams, dynamic>(
          (params, _) => GiveFeedbackViewModel(
            getIt(param1: params),
            getIt(),
            getIt(),
          ),
        )
        ..registerFactory<CreateMeetingNavigator>(
          () => CreateMeetingNavigator(getIt()),
        )
        ..registerFactoryParam<CreateMeetingViewState, CreateMeetingInitialParams, dynamic>(
          (params, _) => CreateMeetingPresentationViewState.initial(params),
        )
        ..registerFactoryParam<CreateMeetingViewModel, CreateMeetingInitialParams, dynamic>(
          (params, _) => CreateMeetingViewModel(getIt(param1: params), getIt()),
        )

//DO-NOT-REMOVE MVP_GET_IT_CONFIG
      ;
}
