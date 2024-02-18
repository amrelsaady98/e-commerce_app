import 'package:shop_app/app/domain/entities/address.dart';

class AddressModel extends Address {
  AddressModel({
    required super.id,
    required super.addressTitle,
    required super.addressLine,
    required super.governorate,
    required super.city,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'],
        addressTitle: json['address-title'],
        addressLine: json['address-line'],
        governorate: Governorate.fromJson(json['governorate']),
        city: City.fromJson(json['city']),
      );

  Map<String, dynamic> toJson() => {
        'addressTitle': addressTitle,
        'addressLine': addressLine,
        'governorate': governorate.toJson(),
        'city': city.toJson()
      };
}
