import 'package:dio/dio.dart';

import '../models/forecast_weather/forecast_weather_model.dart';

class ForecastWeatherApiProvider {
  final Dio _dio = Dio();

  Future<ForecastWeather> fetchForecastWeather(String coord) async {
    try {
      Response response = await _dio.get(
          'https://api.openweathermap.org/data/3.0/onecall?appid=&lat=35.6895&lon=139.6917&exclude=hourly,minutely');
      return ForecastWeather.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception('Failed to load weather');
    }
  }
}
