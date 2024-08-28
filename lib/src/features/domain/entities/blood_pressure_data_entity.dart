import 'package:equatable/equatable.dart';

class BloodPressureDataEntity extends Equatable {
  final String? date;
  final int? systolic;
  final int? diastolic;

  const BloodPressureDataEntity({this.date, this.systolic, this.diastolic});

  @override
  List<Object?> get props => [date, systolic, diastolic];
}
