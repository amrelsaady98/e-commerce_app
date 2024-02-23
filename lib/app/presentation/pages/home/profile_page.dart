import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/presentation/pages/home/profile_page_widgets.dart';
import 'package:shop_app/core/routes/routes.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

class ProfilePage extends GetView {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          customSliverAppBar(
            pinned: false,
            actionAsset: 'assets/vectors/icon_logout.svg',
            textSpan: [
              TextSpan(
                text: "Profile",
                style: GoogleFonts.merriweather(
                  color: Get.theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: UserItemTile(
              userName: "Amr El-Saady",
              userAccount: '@amrelsaady98',
            ),
          ),
          const SliverToBoxAdapter(
            child: ProfileFeatureItem(
              title: "My Orders",
              subtitle: "Already have 10 orders",
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileFeatureItem(
              title: "Shipping Addresses",
              subtitle: "3 Addresses",
              onItemPressed: () => Get.toNamed(Routes.SHIPPING_ADDRESSES_PAGE),
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileFeatureItem(
              title: "Payment Method",
              subtitle: "You have 2 cards",
              onItemPressed: () => Get.toNamed(Routes.PAYMENT_CARDS_PAGE),
            ),
          ),
          const SliverToBoxAdapter(
            child: ProfileFeatureItem(
              title: "My reviews",
              subtitle: "Reviews for 5 items",
            ),
          ),
          const SliverToBoxAdapter(
            child: ProfileFeatureItem(
              title: "Setting",
              subtitle: "Notification, Password, FAQ, Contact...",
            ),
          ),
        ],
      ),
    );
  }
}
