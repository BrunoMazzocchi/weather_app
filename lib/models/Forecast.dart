import 'City.dart';
import 'List.dart';

class Forecast {
 late  String cod;
 late int message;
 late  int cnt;
 late List<FList> list;
 late City city;

  Forecast({ required this.cod,required this.message,required this.cnt, required this.list, required this.city});

  Forecast.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <FList>[];
      json['list'].forEach((v) {
        list.add( FList.fromJson(v));
      });
    }
    city = (json['city'] != null ? City.fromJson(json['city']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    data['list'] = list.map((v) => v.toJson()).toList();
    data['city'] = city.toJson();
    return data;
  }
}