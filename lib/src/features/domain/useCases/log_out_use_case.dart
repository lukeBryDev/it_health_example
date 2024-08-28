import 'package:dartz/dartz.dart';
import 'package:it_health_example/src/core/error/failures.dart';
import 'package:it_health_example/src/core/usecases/usecase.dart';
import 'package:it_health_example/src/features/domain/repositories/auth_repository.dart';

class LogOutUseCase implements UseCase<bool, NoParams> {
  final AuthRepository repository;

  LogOutUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return repository.logOut();
  }
}
