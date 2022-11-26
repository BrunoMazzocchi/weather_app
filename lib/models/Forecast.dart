import 'City.dart';
import 'ListForecast.dart';

class Forecast {
  Forecast({
   required   this.cod,
    required   this.message,
    required  this.cnt,
    required   this.list,
    required   this.city,});

  Forecast.fromJson(dynamic json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list.add(ListForecast.fromJson(v));
      });
    }
    city = (json['city'] != null ? City.fromJson(json['city']) : null)!;
  }
 late String cod;
  late int message;
  late int cnt;
  late List<ListForecast> list;
  late City city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cod'] = cod;
    map['message'] = message;
    map['cnt'] = cnt;
    map['list'] = list.map((v) => v.toJson()).toList();
    map['city'] = city.toJson();
    return map;
  }

}