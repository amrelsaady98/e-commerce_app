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
}
