import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

class ShippingAddressesPage extends GetView {
  const ShippingAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          cutstomSliverAppBar(
            leadingAsset: 'assets/vectors/icon_left_arrow.svg',
            viewActionIcon: false,
            onLeadingIconPressed: () => Get.back(),
            textSpan: [
              TextSpan(
                text: "Shipping Addresses",
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
            itemCount: 5,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(bottom: 12),
              height: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Use as the shipping address',
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            height: 2,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 40,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Address Name",
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        height: 2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const Icon(Icons.edit)
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: Get.theme.colorScheme.secondary,
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              child: Text(
                                "25 rue Robert Latouche, Nice, 06200, Côte D’azur, France",
                                style: GoogleFonts.nunitoSans(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    color: Get.theme.colorScheme.secondary,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
