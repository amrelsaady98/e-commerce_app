import 'package:shop_app/app/data/models/product_model.dart';
import 'package:shop_app/app/domain/entities/cart_item.dart';

class CartItemModel extends CartItem{
  CartItemModel({required super.item, required super.count});
  
  Map<String, dynamic> toJson() {
    return {
      'item': item.toJson(),
      'count': count,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        item: ProductModel.fromJson(json['item']),
        count: json['count'],
      );
}