import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/current_weather/current_weather_model.dart';

class CurrentWeatherApiProvider {
  final Dio _dio = Dio();

  Future<List<CurrentWeather>> fetchCurrentWeatherList(List countries) async {
    List<CurrentWeather> currentWeatherList = [];
    try {
      for (String city in countries) {
        Response response = await _dio.get(
            'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=&units=metric');
        if (response.statusCode == 404) {
            continue;
        } else if (response.statusCode == 200) {
          currentWeatherList.add(CurrentWeather.fromJson(response.data));
        }
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        print(e.response?.statusCode);
      } else {
        print(e.message);
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error Stacktrace: $stacktrace");
      }

      throw Exception('Failed to load weather');
    }
    return currentWeatherList;
  }
}
