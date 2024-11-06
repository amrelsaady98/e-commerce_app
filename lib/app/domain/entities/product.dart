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
    required this.productImages,
    required this.productColors,
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
  List<ProductImage> productImages;
  List<ProductColor> productColors;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        thumbnailImage: json['thumbnailImage'] ?? '',
        mainPrice: json['main_price'] ?? '0.00',
        strokedPrice: json['stroked_price'] ?? '0.00',
        salePrice: json['sale_price'] ?? '0.00',
        hasDiscount: json['has_discount'] ?? false,
        discount: json['discount'] ?? 0,
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'thumbnailImage': thumbnailImage,
        'main_price': mainPrice,
        'stroked_price': strokedPrice,
        'sale_price': salePrice,
        'has_discount': hasDiscount,
        'discount': discount,
        'total_rating': totalRating,
        'sales': sales,
        'product_images': productImages.map((image) => image.toJson()).toList(),
        'product_colors': productColors.map((color) => color.toJson()).toList(),
      };
}

class ProductImage {
  final int imageId;
  final String image;
  final int order;

  ProductImage({
    required this.imageId,
    required this.image,
    required this.order,
  });

  // Factory constructor to create a ProductImage from JSON
  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      imageId: json['image_id'],
      image: json['image'],
      order: json['order'],
    );
  }

  // Method to convert ProductImage instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'image_id': imageId,
      'image': image,
      'order': order,
    };
  }
}
class ProductColor {
  final int colorId;
  final String color;

  ProductColor({
    required this.colorId,
    required this.color,
  });

  // Factory constructor to create a ProductColor from JSON
  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      colorId: json['color_id'],
      color: json['color'],
    );
  }

  // Method to convert ProductColor instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'color_id': colorId,
      'color': color,
    };
  }
}
