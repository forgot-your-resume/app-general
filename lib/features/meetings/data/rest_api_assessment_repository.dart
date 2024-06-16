import 'package:dartz/dartz.dart';
import 'package:forgot_your_resume/core/data/dio/api_service.dart';
import 'package:forgot_your_resume/core/data/dio/dio_service.dart';
import 'package:forgot_your_resume/features/meetings/domain/repositories/assessment_repository.dart';

class RestApiAssessmentRepository implements AssessmentRepository {
  const RestApiAssessmentRepository(
    this._dioService,
  );

  final DioService _dioService;

  @override
  Future<Either<dynamic, Unit>> giveFeedback(
    String applicantId,
    String conferenceId,
    int score,
    bool isMatch,
    String comment,
  ) =>
      _dioService.post(
        services: ApiServices.all,
        method: '/add_score',
        data: {
          "applicantId": applicantId,
          "conferenceId": conferenceId,
          "score": score,
          "isMatch": isMatch,
          "comment": comment,
        },
        mappingFunc: (_) => unit,
        errorMappingFunc: (e) => e,
        httpErrorMappingFunc: (e) => e,
      );
}
