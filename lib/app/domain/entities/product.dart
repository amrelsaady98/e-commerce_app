import 'dart:ffi';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailImage,
    required this.mainPrice,
    required this.strokedPrice,
    required this.salePrice,
    required this.hasDiscount,
    required this.discount,
    required this.totalRating,
    required this.sales,
  });
  String id;
  String name;
  String description;
  String thumbnailImage;
  String mainPrice;
  String strokedPrice;
  String salePrice;
  bool hasDiscount;
  int discount;
  double totalRating;
  int sales;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        thumbnailImage: json['thumbnail-image'],
        mainPrice: json['main_price'],
        strokedPrice: json['stroked_price'],
        salePrice: json['sale_price'],
        hasDiscount: json['has_discount'],
        discount: json['discount'],
        totalRating: double.tryParse(json['total_rating']) ?? 0,
        sales: json['sales'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'thumbnail-image': thumbnailImage,
        'main_price': mainPrice,
        'stroked_price': strokedPrice,
        'has_discount': hasDiscount,
        'sale_price': salePrice,
        'discount': discount,
        'total_rating': totalRating,
        'sales': sales,
      };
}
