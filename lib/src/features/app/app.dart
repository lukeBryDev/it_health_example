import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_health_example/injection_container.dart';
import 'package:it_health_example/src/core/settings/app_theme.dart';
import 'package:it_health_example/src/features/app/presentation/bindings/home_binding.dart';
import 'package:it_health_example/src/features/app/presentation/bindings/login_binding.dart';
import 'package:it_health_example/src/features/app/presentation/controllers/auth_controller.dart';
import 'package:it_health_example/src/features/app/presentation/pages/home/home_page.dart';
import 'package:it_health_example/src/features/app/presentation/pages/login/login_page.dart';
import 'package:it_health_example/src/features/app/presentation/pages/project/project_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(sl<AuthController>());
    Get.put(AppTheme());

    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      title: 'presion tracker app',
      theme: AppTheme().theme(),
      initialRoute: ProjectPage.routeName,
      getPages: [
        GetPage(name: ProjectPage.routeName, page: () => const ProjectPage()),
        GetPage(
            name: LoginPage.routeName,
            page: () => const LoginPage(),
            binding: LoginBinding()),
        GetPage(
            name: HomePage.routeName,
            page: () => const HomePage(),
            binding: HomeBinding()),
      ],
    );
  }
}
