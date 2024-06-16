import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forgot_your_resume/app.dart';
import 'package:forgot_your_resume/core/data/dio/api_endpoints.dart';
import 'package:forgot_your_resume/core/data/dio/auth_header_interceptor.dart';
import 'package:forgot_your_resume/core/utils/logging.dart';
import 'package:forgot_your_resume/features/auth/login/login_initial_params.dart';
import 'package:forgot_your_resume/features/auth/login/login_page.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_page.dart';

bool _isUnitTests = false;

bool get isUnitTests => _isUnitTests;

// ignore: avoid_positional_boolean_parameters
set isUnitTests(bool value) {
  _isUnitTests = value;
}

Future<void> main() async {
  await runZonedGuarded(
    () async {
      const endpoint = ApiEndpoints.local;

      WidgetsFlutterBinding.ensureInitialized();

      // await Firebase.initializeApp(
      //   options: DefaultFirebaseOptions.currentPlatform,
      // );

      // FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(!kDebugMode);

      // FlutterError.onError = (errorDetails) {
      //   if (kReleaseMode) {
      //     logError(errorDetails, fatal: true);
      //     FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      //   }
      // };
      // PlatformDispatcher.instance.onError = (error, stack) {
      //   logError(error, stack: stack, fatal: true);
      //   return true;
      // };

      // ErrorWidget.builder = (details) {
      //   final Object exception = details.exception;

      //   logError(details, stack: details.stack, fatal: false);

      //   return ErrorWidget.withDetails(
      //     message: details.exception.toString(),
      //     error: exception is FlutterError ? exception : null,
      //   );
      // };

      runApp(
        App(
          page: isValidAuthToken
              ? const MeetingsListPage(initialParams: MeetingsListInitialParams())
              : const LoginPage(initialParams: LoginInitialParams()),
          beautyverseEndpoints: kReleaseMode ? ApiEndpoints.production : endpoint,
          // sharedPreferences: await SharedPreferences.getInstance(),
        ),
      );
    },
    (error, stack) => logError(error, stack: stack, fatal: false),
  );
}
