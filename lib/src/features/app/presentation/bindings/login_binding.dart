import 'package:get/get.dart';
import 'package:it_health_example/injection_container.dart';
import 'package:it_health_example/src/features/app/presentation/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut(() => LoginController(loginUseCase: sl()));
}
