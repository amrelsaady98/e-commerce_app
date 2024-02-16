import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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

class CustomAppBarWithAction extends StatelessWidget
    implements PreferredSizeWidget {
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
        child: Container(
          height: 12,
          width: 12,
          padding: EdgeInsets.all(14),
          child: SvgPicture.asset(
            'assets/vectors/search_icon.svg',
            fit: BoxFit.contain,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: onLeadingPressed,
          child: SvgPicture.asset('assets/vectors/cart_icon.svg'),
        ),
        const SizedBox(width: 24),
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

SliverAppBar cutstomSliverAppBar({
  void Function()? onActionIconPressed,
  void Function()? onLeadingIconPressed,
  List<InlineSpan>? textSpan,
  bool viewActionIcon = true,
  bool viewLeadingIcon = true,
  bool pinned = true,
  String actionAsset = 'assets/vectors/cart_icon.svg',
  String leadingAsset = 'assets/vectors/search_icon.svg',
}) {
  return SliverAppBar.medium(
    expandedHeight: 48 * 2.5,
    collapsedHeight: 48 * 2.5,
    stretchTriggerOffset: 20,
    backgroundColor: Get.theme.colorScheme.surface,
    surfaceTintColor: Get.theme.colorScheme.surface,
    pinned: pinned,
    stretch: false,
    snap: false,
    primary: false,
    toolbarHeight: 0,
    automaticallyImplyLeading: false,
    flexibleSpace: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 36),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onLeadingIconPressed,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child:
                      viewLeadingIcon ? SvgPicture.asset(leadingAsset) : null,
                ),
              ),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(children: textSpan),
              ),
              GestureDetector(
                onTap: onActionIconPressed,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: viewActionIcon ? SvgPicture.asset(actionAsset) : null,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
