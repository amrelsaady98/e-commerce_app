import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/domain/entities/address.dart';
import 'package:shop_app/app/presentation/controllers/address/add_address_controller.dart';
import 'package:shop_app/app/presentation/controllers/address/address_controller.dart';
import 'package:shop_app/core/constants/address_constants.dart';
import 'package:shop_app/core/widgets/buttons.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

class AddShippingAddressPage extends GetView<AddAddressController> {
  const AddShippingAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              shrinkWrap: true,
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
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 12,
                      right: 12,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.secondaryContainer,
                    ),
                    child: Obx(
                      () => TextField(
                        enabled: true,
                        controller: controller.addressNameController,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: "Home Address 🏠",
                            labelText: "Address title",
                            errorText: controller.addresTitleError.value,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: const OutlineInputBorder(
                              gapPadding: 12,
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 12,
                      right: 12,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.secondaryContainer,
                    ),
                    child: Obx(
                      () => TextField(
                        enabled: true,
                        controller: controller.addressLineController,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: "Ex: 25 Robert Latouche Street",
                          labelText: "Address",
                          errorText: controller.addresLineError.value,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: const OutlineInputBorder(
                            gapPadding: 12,
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Obx(
                    () => Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: Get.theme.colorScheme.primary,
                        ),
                      ),
                      child: DropdownButton<String?>(
                        value: controller.selectedGovernorateId.value,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        isExpanded: true,
                        underline: Container(),
                        hint: const Expanded(
                          child: Text('Governorate'),
                        ),
                        menuMaxHeight: 540,
                        onChanged: (value) =>
                            controller.onGovernorateChange(value),
                        items: [
                          ...governorates.map<DropdownMenuItem<String?>>((e) {
                            return DropdownMenuItem(
                                value: Governorate.fromJson(e).id,
                                onTap: () => controller.onGovernoratePressed(
                                      Governorate.fromJson(e),
                                    ),
                                child: Text(
                                    Governorate.fromJson(e).governorateNameEn ??
                                        ""));
                          }).toList(),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Obx(
                    () => Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: Get.theme.colorScheme.primary,
                        ),
                      ),
                      child: DropdownButton<String?>(
                        value: controller.selectedCityId.value,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        isExpanded: true,
                        underline: Container(),
                        hint: const Expanded(
                          child: Text('City'),
                        ),
                        menuMaxHeight: 540,
                        onChanged: controller.onCityChangged,
                        items: [
                          ...controller.citiesList
                              .map<DropdownMenuItem<String?>>(
                            (element) => DropdownMenuItem(
                              value: element?.id,
                              onTap: () =>
                                  controller.onCityItemPressed(element),
                              child: Text("${element?.cityNameEn}"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 12,
                      right: 12,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.secondaryContainer,
                    ),
                    child: Obx(
                      () => TextField(
                        controller: controller.addressPhoneController,
                        enabled: true,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        inputFormatters: [
                          PhoneInputFormatter(
                            shouldCorrectNumber: true,
                          ),
                        ],
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: "Phone Number",
                          hintText: "Ex: +20 1234567890",
                          errorText: controller.addresPhoneError.value,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: const OutlineInputBorder(
                            gapPadding: 12,
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(24),
            width: double.infinity,
            child: ThikFilledTextButton(
              onPressed: () => controller.onSaveAddressPressed(),
              text: "Save Address",
              backgroundColor: Get.theme.colorScheme.primary,
              textColor: Get.theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
