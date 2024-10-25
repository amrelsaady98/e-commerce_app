import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/app/application/auth_manager/auth_manager.dart';
import 'package:shop_app/app/domain/entities/login_request.dart';
import 'package:shop_app/app/domain/entities/login_response.dart';
import 'package:shop_app/app/domain/use_cases/auth_use_cases/login_use_case.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/routes/routes.dart';
import 'package:shop_app/core/services/internet_service/dio_exception.dart';

class SignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool acceptTerms = false.obs;

  RxnString nameError = RxnString(null);
  RxnString emailError = RxnString(null);
  RxnString passwordError = RxnString(null);
  RxnString confirmPasswordError = RxnString(null);
  RxBool obscureTextPassword = true.obs;
  RxBool obscureTextConfirmPassword = true.obs;

  RxBool isLoginLoading = false.obs;

  final AuthManager _authmanager = Get.find<AuthManager>();

  final LoginUseCase _authUseCase = Get.find<LoginUseCase>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void validateName(String? val) {
    bool valid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+")
        .hasMatch(val ?? "");
    if (!valid) {
      nameError.value = "Invalid Name";
    } else {
      nameError.value = null;
    }
  }

  void validateEmail(String? val) {
    bool valid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val ?? "");
    if (!valid) {
      emailError.value = "Invalid Email";
    } else {
      emailError.value = null;
    }
  }

  void validatePassword(String? val) {
    bool valid = false;
    if (val != null) {
      valid = val.length >= 8 && val.length <= 16;
    }
    if (valid) {
      passwordError.value = null;
    } else {
      passwordError.value =
          "Password length should be between 8 and 16 charchter";
    }
  }

  void validateConfirmPassword(String? val) {
    if (val == passwordController.text) {
      confirmPasswordError.value = null;
    } else {
      confirmPasswordError.value = "Passwords do not match";
    }
  }

  void signupPressed() async {
    /// - validate inputs
    validateName(nameController.text);
    validateEmail(emailController.text);
    validatePassword(passwordController.text);
    validateConfirmPassword(confirmPasswordError.value);

    ///chek validatioin errors
    if (emailError.value != null ||
        passwordError.value != null ||
        confirmPasswordError.value != null ||
        nameError.value != null ||
        acceptTerms.value != true) {
      return;
    }

    /// - lodaing
    isLoginLoading.value = true;

    /// - fetch login
    DataState<LoginResponse> response = await _authUseCase.call(
      params: LoginRequest(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    // stop loading
    isLoginLoading.value = false;

    if (response is DataSuccess) {
      //save token locally and go to home

      _authmanager.login(response.data?.data?.access ?? "");
      Get.offAllNamed(Routes.MAIN_PAGE);
    } else {
      // add error to email textField
      emailError.value = (response.exception as GetHttpException).message ??
          "fixed error massage";
    }
  }

  void googleLoginPressed() async {
    final user = await signInWithGoogle();
    //fetch login with google request

    //save token locally
    _authmanager.login(user.credential!.accessToken!);
    if (user.credential != null) {
      Get.offAllNamed(Routes.MAIN_PAGE);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void showPasswordPressed() {
    obscureTextPassword.value = !obscureTextPassword.value;
  }
}
