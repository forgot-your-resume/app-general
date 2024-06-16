import 'package:dartz/dartz.dart';

abstract class AssessmentRepository {
  Future<Either<dynamic, Unit>> giveFeedback(
    String applicantId,
    String conferenceId,
    int score,
    bool isMatch,
    String comment,
  );
}
