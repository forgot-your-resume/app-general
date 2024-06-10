import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forgot_your_resume/app.dart';
import 'package:forgot_your_resume/core/data/dio/api_endpoints.dart';
import 'package:forgot_your_resume/core/utils/logging.dart';

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
        const App(
          page: Text("Works"),
          beautyverseEndpoints: kReleaseMode ? ApiEndpoints.production : endpoint,
        ),
      );
    },
    (error, stack) => logError(error, stack: stack, fatal: false),
  );
}
