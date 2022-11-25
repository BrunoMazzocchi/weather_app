import 'package:flutter/material.dart';

class Weather {
  final String city;
  final  String temperature;
  final String country;
  final  String weather;
  final Icon icon;
  final String imagePath;

  Weather({
    required this.city,
    required this.temperature,
    required this.country,
    required  this.weather,
    required  this.icon,
    required this.imagePath,
  });
}
