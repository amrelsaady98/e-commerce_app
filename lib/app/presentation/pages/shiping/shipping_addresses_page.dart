import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/presentation/controllers/address/address_controller.dart';
import 'package:shop_app/core/routes/routes.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

class ShippingAddressesPage extends GetView<AddressController> {
  const ShippingAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_SHIPPING_ADDRESSES_PAGE),
        shape: const CircleBorder(eccentricity: 0.1),
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          customSliverAppBar(
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
          Obx(
            () => SliverList.builder(
              itemCount: controller.addressList.length,
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
                            value: controller.addressList[index].isDefault,
                            onChanged: (value) =>
                                controller.onDefaultChekboxPressed(index, value),
                                
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
                                      "${controller.addressList[index].addressTitle}",
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
                                alignment: AlignmentDirectional.topStart,
                                child: Text(
                                  "${controller.addressList[index].addressLine}",
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
          ),
        ],
      ),
    );
  }
}
