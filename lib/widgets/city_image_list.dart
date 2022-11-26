import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Forecast.dart';
import '../models/List.dart';
import '../models/weather_model.dart' as weatherModel;
import '../views/city_data.dart';
import 'city_image.dart';

class CityImageList extends StatelessWidget {
  const CityImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const uri = "https://api.openweathermap.org/data/2.5/forecast?q=Managua,ni"
        "&appid=";

    Future<Forecast> getOpenWeather() async {
      final response = await http.get(Uri.parse(uri));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return Forecast.fromJson(data);
      } else {
        throw Exception('Failed to load weather');
      }
    }



    return FutureBuilder<Forecast>(
      future: getOpenWeather(),
      builder: (context, snapshot) {
        int timestamp = DateTime.now().millisecondsSinceEpoch;
        Iterable<FList> flist = snapshot.data!.list.getRange(2, 5);
        FList fList = snapshot.data!.list.first;
        print(fList.weather!.map((e) => e.main));
        return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData) {
                String weatherType = '${fList.weather!.map((e) => e.main)}';
                String icon = '${fList.weather!.map((e) => e.icon)}';
                var weather = weatherModel.WeatherModel(
                    country: '${snapshot.data?.city.country}',
                    imagePath: 'assets/img/managua.jpg',
                    temperature: '${(fList.main!.temp! - 273.15).toInt()}°',
                    city: '${snapshot.data?.city.name}',
                    icon: 'http://openweathermap.org/img/w/${icon.replaceAll(RegExp(r'[^\w\s]+'), '')}.png',
                    weather: weatherType.replaceAll(RegExp(r'[^\w\s]+'), ''));
                return CityImage(
                  width: width,
                  weather: weather,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CityData(
                                  weather: weather,
                                  apiUrl: uri,
                                )));
                  },
                );
              } else {
                return const SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                );
              }
            });
      },
    );
  }
}
