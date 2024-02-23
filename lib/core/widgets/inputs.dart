import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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

class SquareBorederdTextInput extends StatelessWidget {
  const SquareBorederdTextInput({
    super.key,
    this.label,
    this.hint,
    this.error,
    this.onChanged,
    this.formatters,
    this.keyboardType,
    this.textInputAction,
    this.enabled = true,
  });
  final String? label, hint, error;
  final bool enabled;
  final void Function(String value)? onChanged;
  final List<TextInputFormatter>? formatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 12,
        right: 12,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Get.theme.colorScheme.primary, width: 0.5),
      ),
      child: TextField(
        enabled: true,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
        style: const TextStyle(fontSize: 18),
        inputFormatters: formatters,
        decoration: InputDecoration(
          errorText: error,
          contentPadding: EdgeInsets.zero,
          labelText: label,
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: const OutlineInputBorder(
            gapPadding: 12,
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class SquareTextInput extends StatelessWidget {
  const SquareTextInput({
    super.key,
    this.label,
    this.hint,
    this.error,
    this.maxLength,
    this.onChanged,
    this.formatters,
    this.keyboardType,
    this.textInputAction,
    this.enabled = true,
  });
  final String? label, hint, error;
  final bool enabled;
  final void Function(String value)? onChanged;
  final List<TextInputFormatter>? formatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 12,
        right: 12,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.secondaryContainer,
      ),
      child: TextField(
        enabled: enabled,
        textInputAction: textInputAction,
        style: const TextStyle(fontSize: 18),
        onChanged: onChanged,
        maxLength: maxLength,
        maxLines: 1,
        keyboardType: keyboardType,
        inputFormatters: formatters,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          errorText: error,
          hintText: hint,
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: const OutlineInputBorder(
            gapPadding: 12,
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
