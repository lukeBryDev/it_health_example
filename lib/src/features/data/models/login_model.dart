import 'package:it_health_example/src/features/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({bool? status, String? token})
      : super(status: status, token: token);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['estado'],
      token: json['token'],
    );
  }
}
