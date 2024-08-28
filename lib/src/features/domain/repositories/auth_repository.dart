import 'package:dartz/dartz.dart';
import 'package:it_health_example/src/core/error/failures.dart';
import 'package:it_health_example/src/features/data/dtos/login_dto.dart';
import 'package:it_health_example/src/features/domain/entities/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity?>> login(LoginDTO params);

  Either<Failure, LoginEntity?> getSession();

  Either<Failure, bool> logOut();
}
