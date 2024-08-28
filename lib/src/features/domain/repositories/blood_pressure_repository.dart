import 'package:dartz/dartz.dart';
import 'package:it_health_example/src/core/error/failures.dart';
import 'package:it_health_example/src/features/domain/entities/blood_pressure_entity.dart';

abstract class BloodPressureRepository {
  Future<Either<Failure, BloodPressureEntity?>> getUserBloodPressure();
}
