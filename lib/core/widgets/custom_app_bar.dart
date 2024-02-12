import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.onLeadingPressed});
  final String? title;
  final void Function()? onLeadingPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leading: GestureDetector(
        onTap: onLeadingPressed,
        child: Icon(
          Icons.keyboard_arrow_left_rounded,
          size: 32,
        ),
      ),
      title: Text(
        "$title",
        style: GoogleFonts.merriweather(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      toolbarHeight: 88,
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(88);
}

class CustomAppBarWithAction extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWithAction({
    super.key,
    this.title,
    this.onLeadingPressed,
    this.onActionPressed,
    this.leading,
    this.action,
  });
  final String? title;
  final void Function()? onLeadingPressed;
  final void Function()? onActionPressed;
  final Widget? leading;
  final Widget? action;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leading: GestureDetector(
        onTap: onLeadingPressed,
        child: leading,
      ),
      actions: [
        GestureDetector(
          onTap: onLeadingPressed,
          child: action,
        ),
        const SizedBox(width: 12),
      ],
      title: Text(
        "$title",
        style: GoogleFonts.merriweather(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      toolbarHeight: 88,
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(88);
}
