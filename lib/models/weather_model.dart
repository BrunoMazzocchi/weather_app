
import 'package:weather_app/models/current_weather/Sys.dart';

import 'current_weather/Main.dart';
import 'current_weather/Wind.dart';

class WeatherModel {
  final String city;
  final Sys? sys;
  final  String weather;
  final String  icon;
  final String imagePath;
  final Main? main;
  final Wind? wind;
  final int? dt;
  WeatherModel({
    required this.dt,
    required this.main,
    required this.city,
    required this.sys,
    required  this.weather,
    required  this.icon,
    required this.imagePath,
    required this.wind,
  });
}
