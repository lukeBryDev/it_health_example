import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:it_health_example/src/core/validators/wrap/wrap_text_form_controller.dart';
import 'package:it_health_example/src/features/app/presentation/controllers/auth_controller.dart';
import 'package:it_health_example/src/features/app/presentation/widget/overlays/custom_overlays.dart';
import 'package:it_health_example/src/features/data/dtos/login_dto.dart';
import 'package:it_health_example/src/features/domain/useCases/login_use_case.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;

  LoginController({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase;

  final _authCtrl = Get.find<AuthController>();

  WrapTextFormController emailTxtCtrl = WrapTextFormController();
  WrapTextFormController passwordTxtCtrl = WrapTextFormController();

  RxBool loadingLogin = false.obs;

  RxBool loginFormValid = false.obs;

  RxBool obscurePassword = true.obs;

  @override
  void onReady() {
    _txtCtrlListeners();
    super.onReady();
  }

  void _txtCtrlListeners() {
    emailTxtCtrl.addListener(() {
      update(['input:email']);
      _validateLoginForm();
    });
    passwordTxtCtrl.addListener(() {
      update(['input:password']);
      _validateLoginForm();
    });
  }
  void _validateLoginForm() {
    loginFormValid(Formz.validate([emailTxtCtrl.input, passwordTxtCtrl.input]));
  }

  Future<void> login() async {
    final params =
        LoginDTO(user: emailTxtCtrl.text, password: passwordTxtCtrl.text);
    loadingLogin(true);
    final res = await _loginUseCase.call(params);
    loadingLogin(false);
    res.fold((l) => Show.eitherError(l), (r) {
      _authCtrl.onInitState();
    });
  }

  void setObscurePassword() {
    obscurePassword(!obscurePassword.value);
    update(['input:password']);
  }
}
