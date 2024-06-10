import 'package:forgot_your_resume/core/data/utils/safe_convert.dart';

class RestApiErrorResponse {
  const RestApiErrorResponse({
    required this.description,
    required this.errorCode,
    required this.statusCode,
  });

  factory RestApiErrorResponse.fromData(Map<String, dynamic> json) {
    return RestApiErrorResponse(
      description: asT(json, 'description', defaultValue: ''),
      errorCode: asT(json, 'error_code', defaultValue: ''),
      statusCode: asT(json, 'status_code', defaultValue: 0),
    );
  }

  final String description;
  final String errorCode;
  final int statusCode;

  @override
  String toString() {
    return "Status $statusCode ($errorCode), $description";
  }
}
