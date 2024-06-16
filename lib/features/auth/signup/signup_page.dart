import 'package:flutter/material.dart';
import 'package:forgot_your_resume/core/utils/mvp_extensions.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_presentation_view_state.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_view_model.dart';
import 'package:forgot_your_resume/features/auth/signup/signup_initial_params.dart';
import 'package:forgot_your_resume/uikit/progress_indicator.dart';

class SignupPage extends StatefulWidget with HasInitialParams {
  const SignupPage({
    super.key,
    required this.initialParams,
  });

  @override
  final SignupInitialParams initialParams;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with ViewModelStateMixinAuto<SignupViewState, SignupViewModel, SignupPage> {
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
                const SizedBox(height: 8),
                DropdownMenu<String>(
                  initialSelection: state.roles.first,
                  requestFocusOnTap: true,
                  label: const Text('Роль'),
                  onSelected: viewModel.onChangeRole,
                  dropdownMenuEntries: state.roles
                      .map<DropdownMenuEntry<String>>(
                        (role) => DropdownMenuEntry<String>(
                          value: role,
                          label: role,
                          style: MenuItemButton.styleFrom(
                            minimumSize: const Size(344, 40),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 24),
                stateObserver(
                  builder: (context, state) => OutlinedButton(
                    onPressed: state.isLoading ? null : viewModel.onTapRegister,
                    child: state.isLoading ? const LoadingIndicator() : const Text('Зарегистрироваться'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
