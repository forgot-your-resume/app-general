import 'package:mocktail/mocktail.dart';

import 'meetings_mock_definitions.dart';
//DO-NOT-REMOVE IMPORTS_MOCKS

class MeetingsMocks {

  // MVP

    static late MockMeetingsListViewModel meetingsListViewModel;
  static late MockMeetingsListPresentationViewState meetingsListPresentationViewState;
  static late MockMeetingsListInitialParams meetingsListInitialParams;
  static late MockMeetingsListNavigator meetingsListNavigator;
      
  static late MockAssessmentViewModel assessmentViewModel;
  static late MockAssessmentPresentationViewState assessmentPresentationViewState;
  static late MockAssessmentInitialParams assessmentInitialParams;
  static late MockAssessmentNavigator assessmentNavigator;
      
  static late MockGiveFeedbackViewModel giveFeedbackViewModel;
  static late MockGiveFeedbackPresentationViewState giveFeedbackPresentationViewState;
  static late MockGiveFeedbackInitialParams giveFeedbackInitialParams;
  static late MockGiveFeedbackNavigator giveFeedbackNavigator;
      
  static late MockCreateMeetingViewModel createMeetingViewModel;
  static late MockCreateMeetingPresentationViewState createMeetingPresentationViewState;
  static late MockCreateMeetingInitialParams createMeetingInitialParams;
  static late MockCreateMeetingNavigator createMeetingNavigator;
      
//DO-NOT-REMOVE MVP_MOCKS_STATIC_FIELD

  // USE CASES


  //DO-NOT-REMOVE USE_CASE_MOCKS_STATIC_FIELD

  // REPOSITORIES
  static late MockAssessmentRepository assessmentRepository;
static late MockConferencesRepository conferencesRepository;
//DO-NOT-REMOVE REPOSITORIES_MOCKS_STATIC_FIELD

  // STORES

  //DO-NOT-REMOVE STORES_MOCKS_STATIC_FIELD


  static void init() {
    _initMocks();
    _initFallbacks();
  }

  static void _initMocks() {
    //DO-NOT-REMOVE FEATURES_MOCKS
    // MVP
        meetingsListViewModel = MockMeetingsListViewModel();
    meetingsListPresentationViewState = MockMeetingsListPresentationViewState();
    meetingsListInitialParams = MockMeetingsListInitialParams();
    meetingsListNavigator = MockMeetingsListNavigator();
      
    assessmentViewModel = MockAssessmentViewModel();
    assessmentPresentationViewState = MockAssessmentPresentationViewState();
    assessmentInitialParams = MockAssessmentInitialParams();
    assessmentNavigator = MockAssessmentNavigator();
      
    giveFeedbackViewModel = MockGiveFeedbackViewModel();
    giveFeedbackPresentationViewState = MockGiveFeedbackPresentationViewState();
    giveFeedbackInitialParams = MockGiveFeedbackInitialParams();
    giveFeedbackNavigator = MockGiveFeedbackNavigator();
      
    createMeetingViewModel = MockCreateMeetingViewModel();
    createMeetingPresentationViewState = MockCreateMeetingPresentationViewState();
    createMeetingInitialParams = MockCreateMeetingInitialParams();
    createMeetingNavigator = MockCreateMeetingNavigator();
      
//DO-NOT-REMOVE MVP_INIT_MOCKS

    // USE CASES
    //DO-NOT-REMOVE USE_CASE_INIT_MOCKS

    // REPOSITORIES
    assessmentRepository = MockAssessmentRepository();
conferencesRepository = MockConferencesRepository();
//DO-NOT-REMOVE REPOSITORIES_INIT_MOCKS

    // STORES
    //DO-NOT-REMOVE STORES_INIT_MOCKS

  }

  static void _initFallbacks() {
    //DO-NOT-REMOVE FEATURES_FALLBACKS
    // MVP
        registerFallbackValue(MockMeetingsListViewModel());
    registerFallbackValue(MockMeetingsListPresentationViewState());
    registerFallbackValue(MockMeetingsListInitialParams());
    registerFallbackValue(MockMeetingsListNavigator());
      
    registerFallbackValue(MockAssessmentViewModel());
    registerFallbackValue(MockAssessmentPresentationViewState());
    registerFallbackValue(MockAssessmentInitialParams());
    registerFallbackValue(MockAssessmentNavigator());
      
    registerFallbackValue(MockGiveFeedbackViewModel());
    registerFallbackValue(MockGiveFeedbackPresentationViewState());
    registerFallbackValue(MockGiveFeedbackInitialParams());
    registerFallbackValue(MockGiveFeedbackNavigator());
      
    registerFallbackValue(MockCreateMeetingViewModel());
    registerFallbackValue(MockCreateMeetingPresentationViewState());
    registerFallbackValue(MockCreateMeetingInitialParams());
    registerFallbackValue(MockCreateMeetingNavigator());
      
//DO-NOT-REMOVE MVP_MOCK_FALLBACK_VALUE

    // USE CASES
    //DO-NOT-REMOVE USE_CASE_MOCK_FALLBACK_VALUE

    // REPOSITORIES
    registerFallbackValue(MockAssessmentRepository());
registerFallbackValue(MockConferencesRepository());
//DO-NOT-REMOVE REPOSITORIES_MOCK_FALLBACK_VALUE

    // STORES
    //DO-NOT-REMOVE STORES_MOCK_FALLBACK_VALUE

  }
}
