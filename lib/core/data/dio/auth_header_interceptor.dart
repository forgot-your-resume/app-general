import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

String _authToken = '';

String get authToken => _authToken;
set authToken(String value) {
  // getIt<SharedPreferences>().setString('token', value);
  _authToken = value;
}

String get userIdFromToken {
  try {
    final payload = JwtDecoder.decode(_authToken);
    if (payload.containsKey('userId')) {
      return payload['userId'] as String;
    }
  } catch (e) {
    // ignore
  }
  return '';
}

bool get isValidAuthToken {
  return authToken.isNotEmpty && !JwtDecoder.isExpired(authToken);
}

class AuthHeaderInterceptor extends Interceptor {
  const AuthHeaderInterceptor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (authToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $authToken';
    }
    super.onRequest(options, handler);
  }
}
