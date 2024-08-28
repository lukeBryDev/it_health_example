import 'package:it_health_example/src/features/domain/entities/blood_pressure_data_entity.dart';

class BloodPressureDataModel extends BloodPressureDataEntity {
  const BloodPressureDataModel({
    String? date,
    int? systolic,
    int? diastolic,
  }) : super(
          date: date,
          systolic: systolic,
          diastolic: diastolic,
        );

  factory BloodPressureDataModel.fromJson(Map<String, dynamic> json) {
    return BloodPressureDataModel(
      date: json['fecha'],
      systolic: int.tryParse('${json['sistólica']}'),
      diastolic: int.tryParse('${json['diastólica']}'),
    );
  }
}
