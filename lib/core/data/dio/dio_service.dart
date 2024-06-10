import 'package:forgot_your_resume/core/data/dio/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:forgot_your_resume/core/data/models/rest_api_error_response.dart';
import 'package:forgot_your_resume/core/utils/either_extensions.dart';

typedef MappingFunc<R> = R Function(dynamic);
typedef ErrorMappingFunc<R> = R Function(dynamic);
typedef HttpErrorMappingFunc<R> = R Function(RestApiErrorResponse);

class DioService {
  DioService({
    required Dio client,
    List<Interceptor> interceptors = const [],
  }) : _dio = client {
    _dio.interceptors.addAll(interceptors);
  }

  final Dio _dio;

  Future<Either<E, R>> get<E, R>({
    required ApiServices services,
    required String method,
    Map<String, dynamic> query = const {},
    required MappingFunc<R> mappingFunc,
    required ErrorMappingFunc<E> errorMappingFunc,
    required HttpErrorMappingFunc<E> httpErrorMappingFunc,
    Object? data,
  }) =>
      _request(
        services: services,
        method: method,
        query: query,
        mappingFunc: mappingFunc,
        errorMappingFunc: errorMappingFunc,
        httpErrorMappingFunc: httpErrorMappingFunc,
        options: checkOptions('GET', null),
        data: data,
      );

  Future<Either<E, R>> post<E, R>({
    required ApiServices services,
    required String method,
    required MappingFunc<R> mappingFunc,
    required ErrorMappingFunc<E> errorMappingFunc,
    required HttpErrorMappingFunc<E> httpErrorMappingFunc,
    Object? data,
  }) =>
      _request(
        services: services,
        method: method,
        mappingFunc: mappingFunc,
        errorMappingFunc: errorMappingFunc,
        httpErrorMappingFunc: httpErrorMappingFunc,
        options: checkOptions('POST', null),
        data: data,
      );

  Future<Either<E, R>> put<E, R>({
    required ApiServices services,
    required String method,
    required MappingFunc<R> mappingFunc,
    required ErrorMappingFunc<E> errorMappingFunc,
    required HttpErrorMappingFunc<E> httpErrorMappingFunc,
    Object? data,
  }) =>
      _request(
        services: services,
        method: method,
        mappingFunc: mappingFunc,
        errorMappingFunc: errorMappingFunc,
        httpErrorMappingFunc: httpErrorMappingFunc,
        options: checkOptions('PUT', null),
        data: data,
      );

  Future<Either<E, R>> delete<E, R>({
    required ApiServices services,
    required String method,
    required MappingFunc<R> mappingFunc,
    required ErrorMappingFunc<E> errorMappingFunc,
    required HttpErrorMappingFunc<E> httpErrorMappingFunc,
    Object? data,
  }) =>
      _request(
        services: services,
        method: method,
        mappingFunc: mappingFunc,
        errorMappingFunc: errorMappingFunc,
        httpErrorMappingFunc: httpErrorMappingFunc,
        options: checkOptions('DELETE', null),
        data: data,
      );

  Future<Either<E, R>> _request<E, R>({
    required ApiServices services,
    required String method,
    Map<String, dynamic> query = const {},
    required MappingFunc<R> mappingFunc,
    required ErrorMappingFunc<E> errorMappingFunc,
    required HttpErrorMappingFunc<E> httpErrorMappingFunc,
    required options,
    Object? data,
  }) async {
    try {
      final response = await _dio.request(
        '${services.endpoint}$method',
        data: data,
        options: options,
        queryParameters: query,
      );
      if (response.statusCode == null) {
        return failure(response.data);
      }
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return success(mappingFunc(response.data));
      } else {
        return failure(
          httpErrorMappingFunc(RestApiErrorResponse.fromData(response.data)),
        );
      }
    } catch (e) {
      try {
        if (e is DioException && e.response != null) {
          return failure(
            httpErrorMappingFunc(RestApiErrorResponse.fromData(e.response!.data)),
          );
        }
      } catch (e) {
        return failure(errorMappingFunc(e));
      }
      return failure(errorMappingFunc(e));
    }
  }

  Options checkOptions(String method, Options? options) {
    options ??= Options();
    options.method = method;
    return options;
  }
}
