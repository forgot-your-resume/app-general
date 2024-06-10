import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:forgot_your_resume/main.dart';
import 'package:forgot_your_resume/navigation/app_navigator.dart';

AppLocalizations? _appLocalizations;

/// Convenience getter for the app localizations
AppLocalizations get appLocalizations {
  _appLocalizations = isUnitTests ? _appLocalizations : AppLocalizations.of(AppNavigator.currentContext)!;
  return _appLocalizations!;
}

/// Useful method for tests to override app localizations
void overrideAppLocalizations(AppLocalizations localizations) {
  _appLocalizations = localizations;
}
