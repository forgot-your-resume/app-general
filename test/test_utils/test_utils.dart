import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:dartz/dartz.dart';
import 'package:forgot_your_resume/core/data/dio/api_endpoints.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:forgot_your_resume/core/helpers.dart';
import 'package:forgot_your_resume/core/utils/either_extensions.dart';
import 'package:forgot_your_resume/dependency_injection/app_component.dart';
import 'package:forgot_your_resume/main.dart';
import 'package:meta/meta.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mocks.dart';

Future<Either<F, S>> successFuture<F, S>(S result) => Future.value(success(result));

Future<Either<F, S>> failFuture<F, S>(F fail) => Future.value(failure(fail));

Future<void> prepareAppForUnitTests() async {
  isUnitTests = true;
  resetMocktailState();
  Mocks.init();
  notImplemented = ({message, context}) => doNothing();
  // overrideAppLocalizations(AppLocalizationsEn());
  await configureDependenciesForTests();
}

Future<void> configureDependenciesForTests() async {
  await getIt.reset();
  getIt.allowReassignment = true;
  configureDependencies(
    ApiEndpoints.local,
  );
}

Future<void> preparePageTests(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // overrideAppLocalizations(AppLocalizationsEn());
  await loadAppFonts();
  await prepareAppForUnitTests();
  // ignore: do_not_use_environment
  const isCi = bool.fromEnvironment('isCI');

  return AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(
        // ignore: avoid_redundant_argument_values
        enabled: !isCi,
      ),
    ),
    run: () async {
      return testMain();
    },
  );
}

/// helper method to re-register given dependency in tests
void reRegister<T extends Object>(T obj) {
  getIt.registerFactory<T>(() => obj);
}

extension MocktailWhenEither<T, L, R> on When<Future<Either<L, R>>> {
  void thenSuccess(R Function(Invocation) success) => thenAnswer((invocation) => successFuture(success(invocation)));

  void thenFailure(L Function(Invocation) failure) => thenAnswer((invocation) => failFuture(failure(invocation)));
}
