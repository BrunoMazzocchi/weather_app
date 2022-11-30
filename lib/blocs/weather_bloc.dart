import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:weather_app/models/current_weather/current_weather_model.dart';
import 'package:weather_app/resources/current_weather_api_repository.dart';

import '../models/forecast_weather/forecast_weather_model.dart';
import '../resources/forecast_weather_api_repository.dart';

class WeatherBloc implements Bloc {
  final currentWeatherApiRepository = CurrentWeatherApiRepository();
  final forecastWeatherApiRepository = ForecastWeatherApiRepository();

  Future<List<CurrentWeather>> getCurrentWeatherList(List countries) =>
      currentWeatherApiRepository.fetchCurrentWeather(countries);

  Future<ForecastWeather> getCurrentForecast(String coord) {
    return forecastWeatherApiRepository.fetchForecastWeather(coord);
  }



  @override
  void dispose() {
    // TODO: implement dispose
  }
}
