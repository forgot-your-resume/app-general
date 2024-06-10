enum ApiEndpoints {
  local,
  production,
  //
  ;

  const ApiEndpoints();

  String get endpoint => switch (this) {
        ApiEndpoints.local => 'http://localhost:8080',
        ApiEndpoints.production => 'https://api.beauty.versetech.app',
      };
}
