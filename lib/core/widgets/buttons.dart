import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ThinFilledTextButton extends StatelessWidget {
  const ThinFilledTextButton({super.key, required this.text, this.onPressed});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.nunitoSans(),
      ),
    );
  }
}

class ThinFilledButton extends StatelessWidget {
  const ThinFilledButton({super.key, required this.widget, this.onPressed});

  final void Function()? onPressed;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      child: widget,
    );
  }
}

class ThikFilledTextButton extends StatelessWidget {
  const ThikFilledTextButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.backgroundColor,
      this.textColor});

  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: GoogleFonts.nunitoSans(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({super.key, this.onPressed, required this.text});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
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
    );
  }
}

class ProductCounter extends StatelessWidget {
  const ProductCounter({
    super.key,
    required this.count,
    required this.increse,
    required this.decrese,
  });

  final void Function() increse;
  final void Function() decrese;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: increse,
          child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                color: Get.theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(4),
            child: const Icon(
              Icons.add_rounded,
              size: 24,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            "$count",
            style: GoogleFonts.nunitoSans(fontSize: 18),
          ),
        ),
        GestureDetector(
          onTap: decrese,
          child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                color: Get.theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(4),
            child: const Icon(
              Icons.remove_rounded,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
