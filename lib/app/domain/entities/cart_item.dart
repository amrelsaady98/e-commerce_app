import 'package:shop_app/app/data/models/product_model.dart';
import 'package:shop_app/app/domain/entities/product.dart';

class CartItem {
  CartItem({required this.item, required this.count});
  Product item;
  int count;

  Map<String, dynamic> toJson() {
    return {
      'item': item.toJson(),
      'count': count,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        item: ProductModel.fromJson(json['item']),
        count: json['count'],
      );
}
