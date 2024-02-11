import 'package:get/get.dart';
import 'package:shop_app/app/application/auth_manager/auth_manager.dart';
import 'package:shop_app/app/data/data_sources/remote/auth_api_service.dart';
import 'package:shop_app/app/data/repositorites_impls/auth_repository_impl.dart';
import 'package:shop_app/app/domain/repositories/auth_repository.dart';
import 'package:shop_app/app/domain/use_cases/auth_use_case.dart';
import 'package:shop_app/app/presentation/controllers/authentication/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthManager());
    Get.lazyPut(() => AuthUseCase(AuthRepositoryImpl(AuthApiService())));
    Get.lazyPut(() => LoginController());
  }
}
