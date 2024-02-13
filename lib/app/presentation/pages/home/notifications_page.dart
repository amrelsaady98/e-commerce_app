import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/core/theme/colors.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

class NotificationPage extends GetView {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                cutstomSliverAppBar(
                  viewActionIcon: false,
                  textSpan: [
                    TextSpan(
                      text: "Notifications",
                      style: GoogleFonts.merriweather(
                        color: Get.theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SliverList.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      // oreder notification
                      return Container(
                        height: 110 + 12,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        color: Get.theme.colorScheme.secondaryContainer
                            .withOpacity(0.5),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/product_image_1.png',
                                width: 110,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ignore: prefer_const_constructors
                                  Text(
                                    "Your order #123456789 has been confirmed",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. ",
                                    style: GoogleFonts.nunitoSans(fontSize: 10),
                                  ),
                                  Expanded(child: Container()),
                                  Container(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: Text(
                                      "New",
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.success,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    } else if (index == 1) {
                      return Container(
                        height: 110 + 12,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/product_image_1.png',
                                width: 110,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ignore: prefer_const_constructors
                                  Text(
                                    "Your order #123456789 has been canceled",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. ",
                                    style: GoogleFonts.nunitoSans(fontSize: 10),
                                  ),
                                  Expanded(child: Container()),
                                  Container(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: Text(
                                      "",
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.success,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    } else if (index == 2) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        alignment: Alignment.center,
                        color: Get.theme.colorScheme.secondaryContainer
                            .withOpacity(0.5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              "Discover hot sale furnitures this week.",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                height: 2,
                              ),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. ",
                              style: GoogleFonts.nunitoSans(fontSize: 10),
                            ),

                            Container(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(
                                "HOT",
                                style: GoogleFonts.nunitoSans(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
