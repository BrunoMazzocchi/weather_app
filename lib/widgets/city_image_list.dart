import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/current_weather/CurrentWeather.dart';

import '../models/weather_model.dart' as weatherModel;
import '../views/city_data.dart';
import 'city_image.dart';

class CityImageList extends StatelessWidget {
  const CityImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List countries = [];

    countries.add("Managua,ni");
    countries.add("Masaya,ni");
    countries.add("Jinotega,ni");
    countries.add("Esteli,ni");
    countries.add("Leon,ni");
    countries.add("Chinandega,ni");
    countries.add("Tipitapa,ni");


    const key = '';
    const uri = "https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=hourly,minutely&appid=$key";
    Future <List<CurrentWeather>> getOpenWeather() async  {
    List<CurrentWeather> currentWeatherList= [];

      for (var element in countries) {

        final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$element&appid=$key'));
        var data = jsonDecode(response.body.toString());
        if (response.statusCode == 200) {
          currentWeatherList.add(CurrentWeather.fromJson(data));
          continue;
        } else {
          throw Exception('Failed to load weather for $element');
        }
      }
      return currentWeatherList;
    }

    String imageCloud = 'assets/img/cloud.gif';
    String imageRain = 'assets/img/rain.gif';
    String imageStorm = 'assets/img/storm.gif';
    String imageSnow = 'assets/img/snow.gif';
    String imageMix = 'assets/img/mix.gif';
    String imageClear = 'assets/img/clear.gif';
    String imageDrizzle = 'assets/image/drizzle.gif';


    return FutureBuilder<List<CurrentWeather>>(
      future: getOpenWeather(),
      builder: (context, snapshot) {

        return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {

              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData) {
                String weatherType = '${snapshot.data?[index].weather.map((e) => e.main)}';
                String icon = '${snapshot.data?[index].weather.map((e) => e.icon)}';
                String image = imageMix;

                switch(weatherType){
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

                var weather = weatherModel.WeatherModel(
                    country: '',
                    imagePath: image,
                    temperature: '${(snapshot.data?[index].main.temp)?.toInt()}°',
                    city: '${snapshot.data?[index].name}',
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
