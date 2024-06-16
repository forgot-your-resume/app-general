import 'package:flutter/material.dart';
import 'package:forgot_your_resume/navigation/app_navigator.dart';

Future<T?> showPopUpDialog<T>(
  Widget child, {
  bool useRootNavigator = false,
}) async {
  final currentContext = AppNavigator.currentContext;
  final theme = Theme.of(currentContext);

  return showDialog(
    useRootNavigator: useRootNavigator,
    context: currentContext,
    builder: (context) => Center(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: child,
          ),
        ),
      ),
    ),
  );
}

class AppTheme {}
