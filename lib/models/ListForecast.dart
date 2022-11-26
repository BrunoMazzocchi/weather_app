import 'Main.dart';
import 'Weather.dart';
import 'Clouds.dart';
import 'Wind.dart';
import 'Sys.dart';

class ListForecast {
  ListForecast({
    required  this.dt,
    required   this.main,
    required  this.weather,
    required  this.clouds,
 });

  ListForecast.fromJson(dynamic json) {
    dt = json['dt'];
    main = (json['main'] != null ? Main.fromJson(json['main']) : null)!;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    clouds = (json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null)!;

  }
late  int dt;
  late  Main main;
  late  List<Weather> weather;
  late  Clouds clouds;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    if (main != null) {
      map['main'] = main.toJson();
    }
    if (weather != null) {
      map['weather'] = weather.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      map['clouds'] = clouds.toJson();
    }

    return map;
  }

}