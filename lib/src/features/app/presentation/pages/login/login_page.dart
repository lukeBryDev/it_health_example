import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_health_example/src/core/settings/app_assets.dart';
import 'package:it_health_example/src/core/settings/app_colors.dart';
import 'package:it_health_example/src/features/app/presentation/controllers/login_controller.dart';
import 'package:it_health_example/src/features/app/presentation/pages/login/widgets/login_input_widget.dart';
import 'package:it_health_example/src/features/app/presentation/widget/buttons/primary_button.dart';

class LoginPage extends GetView<LoginController> {
  static const routeName = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 100, 24, 20),
        child: Column(
          children: [
            Image.asset(AppAssets.precisionLogo),

            /// input user
            AutofillGroup(
              child: Column(
                children: [
                  LoginInputWidget(
                    name: 'Usuario',
                    controller: controller.emailTxtCtrl,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.username],
                  ),
                  const SizedBox(height: 30),

                  /// input password
                  GetBuilder<LoginController>(builder: (_) {
                    return LoginInputWidget(
                      name: 'Contraseña',
                      controller: _.passwordTxtCtrl,
                      obscureText: _.obscurePassword.value,
                      autofillHints: const [AutofillHints.password],
                      suffixIcon: IconButton(
                        onPressed: () => _.setObscurePassword(),
                        icon: Icon(_.obscurePassword.value
                            ? Icons.password
                            : Icons.password_outlined),
                        splashRadius: 20,
                      ),
                    );
                  }),
                ],
              ),
            ),

            const SizedBox(height: 100),

            /// Login button
            Obx(() {
              return ButtonPrimary(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                loading: controller.loadingLogin.value,
                disabled: !controller.loginFormValid.value,
                title: 'Ingresar',
                color: Colors.white,
                loadingColor: AppColors.primary,
                onPressed: () => controller.login(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
