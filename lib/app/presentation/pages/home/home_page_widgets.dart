import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app/app/domain/entities/category.dart';

import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/core/helpers/constants/api_constants.dart';
import 'package:shop_app/core/routes/routes.dart';

class ProductItem extends StatelessWidget {
  final Product item;
  final int index;
  final void Function(int index) onItemPressed;
  final void Function({required int index}) onAddToCartPressed;

  const ProductItem({
    super.key,
    required this.item,
    required this.index,
    required this.onItemPressed,
    required this.onAddToCartPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemPressed(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "product_image${item.id}",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Image.network(
                    "${ApiConstants.BASE_URL}${item.thumbnailImage}",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                  Positioned.directional(
                    textDirection: TextDirection.ltr,
                    end: 12,
                    bottom: 12,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          overlayColor: MaterialStatePropertyAll(
                            Get.theme.colorScheme.primary,
                          ),
                          onTap: () => onAddToCartPressed(index: index),
                          child: Container(
                            width: 36,
                            height: 36,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Get.theme.colorScheme.secondary
                                  .withOpacity(0.5),
                            ),
                            child: SvgPicture.asset(
                                'assets/vectors/icon_add_to_cart.svg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "${item.name}",
            style: GoogleFonts.nunitoSans(
              textStyle: const TextStyle(fontSize: 14),
            ),
          ),
          Text(
            "\$ ${item.mainPrice}",
            style: GoogleFonts.nunitoSans(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItemShimmer extends StatelessWidget {
  const ProductItemShimmer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Get.theme.colorScheme.primary.withOpacity(0.3),
      highlightColor: Get.theme.colorScheme.primary.withOpacity(0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            height: 14,
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            width: 72,
            height: 14,
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final bool selected;
  final int index;
  final Category item;

  const CategoryItem({
    super.key,
    required this.selected,
    required this.index,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: Column(
        children: [
          Container(
            height: 28 + 16,
            width: 28 + 16,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: selected
                  ? Get.theme.colorScheme.primary
                  : Get.theme.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              "${ApiConstants.BASE_URL}${item.iconURL}" ?? "",
              color: selected
                  ? Get.theme.colorScheme.onPrimary
                  : Get.theme.colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.name,
            style: GoogleFonts.nunitoSans(
              textStyle: TextStyle(
                color: selected
                    ? Get.theme.colorScheme.primary
                    : Get.theme.colorScheme.secondary,
                fontSize: 14,
                fontWeight: selected ? FontWeight.w400 : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItemShimmer extends StatelessWidget {
  const CategoryItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Get.theme.colorScheme.primary.withOpacity(0.3),
          highlightColor: Get.theme.colorScheme.primary.withOpacity(0.05),
          child: Column(
            children: [
              Container(
                height: 28 + 16,
                width: 28 + 16,
                margin: const EdgeInsets.symmetric(
                    horizontal: (72 - 44) / 2, vertical: (72 - 64) / 2),
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}
