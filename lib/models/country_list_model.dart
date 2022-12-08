
class CountryList {
  CountryList({
      required this.error,
    required  this.msg,
    required this.data,});

  CountryList.fromJson(dynamic json) {
    error = json['error'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? error;
  String? msg;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
    required this.iso2,
    required this.iso3,
    required this.country,
    required this.cities,});

  Data.fromJson(dynamic json) {
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    country = json['country'];
    cities = json['cities'] != null ? json['cities'].cast<String>() : [];
  }
  String? iso2;
  String? iso3;
  String? country;
  List<String>? cities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso2'] = iso2;
    map['iso3'] = iso3;
    map['country'] = country;
    map['cities'] = cities;
    return map;
  }

}