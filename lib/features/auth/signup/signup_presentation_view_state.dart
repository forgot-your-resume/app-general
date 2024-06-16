import 'package:dartz/dartz.dart';
import 'package:forgot_your_resume/core/utils/future_result.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class SignupPresentationViewState implements SignupViewState {
  /// Creates the initial state
  SignupPresentationViewState.initial(
    // ignore: avoid_unused_constructor_parameters
    SignupInitialParams initialParams,
  )   : username = '',
        password = '',
        role = 'соискатель',
        signupResult = const FutureResult.empty();

  /// Used for the copyWith method
  SignupPresentationViewState._({
    required this.username,
    required this.password,
    required this.role,
    required this.signupResult,
  });

  @override
  final String username;

  @override
  final String password;

  @override
  final String role;

  final FutureResult<Either> signupResult;

  @override
  List<String> get roles => ['соискатель', 'рекрутер', 'эксперт'];

  @override
  bool get isLoading => signupResult.isPending();

  SignupPresentationViewState copyWith({
    String? username,
    String? password,
    String? role,
    FutureResult<Either>? signupResult,
  }) {
    return SignupPresentationViewState._(
      username: username ?? this.username,
      password: password ?? this.password,
      role: role ?? this.role,
      signupResult: signupResult ?? this.signupResult,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class SignupViewState {
  List<String> get roles;
  String get username;
  String get password;
  String get role;
  bool get isLoading;
}
