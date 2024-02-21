class Address {
  String id;
  String addressTitle;
  String addressLine;
  String phoneNumber;
  bool isDefault;
  // final String country;
  Governorate governorate;
  City city;

  Address({
    required this.id,
    required this.addressTitle,
    required this.addressLine,
    required this.phoneNumber,
    this.isDefault = false,
    // required this.country,
    required this.governorate,
    required this.city,
  });
}

class Governorate {
  String? id;
  String? governorateNameAr;
  String? governorateNameEn;

  Governorate({this.id, this.governorateNameAr, this.governorateNameEn});

  Governorate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    governorateNameAr = json['governorate_name_ar'];
    governorateNameEn = json['governorate_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['governorate_name_ar'] = this.governorateNameAr;
    data['governorate_name_en'] = this.governorateNameEn;
    return data;
  }
}

class City {
  String? id;
  String? governorateId;
  String? cityNameAr;
  String? cityNameEn;

  City({this.id, this.governorateId, this.cityNameAr, this.cityNameEn});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    governorateId = json['governorate_id'];
    cityNameAr = json['city_name_ar'];
    cityNameEn = json['city_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['governorate_id'] = this.governorateId;
    data['city_name_ar'] = this.cityNameAr;
    data['city_name_en'] = this.cityNameEn;
    return data;
  }
}
