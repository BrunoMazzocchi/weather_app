

import 'current_weather/current_weather_model.dart';

class WeatherModel {
  final String city;
  final  String weather;
  final String  icon;
  final String imagePath;
  final CurrentWeather currentWeather;
  final int? dt;
  WeatherModel({
    required this.dt,
    required this.city,
    required  this.weather,
    required  this.icon,
    required this.imagePath,
    required this.currentWeather,
  });
}
