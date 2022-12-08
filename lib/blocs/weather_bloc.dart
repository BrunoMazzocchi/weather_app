import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:weather_app/models/country_list_model.dart';
import 'package:weather_app/models/current_weather/current_weather_model.dart';
import 'package:weather_app/resources/country_list_api_repository.dart';
import 'package:weather_app/resources/current_weather_api_repository.dart';

import '../constants/assets_constants.dart';
import '../models/forecast_weather/forecast_weather_model.dart';
import '../models/weather_model.dart';
import '../resources/forecast_weather_api_repository.dart';

class WeatherBloc implements Bloc {
  final currentWeatherApiRepository = CurrentWeatherApiRepository();
  final forecastWeatherApiRepository = ForecastWeatherApiRepository();
  final countryListApiRepository = CountryListApiRepository();

  // Current weather
  Future<List<CurrentWeather>> getCurrentWeatherList(List countries) =>
      currentWeatherApiRepository.fetchCurrentWeather(countries);


  // Set the image from current weather image
  String hourImage (WeatherModel weather) {
    String currentHourImage = night;
    int time = 1;
    var sunset = DateTime.fromMillisecondsSinceEpoch(
        (weather.currentWeather.sys.sunset) * 1000);
    var currentHour = DateTime.fromMillisecondsSinceEpoch((weather.dt)! * 1000);

    if (currentHour.hour <= 10) {
      time = 1;
    } else if (currentHour.hour > 10 && currentHour.hour <= 15) {
      time = 2;
    } else if (currentHour.hour > 15 && currentHour.hour <= sunset.hour) {
      time = 3;
    } else if (currentHour.hour > sunset.hour) {
      time = 4;
    }
    currentHourImage = night;
    switch (time) {
      case 1:
        currentHourImage = noun;
        break;
      case 2:
        currentHourImage = sun;
        break;
      case 3:
        currentHourImage = afternoon;
        break;
      case 4:
        currentHourImage = night;
        break;
    }

    return currentHourImage;
  }
  // Set the weather background gif
  String weatherBackground(){

    switch (weatherType) {
      case '(Clouds)':
        image = imageCloud;
        break;
      case '(Rain)':
        image = imageRain;
        break;
      case '(Thunderstorm)':
        image = imageStorm;
        break;
      case '(Clear)':
        image = imageClear;
        break;
      case '(Drizzle)':
        image = imageDrizzle;
        break;
      case '(Snow)':
        image = imageSnow;
        break;
    }

    return image;
  }

  // Forecast
  Future<ForecastWeather> getCurrentForecast(String coord) {
    return forecastWeatherApiRepository.fetchForecastWeather(coord);
  }


  // CountryList
  Future<List<CountryList>> getCountryList() {
    return countryListApiRepository.fetchCurrentWeather();
  }



  @override
  void dispose() {
    // TODO: implement dispose
  }
}
