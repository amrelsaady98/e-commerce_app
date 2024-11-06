import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/core/routes/routes.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/intro_background.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 36),
                  child: Text(
                    'MAKE YOUR',
                    style: GoogleFonts.gelasio(
                      textStyle: const TextStyle(
                        color: Color(0xFF5F5F5F),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        height: 2.5,
                        letterSpacing: 1.20,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 36),
                  child: Text('HOME BEAUTIFUL',
                      style: GoogleFonts.gelasio(
                        textStyle: const TextStyle(
                          color: Color(0xFF303030),
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(30),
                  padding: const EdgeInsetsDirectional.only(start: 36),
                  child: Text(
                    'The best simple place where you discover most wonderful furnitures and make your home beautiful',
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                        color: Color(0xFF808080),
                        fontSize: 18,
                        height: 2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 56)
              ],
            ),
            FilledButton(
              onPressed: () {
                /// if logged in --> go to HomePage
                /// else --> go to LoginPage []
                Get.offAllNamed(Routes.LOGIN_PAGE);
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              child: Text(
                "Get Started",
                style: GoogleFonts.gelasio(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
