import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart' as weatherModel;
import 'package:weather_app/views/city_data.dart';

import '../models/Forecast.dart';
import 'city_image.dart';

class CityImageList extends StatelessWidget {
  const CityImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const uri =
        "http://api.openweathermap.org/data/2.5/weather?q=Managua,ni&APPID=&units=metric";

    Future<Forecast> getOpenWeather() async {
      final response = await http.get(Uri.parse(uri));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return Forecast.fromJson(data);
      } else {
        return Forecast.fromJson(data);
      }
    }

    //snapshot.data!.list!.map((e) => e.weather!.map((e) => e.main)).toString()
    //${snapshot.data!.list!.map((e) => e.weather!.map((e) => e.icon))}
    //snapshot.data!.city!.country.toString()
    //${snapshot.data!.list!.map((e) => e.main!.temp)}°
    //snapshot.data!.city!.name.toString()
    return FutureBuilder<Forecast>(
      future: getOpenWeather(),
      builder: (context, snapshot) {
        return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {

                String weatherType = '${snapshot.data?.cnt}';
                String icon = '10n';
                var weather = weatherModel.Weather(
                    country: "",
                    imagePath: 'assets/img/managua.jpg',
                    temperature:
                        '',
                    city: "",
                    icon: ImageIcon(
                      NetworkImage(
                          'http://openweathermap.org/img/w/${icon.replaceAll(RegExp(r'[^\w\s]+'), '')}.png'),
                    ),
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

            });
      },
    );
  }
}
