import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:it_health_example/src/core/error/failures.dart';
import 'package:it_health_example/src/features/data/dataSource/auth_local_data_source.dart';
import 'package:it_health_example/src/features/data/dataSource/auth_remote_data_source.dart';
import 'package:it_health_example/src/features/data/dtos/login_dto.dart';
import 'package:it_health_example/src/features/domain/entities/login_entity.dart';
import 'package:it_health_example/src/features/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, LoginEntity?>> login(LoginDTO params) async {
    try {
      LoginEntity remoteRes = await remoteDataSource.login(params);
      if (remoteRes.token != null) {
        localDataSource.saveSession(remoteRes);
        return Right(remoteRes);
      } else {
        return const Right(null);
      }
    } on ServerFailure catch (server) {
      return Left(server);
    } on DioException catch (e) {
      throw ServerFailure(error: e).extract;
    } on HiveError catch (e) {
      throw HiveFailure(e);
    } on Exception catch (error) {
      throw ExceptionFailure(error: error).extract;
    }
  }

  @override
  Either<Failure, LoginEntity?> getSession() {
    try {
      return Right(localDataSource.getSession());
    } on HiveError catch (e) {
      throw HiveFailure(e);
    }
  }

  @override
  Either<Failure, bool> logOut() {
    try {
      final res = localDataSource.logOut();
      return Right(res);
    } on HiveError catch (e) {
      throw HiveFailure(e);
    }
  }
}
