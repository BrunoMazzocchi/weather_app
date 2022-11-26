import 'Coord.dart';
import 'Weather.dart';
import 'Main.dart';
import 'Wind.dart';
import 'Clouds.dart';
import 'Sys.dart';

class CurrentWeather {
  CurrentWeather({
 required     this.coord,
    required   this.weather,
    required   this.base,
    required     this.main,
    required    this.visibility,
    required      this.wind,
    required   this.clouds,
    required     this.dt,
    required     this.sys,
    required    this.timezone,
    required     this.id,
    required    this.name,
    required    this.cod,});

  CurrentWeather.fromJson(dynamic json) {
    coord = (json['coord'] != null ? Coord.fromJson(json['coord']) : null)!;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = (json['main'] != null ? Main.fromJson(json['main']) : null)!;
    visibility = json['visibility'];
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
  late List<Weather> weather;
  late String base;
  late Main main;
  late int visibility;
  late Wind wind;
  late Clouds clouds;
  late  int dt;
  late  Sys sys;
  late int timezone;
  late int id;
  late String name;
  late  int cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (coord != null) {
      map['coord'] = coord.toJson();
    }
    if (weather != null) {
      map['weather'] = weather.map((v) => v.toJson()).toList();
    }
    map['base'] = base;
    if (main != null) {
      map['main'] = main.toJson();
    }
    map['visibility'] = visibility;
    if (wind != null) {
      map['wind'] = wind.toJson();
    }
    if (clouds != null) {
      map['clouds'] = clouds.toJson();
    }
    map['dt'] = dt;
    if (sys != null) {
      map['sys'] = sys.toJson();
    }
    map['timezone'] = timezone;
    map['id'] = id;
    map['name'] = name;
    map['cod'] = cod;
    return map;
  }

}