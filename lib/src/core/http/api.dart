import 'package:dio/dio.dart';
import 'package:it_health_example/src/core/env/env.dart';
import 'package:it_health_example/src/core/http/app_interceptors.dart';

class ApiProvider {
  final String _baseApiUrl = Env.api;

  late Dio dio;

  ApiProvider() {
    dio = Dio(BaseOptions(baseUrl: _baseApiUrl));
    dio.interceptors.add(AppInterceptors());
  }
}
