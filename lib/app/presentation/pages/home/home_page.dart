import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app/app/presentation/controllers/home/home_controller.dart';
import 'package:shop_app/app/presentation/pages/home/home_page_widgets.dart';
import 'package:shop_app/core/routes/routes.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: CustomScrollView(
        slivers: [
          cutstomSliverAppBar(
            textSpan: [
              TextSpan(
                text: 'Make home\n',
                style: GoogleFonts.merriweather(
                  color: Get.theme.colorScheme.secondary,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: 'BEAUTIFUL',
                style: GoogleFonts.merriweather(
                  color: Get.theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 18,
                ),
              ),
            ],
            onCartIconPressed: () => Get.toNamed(Routes.CART_PAGE),
          ),
          SliverToBoxAdapter(
            child: Obx(
              () {
                int selectedCategory = controller.selectedCategoryIndex.value;
                return Container(
                  height: 96,
                  alignment: AlignmentDirectional.center,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.isCategoryLoading.value
                        ? 12
                        : controller.categories.length,
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    itemBuilder: (context, index) {
                      return controller.isCategoryLoading.value
                          ? const CategoryItemShimmer()
                          : GestureDetector(
                              onTap: () => controller.categoryItempresed(index),
                              child: CategoryItem(
                                selected: selectedCategory == index,
                                index: index,
                                item: controller.categories[index],
                              ),
                            );
                    },
                    separatorBuilder: (_, __) {
                      return const SizedBox(width: 4);
                    },
                  ),
                );
              },
            ),
          ),
          Obx(
            () => SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  mainAxisExtent: 250,
                ),
                itemCount: controller.isProductLoading.value
                    ? 12
                    : controller.products.length,
                itemBuilder: (context, index) {
                  return controller.isProductLoading.value
                      ? const ProductItemShimmer()
                      : ProductItem(
                          index: index,
                          item: controller.products[index],
                          onItemPressed: (index) {
                            Get.toNamed(Routes.PRODUCT_DETAILS_PAGE,
                                parameters: {
                                  "id": controller.products[index].id
                                });
                          },
                          onAddToCartPressed: controller.addToCartPressed,
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
