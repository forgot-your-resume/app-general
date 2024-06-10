import 'package:dio/dio.dart';

class AuthHeaderInterceptor extends Interceptor {
  const AuthHeaderInterceptor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // if (_auth.currentUser != null) {
    //   options.headers['Authorization'] = 'Bearer ${await _auth.currentUser!.getIdToken()}';
    // }
    super.onRequest(options, handler);
  }
}
