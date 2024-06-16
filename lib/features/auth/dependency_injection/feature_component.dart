import 'package:forgot_your_resume/dependency_injection/app_component.dart';
import 'package:forgot_your_resume/features/auth/login/login_initial_params.dart';
import 'package:forgot_your_resume/features/auth/login/login_navigator.dart';
import 'package:forgot_your_resume/features/auth/login/login_presentation_view_state.dart';
import 'package:forgot_your_resume/features/auth/login/login_view_model.dart';

import 'package:forgot_your_resume/features/auth/signup/signup_initial_params.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_navigator.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_presentation_view_state.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_view_model.dart';
import 'package:forgot_your_resume/navigation/app_navigator.dart';

import 'package:forgot_your_resume/features/auth/data/rest_api_auth_repository.dart';
import 'package:forgot_your_resume/features/auth/domain/repositories/auth_repository.dart';
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
  getIt..registerLazySingleton(() => AppNavigator)
      //DO-NOT-REMOVE GENERAL_DEPS_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureRepositories() {
  // ignore: unnecessary_statements
  getIt
        ..registerFactory<AuthRepository>(
          () => RestApiAuthRepository(
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
        ..registerFactory<LoginNavigator>(
          () => LoginNavigator(getIt()),
        )
        ..registerFactoryParam<LoginViewState, LoginInitialParams, dynamic>(
          (params, _) => LoginPresentationViewState.initial(params),
        )
        ..registerFactoryParam<LoginViewModel, LoginInitialParams, dynamic>(
          (params, _) => LoginViewModel(
            getIt(param1: params),
            getIt(),
            getIt(),
            // getIt(),
          ),
        )
        ..registerFactory<SignupNavigator>(
          () => SignupNavigator(getIt()),
        )
        ..registerFactoryParam<SignupViewState, SignupInitialParams, dynamic>(
          (params, _) => SignupPresentationViewState.initial(params),
        )
        ..registerFactoryParam<SignupViewModel, SignupInitialParams, dynamic>(
          (params, _) => SignupViewModel(
            getIt(param1: params),
            getIt(),
            getIt(),
          ),
        )

//DO-NOT-REMOVE MVP_GET_IT_CONFIG
      ;
}
