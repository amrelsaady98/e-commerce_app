// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/presentation/controllers/authentication/login_controller.dart';
import 'package:shop_app/app/presentation/pages/authintication/login_widgets.dart';
import 'package:shop_app/core/routes/routes.dart';
import 'package:shop_app/core/theme/colors.dart';
import 'package:shop_app/core/widgets/buttons.dart';
import 'package:shop_app/core/widgets/inputs.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});

  final GlobalKey _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 72),
              const AuthFormHeader(),
              // const SizedBox(height: 24),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 24),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Hello !\n',
                          style: GoogleFonts.merriweather(
                            textStyle: const TextStyle(
                                color: Color(0xFF909090),
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                height: 2),
                          )),
                      TextSpan(
                        text: 'WELCOME BACK',
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
              InputBox(
                child: Column(
                  children: [
                    Obx(
                      () => LoginTextField(
                        lable: "Email",
                        inputAction: TextInputAction.next,
                        controller:    controller.emailController,
                        onFieldSubmitted: (val) =>
                            controller.validateEmail(val),
                        error: controller.emailError.value,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Obx(
                      () => LoginTextField(
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
                      ),
                    ),
                    const SizedBox(height: 36),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 24),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              /// navigate to find by email
                            },
                            child: Text(
                              'Forgot Password',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunitoSans(
                                textStyle: const TextStyle(
                                  color: Color(0xFF303030),
                                  fontSize: 18,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Obx(
                            () => Container(
                              width: double.infinity,
                              child: controller.isLoginLoading.value
                                  ? ThinFilledButton(
                                      onPressed: () {},
                                      widget: SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          strokeCap: StrokeCap.round,
                                          strokeWidth: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                          color: AppColors
                                              .appColorsLight.onPrimary,
                                        ),
                                      ),
                                    )
                                  : ThinFilledTextButton(
                                      text: "Log in",
                                      onPressed: () =>
                                          controller.loginPressed(),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          MyTextButton(
                            text: "SIGN UP",
                            onPressed: () => Get.toNamed(Routes.SIGNUP_PAGE),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 64),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 86),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => controller.googleLoginPressed(),
                      child: SizedBox(
                        child: Image.asset(
                          "assets/images/google_logo.png",
                          height: 48,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: SizedBox(
                        child: Image.asset(
                          "assets/images/apple_logo.png",
                          height: 48,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
