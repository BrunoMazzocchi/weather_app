import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/current_weather/current_weather_model.dart';

class CurrentWeatherApiProvider {
  final key = '';
  final Dio _dio = Dio();

  Future<List<CurrentWeather>> fetchCurrentWeatherList(List countries) async {
    List<CurrentWeather> currentWeatherList = [];
    try {
      for (String city in countries) {
        Response response = await _dio.get(
            'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=&units=metric');
        if (response.statusCode == 200) {
          currentWeatherList.add(CurrentWeather.fromJson(response.data));
        }
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception ocurred: $error Stacktrace: $stacktrace");
      }

      throw Exception('Failed to load weather');
    }
    return currentWeatherList;
  }
}
