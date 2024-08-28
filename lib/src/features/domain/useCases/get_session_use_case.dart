import 'package:dartz/dartz.dart';
import 'package:it_health_example/src/core/error/failures.dart';
import 'package:it_health_example/src/core/usecases/usecase.dart';
import 'package:it_health_example/src/features/domain/entities/login_entity.dart';
import 'package:it_health_example/src/features/domain/repositories/auth_repository.dart';

class GetSessionUseCase implements UseCase<LoginEntity?, NoParams> {
  final AuthRepository repository;

  GetSessionUseCase(this.repository);

  @override
  Future<Either<Failure, LoginEntity?>> call(NoParams params) async {
    return repository.getSession();
  }
}
