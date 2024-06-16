import 'package:dartz/dartz.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/conference.dart';

abstract class ConferencesRepository {
  Future<Either<dynamic, List<Conference>>> getConferences();

  Future<Either<dynamic, Unit>> createConference(Conference conference);
}
