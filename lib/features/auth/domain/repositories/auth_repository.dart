import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<dynamic, String>> login(
    String username,
    String password,
  );
  
  Future<Either<dynamic, String>> signUp(
    String username,
    String password,
    String role,
  );
}
