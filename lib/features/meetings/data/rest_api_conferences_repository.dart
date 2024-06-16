import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:forgot_your_resume/core/data/dio/api_service.dart';
import 'package:forgot_your_resume/core/data/dio/dio_service.dart';
import 'package:forgot_your_resume/core/data/utils/safe_convert.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/assessment_question.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/conference.dart';
import 'package:forgot_your_resume/features/meetings/domain/repositories/conferences_repository.dart';

class RestApiConferencesRepository implements ConferencesRepository {
  const RestApiConferencesRepository(
    this._dioService,
  );

  final DioService _dioService;

  @override
  Future<Either<dynamic, List<Conference>>> getConferences() => _dioService.get(
        services: ApiServices.all,
        method: '/conferences',
        mappingFunc: (data) => (data as List)
            .map(
              (e) => Conference(
                id: asT(e, 'id'),
                name: asT(e, 'name'),
                dateTime: DateTime.fromMillisecondsSinceEpoch(asT<int>(e, 'dateTime')),
                conferenceToken: asT(e, 'token'),
                questions: asListOfObj(
                  e,
                  'questions',
                  (d) => AssessmentQuestion(
                    id: Random.secure().nextInt(1000).toString(),
                    question: asT(d, 'question'),
                    answer: asT(d, 'answer'),
                  ),
                ),
                userIds: asListPrimitive(e, 'userIDs'),
              ),
            )
            .toList(),
        errorMappingFunc: (e) => e,
        httpErrorMappingFunc: (e) => e,
      );

  @override
  Future<Either<dynamic, Unit>> createConference(Conference conference) => _dioService.post(
        services: ApiServices.all,
        method: '/create_conference',
        data: {
          'name': conference.name,
          'dateTime': conference.dateTime.millisecondsSinceEpoch,
        },
        mappingFunc: (_) => unit,
        errorMappingFunc: (e) => e,
        httpErrorMappingFunc: (e) => e,
      );
}
