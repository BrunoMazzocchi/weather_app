import 'Main.dart';
import 'Weather.dart';
import 'Clouds.dart';
import 'Wind.dart';
import 'Rain.dart';
import 'Sys.dart';



class FList {
  FList({
    required  this.dt,
    required  this.main,

    required this.weather,


  });

  FList.fromJson(dynamic json) {
    dt = json['dt'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }

  }
  int? dt;
  Main? main;

  List<Weather>? weather;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    if (main != null) {
      map['main'] = main?.toJson();
    }
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }

    return map;
  }

}