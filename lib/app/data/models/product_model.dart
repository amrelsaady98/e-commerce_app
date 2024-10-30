import 'dart:ffi';

import 'package:shop_app/app/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.thumbnailImage,
    required super.mainPrice,
    required super.strokedPrice,
    required super.salePrice,
    required super.hasDiscount,
    required super.discount,
    required super.totalRating,
    required super.sales,
    required super.productImages,
    required super.productColors,
  });



  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['product_id'].toString(),
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        thumbnailImage: json['image1'] ?? '',
        mainPrice: json['our_price'] ?? '0.0',
        strokedPrice: json['our_price'] ?? '0.0',
        salePrice: json['sale_price'] ?? '0.0',
        hasDiscount: json['has_discount'] ?? false,
        discount: json['our_price'] != null && json['sale_price'] != null
            ? ((double.tryParse(json['our_price']) ?? 0) -
                    (double.tryParse(json['sale_price']) ?? 0))
                .toInt()
            : 0,
        totalRating: double.tryParse(json['total_rating'].toString()) ?? 0.0,
        sales: json['sales'] ?? 0,
        productImages: (json['product_images'] as List<dynamic>?)
                ?.map((item) => ProductImage.fromJson(item))
                .toList() ??
            [],
        productColors: (json['product_colors'] as List<dynamic>?)
                ?.map((item) => ProductColor.fromJson(item))
                .toList() ??
            [],
      );

  @override
  Map<String, dynamic> toJson() => {
        'product_id': id.toString(),
        'name': name,
        'description': description,
        'image1': thumbnailImage,
        'our_price': mainPrice,
        'stroked_price': strokedPrice,
        'sale_price': salePrice,
        'has_discount': hasDiscount,
        'discount': discount,
        'total_rating': totalRating,
        'sales': sales,
        'product_images': productImages.map((image) => image.toJson()).toList(),
        'product_colors': productColors.map((color) => color.toJson()).toList(),
      };

  static const products = {
    'products': [
      {
        'id': "0",
        'name': "Black Simple Lamp",
        'thumbnail-image': "assets/images/product_image_3.png",
        'main-price': "120",
        'stroked-price': "150",
        'has-discount': false,
        'discount': 20,
        'rating': 4.4,
        'sales': 120,
      },
      {
        'id': "1",
        'name': "Minimal Stand",
        'thumbnail-image': "assets/images/product_image_1.png",
        'main-price': "200",
        'stroked-price': "250",
        'has-discount': true,
        'discount': 25,
        'rating': 4.7,
        'sales': 120,
      },
      {
        'id': "2",
        'name': "Coffee Chair",
        'thumbnail-image': "assets/images/product_image_4.png",
        'main-price': "150",
        'stroked-price': "150",
        'has-discount': false,
        'discount': 25,
        'rating': 4.1,
        'sales': 120,
      },
      {
        'id': "3",
        'name': "Simple Desk",
        'thumbnail-image': "assets/images/product_image_2.png",
        'main-price': "55",
        'stroked-price': "75",
        'has-discount': false,
        'discount': 30,
        'rating': 4.9,
        'sales': 120,
      },
      {
        'id': "4",
        'name': "Black Simple Lamp",
        'thumbnail-image': "assets/images/product_image_3.png",
        'main-price': "120",
        'stroked-price': "150",
        'has-discount': false,
        'discount': 20,
        'rating': 4.4,
        'sales': 120,
      },
      {
        'id': "5",
        'name': "Minimal Stand",
        'thumbnail-image': "assets/images/product_image_1.png",
        'main-price': "200",
        'stroked-price': "250",
        'has-discount': true,
        'discount': 25,
        'rating': 4.7,
        'sales': 120,
      },
      {
        'id': "6",
        'name': "Coffee Chair",
        'thumbnail-image': "assets/images/product_image_4.png",
        'main-price': "150",
        'stroked-price': "150",
        'has-discount': false,
        'discount': 25,
        'rating': 4.1,
        'sales': 120,
      },
      {
        'id': "7",
        'name': "Simple Desk",
        'thumbnail-image': "assets/images/product_image_2.png",
        'main-price': "55",
        'stroked-price': "75",
        'has-discount': false,
        'discount': 30,
        'rating': 4.9,
        'sales': 120,
      },
    ]
  };
}
