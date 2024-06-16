import 'package:mocktail/mocktail.dart';
import 'package:forgot_your_resume/features/auth/login/login_initial_params.dart';
import 'package:forgot_your_resume/features/auth/login/login_navigator.dart';
import 'package:forgot_your_resume/features/auth/login/login_presentation_view_state.dart';
import 'package:forgot_your_resume/features/auth/login/login_view_model.dart';
      
import 'package:forgot_your_resume/features/auth/signup/signup_initial_params.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_navigator.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_presentation_view_state.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_view_model.dart';
      
import 'package:forgot_your_resume/features/auth/domain/repositories/auth_repository.dart';
//DO-NOT-REMOVE IMPORTS_MOCK_DEFINITIONS

// MVP

class MockLoginViewModel extends MockCubit<LoginViewState> implements LoginViewModel {}
class MockLoginPresentationViewState extends Mock implements LoginPresentationViewState {}
class MockLoginInitialParams extends Mock implements LoginInitialParams {}
class MockLoginNavigator extends Mock implements LoginNavigator {}
      
class MockSignupViewModel extends MockCubit<SignupViewState> implements SignupViewModel {}
class MockSignupPresentationViewState extends Mock implements SignupPresentationViewState {}
class MockSignupInitialParams extends Mock implements SignupInitialParams {}
class MockSignupNavigator extends Mock implements SignupNavigator {}
      
//DO-NOT-REMOVE MVP_MOCK_DEFINITION

// USE CASES
//DO-NOT-REMOVE USE_CASE_MOCK_DEFINITION

// REPOSITORIES
class MockAuthRepository extends Mock implements AuthRepository {}
//DO-NOT-REMOVE REPOSITORIES_MOCK_DEFINITION

// STORES
//DO-NOT-REMOVE STORES_MOCK_DEFINITION

