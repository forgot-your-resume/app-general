import 'package:flutter/material.dart';
import 'package:forgot_your_resume/core/utils/mvp_extensions.dart';
import 'package:forgot_your_resume/features/auth/login/login_presentation_view_state.dart';
import 'package:forgot_your_resume/features/auth/login/login_view_model.dart';
import 'package:forgot_your_resume/features/auth/login/login_initial_params.dart';
import 'package:forgot_your_resume/uikit/progress_indicator.dart';

class LoginPage extends StatefulWidget with HasInitialParams {
  const LoginPage({
    super.key,
    required this.initialParams,
  });

  @override
  final LoginInitialParams initialParams;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ViewModelStateMixinAuto<LoginViewState, LoginViewModel, LoginPage> {
  @override
  void initState() {
    viewModel.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Логин',
                  ),
                  onChanged: viewModel.onChangeUsername,
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Пароль',
                  ),
                  obscureText: true,
                  onChanged: viewModel.onChangePassword,
                ),
                const SizedBox(height: 24),
                stateObserver(
                  builder: (context, state) => OutlinedButton(
                    onPressed: state.isLoading ? null : viewModel.onTapLogin,
                    child: state.isLoading ? const LoadingIndicator() : const Text('Войти'),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: viewModel.onTapRegister,
                  child: const Text('Регистрация'),
                ),
              ],
            ),
          ),
        ),
      );
}
