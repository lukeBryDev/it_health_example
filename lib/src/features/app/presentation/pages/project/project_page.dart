import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_health_example/src/core/settings/app_assets.dart';
import 'package:it_health_example/src/core/settings/app_colors.dart';
import 'package:it_health_example/src/features/app/presentation/controllers/auth_controller.dart';

class ProjectPage extends StatefulWidget {
  static const routeName = '/project';

  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final _authCtrl = Get.find<AuthController>();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => _authCtrl.onInitState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(AppAssets.splash),
      ),
    );
  }
}
