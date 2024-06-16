import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgot_your_resume/core/data/dio/auth_header_interceptor.dart';
import 'package:forgot_your_resume/core/utils/bloc_extensions.dart';
import 'package:forgot_your_resume/core/utils/either_extensions.dart';
import 'package:forgot_your_resume/core/utils/logging.dart';
import 'package:forgot_your_resume/features/auth/domain/repositories/auth_repository.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_navigator.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_initial_params.dart';

class SignupViewModel extends Cubit<SignupViewState> {
  SignupViewModel(
    super.model,
    this.navigator,
    this._authRepository,
  );

  final SignupNavigator navigator;
  final AuthRepository _authRepository;

  // ignore: unused_element
  SignupPresentationViewState get _model => state as SignupPresentationViewState;

  void onChangeUsername(String username) => emit(
        _model.copyWith(username: username),
      );

  void onChangePassword(String password) => emit(
        _model.copyWith(password: password),
      );

  void onChangeRole(String? role) => emit(
        _model.copyWith(role: role),
      );

  void onTapRegister() => _authRepository
      .signUp(_model.username, _model.password, _model.role)
      .doOn(success: (token) => authToken = token)
      .doOn(
        success: (_) => navigator.openMeetingsList(
          const MeetingsListInitialParams(),
        ),
        fail: (fail) => debugLog(fail.toString()),
      )
      .observeStatusChanges(
        (result) => emit(_model.copyWith(signupResult: result)),
      );
}
