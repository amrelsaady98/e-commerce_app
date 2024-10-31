import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(
        title: "Check Out",
        onLeadingPressed: () => Get.back(),
      ),
    );
  }
}
