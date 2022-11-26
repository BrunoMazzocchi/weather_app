import 'Coord.dart';

class City {
  City({
    required  this.id,
    required  this.name,
    required  this.coord,
    required  this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,});

  City.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    coord = (json['coord'] != null ? Coord.fromJson(json['coord']) : null)!;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
 late int id;
  late String name;
  late Coord coord;
  late String country;
  late int population;
  late  int timezone;
  late int sunrise;
  late int sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (coord != null) {
      map['coord'] = coord.toJson();
    }
    map['country'] = country;
    map['population'] = population;
    map['timezone'] = timezone;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }

}