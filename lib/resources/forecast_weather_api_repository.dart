import 'package:weather_app/resources/forecast_weather_api_provider.dart';

import '../models/forecast_weather/forecast_weather_model.dart';

class ForecastWeatherApiRepository {
  final _provider = ForecastWeatherApiProvider();

  Future<ForecastWeather> fetchForecastWeather(String coord) {
    return _provider.fetchForecastWeather(coord);
  }
}
