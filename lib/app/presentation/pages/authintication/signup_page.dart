import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/presentation/controllers/authentication/signup_controller.dart';
import 'package:shop_app/app/presentation/pages/authintication/login_widgets.dart';
import 'package:shop_app/core/widgets/buttons.dart';
import 'package:shop_app/core/widgets/inputs.dart';

class SignupPgae extends GetView<SignupController> {
  const SignupPgae({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const SizedBox(height: ),
              Container(
                  margin: const EdgeInsets.only(
                    top: 72,
                    bottom: 48,
                  ),
                  child: const AuthFormHeader()),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsetsDirectional.only(start: 24),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'WELCOME',
                            style: GoogleFonts.merriweather(
                              textStyle: const TextStyle(
                                color: Color(0xFF303030),
                                fontSize: 24,
                                fontFamily: 'Merriweather',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  InputBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(() => LoginTextField(
                              controller: controller.nameController,
                              lable: "Name",
                              error: controller.nameError.value,
                              onFieldSubmitted: (val) =>
                                  controller.validateName(val),
                            )),
                        const SizedBox(height: 12),
                        Obx(() => LoginTextField(
                              controller: controller.emailController,
                              lable: "Email",
                              error: controller.emailError.value,
                              onFieldSubmitted: (val) =>
                                  controller.validateEmail(val),
                            )),
                        const SizedBox(height: 12),
                        Obx(() => LoginTextField(
                              controller: controller.passwordController,
                              lable: "Password",
                              error: controller.passwordError.value,
                              onFieldSubmitted: (val) =>
                                  controller.validatePassword(val),
                              obscureText: controller.obscureTextPassword.value,
                              suffixIcon: GestureDetector(
                                onTap: () => controller.showPasswordPressed(),
                                child: Icon(controller.obscureTextPassword.value
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye),
                              ),
                            )),
                        const SizedBox(height: 12),
                        Obx(() => LoginTextField(
                              controller: controller.confirmPasswordController,
                              lable: "Confirm password",
                              error: controller.confirmPasswordError.value,
                              onFieldSubmitted: (val) =>
                                  controller.validateConfirmPassword(val),
                              obscureText:
                                  controller.obscureTextConfirmPassword.value,
                              suffixIcon: GestureDetector(
                                onTap: () =>
                                    controller.showConfirmPasswordPressed(),
                                child: Icon(
                                    controller.obscureTextConfirmPassword.value
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.remove_red_eye),
                              ),
                            )),
                        const SizedBox(height: 48),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsetsDirectional.only(end: 24),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ThinFilledTextButton(
                            text: "SIGN UP",
                            onPressed: () {
                              controller.signupPressed();
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have Account?',
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: const TextStyle(
                                      color: Color(0xFF808080),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.back();
                                    },
                                  text: ' SIGN IN',
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: const TextStyle(
                                      color: Color(0xFF303030),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 56),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
