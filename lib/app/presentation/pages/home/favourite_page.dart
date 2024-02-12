import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

class FavouritesPage extends GetView {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWithAction(
      title: 'Favourites',
    ));
  }
}
