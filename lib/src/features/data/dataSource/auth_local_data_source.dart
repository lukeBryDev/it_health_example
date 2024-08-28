import 'package:hive/hive.dart';
import 'package:it_health_example/src/core/database/collections_name.dart';
import 'package:it_health_example/src/core/error/failures.dart';
import 'package:it_health_example/src/features/domain/entities/login_entity.dart';

abstract class AuthLocalDataSource {
  bool saveSession(LoginEntity params);

  bool clearSession();

  LoginEntity? getSession();

  bool logOut();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  bool saveSession(LoginEntity params) {
    try {
      Box<LoginEntity> authBox = Hive.box<LoginEntity>(HiveCollections.auth);
      authBox.put('session', params);
      return true;
    } on HiveError catch (e) {
      throw HiveFailure(e);
    }
  }

  @override
  bool clearSession() {
    try {
      Box<LoginEntity> authBox = Hive.box<LoginEntity>(HiveCollections.auth);
      authBox.delete('session');
      return true;
    } on HiveError catch (e) {
      throw HiveFailure(e);
    }
  }

  @override
  LoginEntity? getSession() {
    try {
      Box<LoginEntity> authBox = Hive.box<LoginEntity>(HiveCollections.auth);
      return authBox.get('session');
    } on HiveError catch (e) {
      throw HiveFailure(e);
    }
  }

  @override
  bool logOut() {
    try {
      Box<LoginEntity> authBox = Hive.box<LoginEntity>(HiveCollections.auth);
      authBox.delete('session');
      return (getSession() == null);
    } on HiveError catch (e) {
      throw HiveFailure(e);
    }
  }
}
