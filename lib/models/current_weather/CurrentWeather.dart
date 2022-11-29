import 'Clouds.dart';
import 'Coord.dart';
import 'Main.dart';
import 'Sys.dart';
import 'Weather.dart';
import 'Wind.dart';

class CurrentWeather {
  CurrentWeather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  CurrentWeather.fromJson(dynamic json) {
    coord = (json['coord'] != null ? Coord.fromJson(json['coord']) : null)!;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = (json['main'] != null ? Main.fromJson(json['main']) : null)!;
    wind = (json['wind'] != null ? Wind.fromJson(json['wind']) : null)!;
    clouds = (json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null)!;
    dt = json['dt'];
    sys = (json['sys'] != null ? Sys.fromJson(json['sys']) : null)!;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  late Coord coord;
  late List<Weather>? weather;
  late String base;
  late Main? main;
  late Wind? wind;

  late Clouds? clouds;
  late int dt;
  late Sys sys;

  late  num? timezone;
  late  num? id;
  late String name;
  late num? cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coord'] = coord.toJson();
    map['weather'] = weather?.map((v) => v.toJson()).toList();
    map['base'] = base;
    map['main'] = main?.toJson();
    map['wind'] = wind?.toJson();
    map['clouds'] = clouds?.toJson();
    map['dt'] = dt;
    map['sys'] = sys?.toJson();
    map['timezone'] = timezone;
    map['id'] = id;
    map['name'] = name;
    map['cod'] = cod;
    return map;
  }
}
