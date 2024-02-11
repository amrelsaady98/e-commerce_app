import 'package:flutter/material.dart';

class AuthFormHeader extends StatelessWidget {
  const AuthFormHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              height: 1,
            ),
          ),
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Image.asset('assets/images/grouplogin-header-icon.png',
                fit: BoxFit.cover),
          ),
          const Expanded(
            child: Divider(
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  const InputBox({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 24),
      padding: const EdgeInsetsDirectional.only(
        start: 24,
        top: 24,
        bottom: 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x338A959E),
            blurRadius: 30,
            offset: Offset(0, 7),
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
