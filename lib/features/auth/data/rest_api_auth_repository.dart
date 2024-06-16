import 'package:dartz/dartz.dart';
import 'package:forgot_your_resume/core/data/dio/api_service.dart';
import 'package:forgot_your_resume/core/data/dio/dio_service.dart';
import 'package:forgot_your_resume/core/data/utils/safe_convert.dart';
import 'package:forgot_your_resume/features/auth/domain/repositories/auth_repository.dart';

class RestApiAuthRepository implements AuthRepository {
  const RestApiAuthRepository(
    this._dioService,
  );

  final DioService _dioService;

  @override
  Future<Either<dynamic, String>> login(String username, String password) => _dioService.post(
        services: ApiServices.all,
        method: 'login',
        data: {
          'login': username,
          'password': password,
        },
        mappingFunc: (data) => asT(data, 'token'),
        errorMappingFunc: (e) => e,
        httpErrorMappingFunc: (e) => e,
      );

  @override
  Future<Either<dynamic, String>> signUp(String username, String password, String role) => _dioService.post(
        services: ApiServices.all,
        method: 'register',
        data: {
          'login': username,
          'password': password,
          'role': role,
        },
        mappingFunc: (data) => asT(data, 'token'),
        errorMappingFunc: (e) => e,
        httpErrorMappingFunc: (e) => e,
      );
}
