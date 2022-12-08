import 'package:weather_app/models/country_list_model.dart';
import 'package:weather_app/resources/country_list_api_provider.dart';

class CountryListApiRepository {
  final _provider = CountryListApiProvider();

  Future<List<CountryList>> fetchCurrentWeather(){
    return _provider.fetchCountryList();
  }
}