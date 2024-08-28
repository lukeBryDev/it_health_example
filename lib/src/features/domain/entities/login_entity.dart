import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part 'login_entity.g.dart';

@HiveType(typeId: 0)
class LoginEntity extends Equatable {
  @HiveField(0)
  final bool? status;
  @HiveField(1)
  final String? token;

  const LoginEntity({this.status, this.token});

  @override
  List<Object?> get props => [status, token];
}
