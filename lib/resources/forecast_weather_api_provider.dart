import 'package:dio/dio.dart';

import '../models/forecast_weather/forecast_weather_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ForecastWeatherApiProvider {
  final Dio _dio = Dio();

  Future<ForecastWeather> fetchForecastWeather(String coord) async {
    try {
      Response response = await _dio.get(
          'https://api.openweathermap.org/data/3.0/onecall?appid=${dotenv.env['API_KEY']}&lat=35.6895&lon=139.6917&exclude=hourly&units=metric');
      return ForecastWeather.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load weather');
    }
  }
}
