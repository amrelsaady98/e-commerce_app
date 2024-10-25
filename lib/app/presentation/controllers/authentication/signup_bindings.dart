import 'package:get/get.dart';
import 'package:shop_app/app/application/auth_manager/auth_manager.dart';
import 'package:shop_app/app/data/data_sources/remote/auth_api_service.dart';
import 'package:shop_app/app/data/repositorites_impls/auth_repository_impl.dart';
import 'package:shop_app/app/domain/use_cases/auth_use_cases/signup_use_case.dart';
import 'package:shop_app/app/presentation/controllers/authentication/signup_controller.dart';

class SignupBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthManager());
    Get.lazyPut(() => SignupUseCase(AuthRepositoryImpl(AuthApiService())));
    Get.lazyPut(() => SignupController());
  }
}
