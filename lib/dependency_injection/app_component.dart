import 'package:forgot_your_resume/core/data/dio/auth_header_interceptor.dart';
import 'package:forgot_your_resume/core/data/dio/dio_service.dart';
import 'package:forgot_your_resume/features/auth/dependency_injection/feature_component.dart' as auth;
import 'package:forgot_your_resume/features/meetings/dependency_injection/feature_component.dart' as meetings;
//DO-NOT-REMOVE APP_COMPONENT_IMPORTS
import 'package:forgot_your_resume/core/data/dio/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:forgot_your_resume/navigation/app_navigator.dart';
import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

T maybeGetIt<T extends Object>({required T Function() orElse}) {
  return getIt.isRegistered<T>() ? getIt() : orElse();
}

/// registers all the dependencies in dependency graph in get_it package
// ignore: long-method
void configureDependencies(
  ApiEndpoints apiEndpoints,
  // SharedPreferences sharedPreferences,
) {
  auth.configureDependencies();
  meetings.configureDependencies();
//DO-NOT-REMOVE FEATURE_COMPONENT_INIT

  _configureGeneralDependencies(
      // sharedPreferences,
      );
  _configureRepositories();
  _configureStores();
  _configureUseCases();
  _configureMvp();
  _configureDios(apiEndpoints);
}

//ignore: long-method
void _configureGeneralDependencies(
    // SharedPreferences sharedPreferences,
    ) {
  getIt..registerLazySingleton(() => AppNavigator())
      // ..registerLazySingleton(() => sharedPreferences)
      //
      ;
}

//ignore: long-method
void _configureRepositories() {
  // ignore: unnecessary_statements
  getIt

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
void _configureDios(ApiEndpoints endpoint) {
  // ignore: unnecessary_statements
  getIt.registerLazySingleton(
    () => DioService(
      client: Dio(
        BaseOptions(
          baseUrl: endpoint.endpoint,
          headers: {
            'User-Agent': "Beauterra-web",
          },
        ),
      ),
      interceptors: [
        AuthHeaderInterceptor(),
      ],
    ),
  );
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
      //DO-NOT-REMOVE MVP_GET_IT_CONFIG

      ;
}
