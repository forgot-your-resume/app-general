//ignore_for_file: unused-files
import 'package:forgot_your_resume/navigation/app_navigator.dart';

//ignore: unused-code
mixin CloseWithResultRoute<T> {
  AppNavigator get appNavigator;

  void closeWithResult(T? result) => appNavigator.closeWithResult(result);
}
