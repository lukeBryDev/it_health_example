import 'package:get/get.dart';
import 'package:it_health_example/src/core/usecases/usecase.dart';
import 'package:it_health_example/src/features/app/presentation/pages/home/home_page.dart';
import 'package:it_health_example/src/features/app/presentation/pages/login/login_page.dart';
import 'package:it_health_example/src/features/app/presentation/widget/overlays/custom_overlays.dart';
import 'package:it_health_example/src/features/domain/entities/login_entity.dart';
import 'package:it_health_example/src/features/domain/useCases/get_session_use_case.dart';
import 'package:it_health_example/src/features/domain/useCases/log_out_use_case.dart';

class AuthController extends GetxController {
  final GetSessionUseCase _getSessionUseCase;
  final LogOutUseCase _logOutUseCase;

  AuthController(
      {required GetSessionUseCase getSessionUseCase,
      required LogOutUseCase logOutUseCase})
      : _getSessionUseCase = getSessionUseCase,
        _logOutUseCase = logOutUseCase;

  LoginEntity? auth;

  RxBool loadingLogOut = false.obs;

  void onInitState() {
    _checkCurrentSessionDevice();
  }

  Future<void> _checkCurrentSessionDevice() async {
    if (await _isAuthenticated()) {
      Get.offAllNamed(HomePage.routeName);
    } else {
      Get.offAllNamed(LoginPage.routeName);
    }
  }

  Future<bool> _isAuthenticated() async {
    return ((await _getSession())?.token != null);
  }

  Future<void> onLogOutPressed() async {
    loadingLogOut(true);
    await _logOut();
    await _checkCurrentSessionDevice();
    loadingLogOut(false);
  }

  Future<LoginEntity?> _getSession() async {
    final res = await _getSessionUseCase.call(NoParams());
    res.fold((l) => null, (r) => auth = r);
    return auth;
  }

  Future<bool> _logOut() async {
    bool result = false;
    final res = await _logOutUseCase.call(NoParams());
    res.fold((l) {
      result = false;
      Show.eitherError(l);
    }, (r) => result = r);
    return result;
  }
}
