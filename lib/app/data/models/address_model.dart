import 'package:shop_app/app/domain/entities/address.dart';

class AddressModel extends Address {
  AddressModel({
    required super.id,
    required super.addressTitle,
    required super.addressLine,
    required super.phoneNumber,
    super.isDefault,
    required super.governorate,
    required super.city,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'],
        addressTitle: json['address-title'],
        addressLine: json['address-line'],
        phoneNumber: json['phone-number'],
        isDefault: json['is-default'],
        governorate: Governorate.fromJson(json['governorate']),
        city: City.fromJson(json['city']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'address-title': addressTitle,
        'address-line': addressLine,
        'phone-number': phoneNumber,
        'is-default': isDefault,
        'governorate': governorate.toJson(),
        'city': city.toJson()
      };

  factory AddressModel.fromEntity(Address entity) => AddressModel(
        id: entity.id,
        addressTitle: entity.addressTitle,
        addressLine: entity.addressLine,
        governorate: entity.governorate,
        isDefault: entity.isDefault,
        phoneNumber: entity.phoneNumber,
        city: entity.city,
      );
}
