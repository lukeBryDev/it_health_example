import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:it_health_example/injection_container.dart';
import 'package:it_health_example/src/core/usecases/usecase.dart';
import 'package:it_health_example/src/features/app/presentation/pages/login/login_page.dart';
import 'package:it_health_example/src/features/domain/entities/login_entity.dart';
import 'package:it_health_example/src/features/domain/useCases/get_session_use_case.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    List noRequiresAuthentication = [];

    bool requiresToken = !noRequiresAuthentication.contains(options.path);

    if (requiresToken) {
      final res = await sl<GetSessionUseCase>().call(NoParams());
      var auth = res.fold<LoginEntity?>((l) => null, (r) => r);
      if (auth != null && auth.token != null) {
        options.headers
            .addAll({"Authorization": "Bearer ${auth.token}"}); //${auth.token}
      }
    }

    super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    String errorDescription = "";
    switch (err.type) {
      case DioExceptionType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioExceptionType.unknown:
        errorDescription =
            "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        if (err.response?.statusCode == 401) {
          // await sl<LogoutUseCase>().call(NoParams());
          //   Get.offAndToNamed(LoginPage.routeName);
        }
        //   if (err.response?.data.containsKey("message") &&
        //       err.response?.data["message"].contains("jwt")) {
        //     await sl<ClearSessionUseCase>().call(NoParams());
        //
        //     Get.offAndToNamed(LoginPage.routeName);
        //   }
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        break;
    }
    log("errorDescription:\t$errorDescription");
    err.copyWith(error: errorDescription);
    return super.onError(err, handler);
  }
}
