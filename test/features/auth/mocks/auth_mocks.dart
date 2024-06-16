import 'package:mocktail/mocktail.dart';

import 'auth_mock_definitions.dart';
//DO-NOT-REMOVE IMPORTS_MOCKS

class AuthMocks {

  // MVP

    static late MockLoginViewModel loginViewModel;
  static late MockLoginPresentationViewState loginPresentationViewState;
  static late MockLoginInitialParams loginInitialParams;
  static late MockLoginNavigator loginNavigator;
      
  static late MockSignupViewModel signupViewModel;
  static late MockSignupPresentationViewState signupPresentationViewState;
  static late MockSignupInitialParams signupInitialParams;
  static late MockSignupNavigator signupNavigator;
      
//DO-NOT-REMOVE MVP_MOCKS_STATIC_FIELD

  // USE CASES


  //DO-NOT-REMOVE USE_CASE_MOCKS_STATIC_FIELD

  // REPOSITORIES
  static late MockAuthRepository authRepository;
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
        loginViewModel = MockLoginViewModel();
    loginPresentationViewState = MockLoginPresentationViewState();
    loginInitialParams = MockLoginInitialParams();
    loginNavigator = MockLoginNavigator();
      
    signupViewModel = MockSignupViewModel();
    signupPresentationViewState = MockSignupPresentationViewState();
    signupInitialParams = MockSignupInitialParams();
    signupNavigator = MockSignupNavigator();
      
//DO-NOT-REMOVE MVP_INIT_MOCKS

    // USE CASES
    //DO-NOT-REMOVE USE_CASE_INIT_MOCKS

    // REPOSITORIES
    authRepository = MockAuthRepository();
//DO-NOT-REMOVE REPOSITORIES_INIT_MOCKS

    // STORES
    //DO-NOT-REMOVE STORES_INIT_MOCKS

  }

  static void _initFallbacks() {
    //DO-NOT-REMOVE FEATURES_FALLBACKS
    // MVP
        registerFallbackValue(MockLoginViewModel());
    registerFallbackValue(MockLoginPresentationViewState());
    registerFallbackValue(MockLoginInitialParams());
    registerFallbackValue(MockLoginNavigator());
      
    registerFallbackValue(MockSignupViewModel());
    registerFallbackValue(MockSignupPresentationViewState());
    registerFallbackValue(MockSignupInitialParams());
    registerFallbackValue(MockSignupNavigator());
      
//DO-NOT-REMOVE MVP_MOCK_FALLBACK_VALUE

    // USE CASES
    //DO-NOT-REMOVE USE_CASE_MOCK_FALLBACK_VALUE

    // REPOSITORIES
    registerFallbackValue(MockAuthRepository());
//DO-NOT-REMOVE REPOSITORIES_MOCK_FALLBACK_VALUE

    // STORES
    //DO-NOT-REMOVE STORES_MOCK_FALLBACK_VALUE

  }
}
