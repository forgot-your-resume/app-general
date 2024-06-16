import 'package:dartz/dartz.dart';
import 'package:forgot_your_resume/core/utils/future_result.dart';
import 'package:forgot_your_resume/features/auth/login/login_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class LoginPresentationViewState implements LoginViewState {
  /// Creates the initial state
  LoginPresentationViewState.initial(
    // ignore: avoid_unused_constructor_parameters
    LoginInitialParams initialParams,
  )   : username = '',
        password = '',
        loginResult = const FutureResult.empty();

  /// Used for the copyWith method
  LoginPresentationViewState._({
    required this.username,
    required this.password,
    required this.loginResult,
  });

  @override
  final String username;

  @override
  final String password;

  final FutureResult<Either> loginResult;

  @override
  bool get isLoading => loginResult.isPending();

  LoginPresentationViewState copyWith({
    String? username,
    String? password,
    FutureResult<Either>? loginResult,
  }) {
    return LoginPresentationViewState._(
      username: username ?? this.username,
      password: password ?? this.password,
      loginResult: loginResult ?? this.loginResult,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class LoginViewState {
  String get username;
  String get password;

  bool get isLoading;
}
