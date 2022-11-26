import 'City.dart';
import 'List.dart' as model;
class Forecast {
  Forecast({
    required   this.cod,
    required    this.message,
    required    this.cnt,
    required    this.list,
    required    this.city,});

  Forecast.fromJson(dynamic json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list?.add(model.ListForecast.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }
  String? cod;
  int? message;
  int? cnt;
  List<model.ListForecast>? list;
  City? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cod'] = cod;
    map['message'] = message;
    map['cnt'] = cnt;
    if (list != null) {
      map['list'] = list?.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      map['city'] = city?.toJson();
    }
    return map;
  }

}