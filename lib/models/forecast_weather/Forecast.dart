import 'Current.dart';
import 'Daily.dart';

class Forecast {
  late double lat;
  late  double lon;
  late  String timezone;
  late  num timezoneOffset;
  late Current current;
  late List<Daily> daily;

  Forecast({
     required this.lat,
    required this.lon,
    required  this.timezone,
    required  this.timezoneOffset,
    required this.current,
    required  this.daily,
  });

  Forecast.fromJson(dynamic json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current = (json['current'] != null ? Current.fromJson(json['current']) : null)!;
    if (json['daily'] != null) {
      daily = [];
      json['daily'].forEach((v) {
        daily.add(Daily.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    map['timezone'] = timezone;
    map['timezone_offset'] = timezoneOffset;
    if (current != null) {
      map['current'] = current.toJson();
    }
    if (daily != null) {
      map['daily'] = daily.map((v) => v.toJson()).toList();
    }
    return map;
  }

}