import 'package:equatable/equatable.dart';
import 'package:it_health_example/src/features/domain/entities/blood_pressure_data_entity.dart';

class BloodPressureEntity extends Equatable {
  final bool? status;
  final List<BloodPressureDataEntity>? data;

  const BloodPressureEntity({this.status, this.data});

  @override
  List<Object?> get props => [status, data];
}
