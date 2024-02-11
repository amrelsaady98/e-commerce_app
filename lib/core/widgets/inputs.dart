import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/core/theme/colors.dart';

class DarkButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final EdgeInsets? padding;

  const DarkButton(
      {super.key, required this.onPress, required this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.inverseSurface),
        padding: MaterialStateProperty.all<EdgeInsets>(
          padding ?? const EdgeInsets.all(12),
        ),
      ),
      onPressed: onPress,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onInverseSurface),
        ),
      ),
    );
  }
}

class LightButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final EdgeInsets? padding;

  const LightButton(
      {super.key, required this.onPress, required this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          padding ?? const EdgeInsets.all(12),
        ),
      ),
      onPressed: onPress,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final EdgeInsets? padding;

  const SmallButton(
      {super.key, required this.onPress, required this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    this.lable,
    this.obscureText,
    this.inputAction,
    this.controller,
    this.onFieldSubmitted,
    this.error,
    this.suffixIcon,
  });
  final String? lable;
  final bool? obscureText;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final void Function(String?)? onFieldSubmitted;
  final String? error;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: inputAction,
      obscureText: obscureText ?? false,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelText: lable,
        errorText: error,
        suffixIcon: suffixIcon,
        labelStyle: GoogleFonts.nunitoSans(
          textStyle: const TextStyle(
            color: Color(0xFF909090),
            fontSize: 14,
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(224, 224, 224, 1), width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(224, 224, 224, 1), width: 1),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 1),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 1),
        ),
      ),
    );
  }
}
