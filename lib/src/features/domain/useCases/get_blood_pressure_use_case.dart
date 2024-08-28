import 'package:dartz/dartz.dart';
import 'package:it_health_example/src/core/error/failures.dart';
import 'package:it_health_example/src/core/usecases/usecase.dart';
import 'package:it_health_example/src/features/domain/entities/blood_pressure_entity.dart';
import 'package:it_health_example/src/features/domain/repositories/blood_pressure_repository.dart';

class GetBloodPressureUseCase
    implements UseCase<BloodPressureEntity?, NoParams> {
  final BloodPressureRepository repository;

  GetBloodPressureUseCase(this.repository);

  @override
  Future<Either<Failure, BloodPressureEntity?>> call(NoParams params) async {
    return await repository.getUserBloodPressure();
  }
}
