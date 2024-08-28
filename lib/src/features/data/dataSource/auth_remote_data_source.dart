import 'package:dio/dio.dart';
import 'package:it_health_example/src/core/error/failures.dart';
import 'package:it_health_example/src/core/http/api.dart';
import 'package:it_health_example/src/features/data/dtos/login_dto.dart';
import 'package:it_health_example/src/features/data/models/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login(LoginDTO params);
}

class AuthRemoteDataSourceImpl extends ApiProvider
    implements AuthRemoteDataSource {
  @override
  Future<LoginModel> login(LoginDTO params) async {
    try {
      const path = '/login';
      final res = await dio.get(path, queryParameters: params.queryParams());
      return LoginModel.fromJson(res.data);
    } on DioException catch (e) {
      throw ServerFailure(error: e).extract;
    } on Error catch (error) {
      throw ErrorFailure(error: error).extract;
    } on Exception catch (error) {
      throw ExceptionFailure(error: error).extract;
    }
  }
}
