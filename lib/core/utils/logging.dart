//ignore: long-parameter-list
void logError(
  dynamic error, {
  StackTrace? stack,
  String? reason,
  bool logToCrashlytics = true,
  bool fatal = false,
}) {
  print(error.toString());
}

void debugLog(
  String message, [
  dynamic caller,
]) {
  print(message);
}
