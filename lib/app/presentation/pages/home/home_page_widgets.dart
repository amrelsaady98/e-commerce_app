import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/domain/entities/category.dart';

import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/core/routes/routes.dart';

class ProductItem extends StatelessWidget {
  final Product item;
  final int index;
  final void Function(int index) onItemPressed;

  const ProductItem({
    super.key,
    required this.item,
    required this.index,
    required this.onItemPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemPressed(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "product_image$index",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Image.asset(
                    item.thumbnailImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                  Positioned.directional(
                    textDirection: TextDirection.ltr,
                    end: 12,
                    bottom: 12,
                    child: GestureDetector(
                      onTap: () {
                        // TODO: add to cart
                      },
                      child: Container(
                        width: 36,
                        height: 36,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Get.theme.colorScheme.secondary
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset(
                            'assets/vectors/icon_add_to_cart.svg'),
                      ),
                    ),
                  )
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
            child: SvgPicture.asset(
              item.iconAsset ?? "",
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
