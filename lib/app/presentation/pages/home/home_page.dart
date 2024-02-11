import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:shop_app/app/presentation/controllers/home/home_controller.dart';
import 'package:shop_app/app/presentation/pages/home/home_page_widgets.dart';
import 'package:shop_app/core/routes/routes.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            expandedHeight: 48 * 3,
            collapsedHeight: 48 * 3,
            stretchTriggerOffset: 20,
            backgroundColor: Get.theme.colorScheme.surface,
            surfaceTintColor: Get.theme.colorScheme.surface,
            pinned: true,
            stretch: false,
            snap: false,
            primary: false,
            toolbarHeight: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 36),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 36,
                        child:
                            SvgPicture.asset('assets/vectors/search_icon.svg'),
                      ),
                      Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
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
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.CART_PAGE);
                        },
                        child: SizedBox(
                          height: 36,
                          child:
                              SvgPicture.asset('assets/vectors/cart_icon.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                    itemCount: controller.categories.length,
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
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
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    index: index,
                    item: controller.products[index],
                    onItemPressed: (index) {
                      Get.toNamed(Routes.PRODUCT_DETAILS_PAGE,
                          parameters: {"index": "$index"});
                    },
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
