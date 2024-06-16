import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgot_your_resume/core/data/dio/auth_header_interceptor.dart';
import 'package:forgot_your_resume/core/utils/bloc_extensions.dart';
import 'package:forgot_your_resume/core/utils/either_extensions.dart';
import 'package:forgot_your_resume/core/utils/logging.dart';
import 'package:forgot_your_resume/features/auth/domain/repositories/auth_repository.dart';
import 'package:forgot_your_resume/features/auth/login/login_navigator.dart';
import 'package:forgot_your_resume/features/auth/login/login_presentation_view_state.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_initial_params.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_initial_params.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends Cubit<LoginViewState> {
  LoginViewModel(
    super.model,
    this.navigator,
    this._authRepository,
    // this._sharedPreferences,
  );

  final LoginNavigator navigator;
  final AuthRepository _authRepository;
  // final SharedPreferences _sharedPreferences;

  // ignore: unused_element
  LoginPresentationViewState get _model => state as LoginPresentationViewState;

  void onInit() {
    // final localToken = _sharedPreferences.getString('token') ?? '';
    // if (localToken.isNotEmpty && !JwtDecoder.isExpired(localToken)) {
    //   authToken = localToken;
    //   navigator.openMeetingsList(
    //     const MeetingsListInitialParams(),
    //   );
    // }
  }

  void onChangeUsername(String username) => emit(
        _model.copyWith(username: username),
      );

  void onChangePassword(String password) => emit(
        _model.copyWith(password: password),
      );

  void onTapLogin() => _authRepository
      .login(_model.username, _model.password)
      .doOn(success: (token) => authToken = token)
      .doOn(
        success: (_) => navigator.openMeetingsList(
          const MeetingsListInitialParams(),
        ),
        fail: (fail) => debugLog(fail.toString()),
      )
      .observeStatusChanges(
        (result) => emit(
          _model.copyWith(loginResult: result),
        ),
      );

  void onTapRegister() => navigator.openSignup(
        const SignupInitialParams(),
      );
}
