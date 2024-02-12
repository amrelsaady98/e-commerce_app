class Product {
  Product({
    required this.id,
    required this.name,
    required this.thumbnailImage,
    required this.mainPrice,
    required this.strokedPrice,
    required this.hasDiscount,
    required this.discount,
    required this.rating,
    required this.sales,
  });
  String id;
  String name;
  String thumbnailImage;
  String mainPrice;
  String strokedPrice;
  bool hasDiscount;
  int discount;
  double rating;
  int sales;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        thumbnailImage: json['thumbnail-image'],
        mainPrice: json['main-price'],
        strokedPrice: json['stroked-price'],
        hasDiscount: json['has-discount'],
        discount: json['discount'],
        rating: json['rating'],
        sales: json['sales'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'thumbnail-image': thumbnailImage,
        'main-price': mainPrice,
        'stroked-price': strokedPrice,
        'has-discount': hasDiscount,
        'discount': discount,
        'rating': rating,
        'sales': sales,
      };
}
