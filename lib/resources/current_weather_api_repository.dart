import 'package:weather_app/resources/current_weather_api_provider.dart';

import '../models/current_weather/current_weather_model.dart';

class CurrentWeatherApiRepository {
  final _provider = CurrentWeatherApiProvider();

  Future<List<CurrentWeather>> fetchCurrentWeather(List countries){
    return _provider.fetchCurrentWeatherList(countries);
  }
}