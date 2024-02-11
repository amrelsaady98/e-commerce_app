import 'package:shop_app/app/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel(
      {required super.id, required super.name, super.iconAsset, super.iconURL});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] ?? "0",
        name: json['name'] ?? "",
        iconAsset: json['icon-asset'],
        iconURL: json['icon-url'],
      );

  static const catigories = {
    'categories': [
      {
        'id': "0",
        'name': "Popular",
        'icon-asset': "assets/vectors/cat_popular.svg",
        'icon-url': ""
      },
      {
        'id': "1",
        'name': "Armchairs",
        'icon-asset': "assets/vectors/cat_armchair.svg",
        'icon-url': ""
      },
      {
        'id': "2",
        'name': "Beds",
        'icon-asset': "assets/vectors/cat_beds.svg",
        'icon-url': ""
      },
      {
        'id': "3",
        'name': "Chairs",
        'icon-asset': "assets/vectors/cat_chairs.svg",
        'icon-url': ""
      },
      {
        'id': "4",
        'name': "Lamps",
        'icon-asset': "assets/vectors/cat_lamp.svg",
        'icon-url': ""
      },
      {
        'id': "5",
        'name': "Tables",
        'icon-asset': "assets/vectors/cat_tables.svg",
        'icon-url': ""
      }
    ]
  };
}
