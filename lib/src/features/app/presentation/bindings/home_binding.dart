import 'package:get/get.dart';
import 'package:it_health_example/src/features/app/presentation/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut(() => HomeController());
}
