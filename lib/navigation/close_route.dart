import 'package:forgot_your_resume/navigation/app_navigator.dart';

mixin CloseRoute {
  AppNavigator get appNavigator;

  void close() => appNavigator.close();
}
