import 'package:dartz/dartz.dart';
import 'package:it_health_example/src/core/error/failures.dart';
import 'package:it_health_example/src/core/usecases/usecase.dart';
import 'package:it_health_example/src/features/data/dtos/login_dto.dart';
import 'package:it_health_example/src/features/domain/entities/login_entity.dart';
import 'package:it_health_example/src/features/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<LoginEntity?, LoginDTO> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, LoginEntity?>> call(LoginDTO params) async {
    return await repository.login(params);
  }
}
