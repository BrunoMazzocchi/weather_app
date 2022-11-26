import 'package:flutter/material.dart';

class WeatherModel {
  final String city;
  final  String temperature;
  final String country;
  final  String weather;
  final String  icon;
  final String imagePath;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.country,
    required  this.weather,
    required  this.icon,
    required this.imagePath,
  });
}
