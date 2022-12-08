import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/models/country_list_model.dart';

class CountryListApiProvider {
  final Dio _dio = Dio();

  Future<List<CountryList>> fetchCountryList() async {
    List<CountryList> countryList = [];
    try {
      Response response = await _dio.get(
          'https://countriesnow.space/api/v0.1/countries');
      if (response.statusCode == 200) {
        countryList.add(CountryList.fromJson(response.data));
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error Stacktrace: $stacktrace");
      }

      throw Exception('Failed to load countries');
    }
    return countryList;
  }
}
