import 'package:mocktail/mocktail.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_navigator.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_view_model.dart';
      
import 'package:forgot_your_resume/features/meetings/assessment/assessment_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_navigator.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/assessment/assessment_view_model.dart';
      
import 'package:forgot_your_resume/features/meetings/domain/repositories/assessment_repository.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_navigator.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/give_feedback/give_feedback_view_model.dart';
      
import 'package:forgot_your_resume/features/meetings/domain/repositories/conferences_repository.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_navigator.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_view_model.dart';
      
//DO-NOT-REMOVE IMPORTS_MOCK_DEFINITIONS

// MVP

class MockMeetingsListViewModel extends MockCubit<MeetingsListViewState> implements MeetingsListViewModel {}
class MockMeetingsListPresentationViewState extends Mock implements MeetingsListPresentationViewState {}
class MockMeetingsListInitialParams extends Mock implements MeetingsListInitialParams {}
class MockMeetingsListNavigator extends Mock implements MeetingsListNavigator {}
      
class MockAssessmentViewModel extends MockCubit<AssessmentViewState> implements AssessmentViewModel {}
class MockAssessmentPresentationViewState extends Mock implements AssessmentPresentationViewState {}
class MockAssessmentInitialParams extends Mock implements AssessmentInitialParams {}
class MockAssessmentNavigator extends Mock implements AssessmentNavigator {}
      
class MockGiveFeedbackViewModel extends MockCubit<GiveFeedbackViewState> implements GiveFeedbackViewModel {}
class MockGiveFeedbackPresentationViewState extends Mock implements GiveFeedbackPresentationViewState {}
class MockGiveFeedbackInitialParams extends Mock implements GiveFeedbackInitialParams {}
class MockGiveFeedbackNavigator extends Mock implements GiveFeedbackNavigator {}
      
class MockCreateMeetingViewModel extends MockCubit<CreateMeetingViewState> implements CreateMeetingViewModel {}
class MockCreateMeetingPresentationViewState extends Mock implements CreateMeetingPresentationViewState {}
class MockCreateMeetingInitialParams extends Mock implements CreateMeetingInitialParams {}
class MockCreateMeetingNavigator extends Mock implements CreateMeetingNavigator {}
      
//DO-NOT-REMOVE MVP_MOCK_DEFINITION

// USE CASES
//DO-NOT-REMOVE USE_CASE_MOCK_DEFINITION

// REPOSITORIES
class MockAssessmentRepository extends Mock implements AssessmentRepository {}
class MockConferencesRepository extends Mock implements ConferencesRepository {}
//DO-NOT-REMOVE REPOSITORIES_MOCK_DEFINITION

// STORES
//DO-NOT-REMOVE STORES_MOCK_DEFINITION

