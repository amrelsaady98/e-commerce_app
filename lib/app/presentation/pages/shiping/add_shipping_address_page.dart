import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/presentation/controllers/address/add_address_controller.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

class AddShippingAddressPage extends GetView<AddAddressController> {
  const AddShippingAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          customSliverAppBar(
            textSpan: [
              TextSpan(
                text: "Add shipping address",
                style: GoogleFonts.merriweather(
                  fontSize: 18,
                  color: Get.theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
            viewActionIcon: false,
            leadingAsset: "assets/vectors/icon_left_arrow.svg",
            onLeadingIconPressed: () => Get.back(),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              padding: const EdgeInsets.only(
                top: 20,
                left: 12,
                right: 12,
                bottom: 8,
              ),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.secondaryContainer,
              ),
              child: const TextField(
                enabled: true,
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: "Home Address 🏠",
                    labelText: "Address title",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      gapPadding: 12,
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              padding: const EdgeInsets.only(
                top: 20,
                left: 12,
                right: 12,
                bottom: 8,
              ),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.secondaryContainer,
              ),
              child: const TextField(
                enabled: true,
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: "Ex: 25 Robert Latouche Street",
                    labelText: "Address",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      gapPadding: 12,
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
