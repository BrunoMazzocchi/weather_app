import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Forecast.dart';
import '../models/ListForecast.dart';
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



    const uri = "https://api.openweathermap.org/data/2.5/forecast?q=Managua,ni&exclude=hourl,dailyy&appid=edd08c19bc542d5c0adee3ac5a476856";

    Future <List<Forecast>> getOpenWeather() async  {
    List<Forecast> forecastList= [];

      for (var element in countries) {

        final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$element&exclude=hourl,dailyy&appid='));
        var data = jsonDecode(response.body.toString());

        if (response.statusCode == 200) {
          forecastList.add(Forecast.fromJson(data));
          continue;
        } else {
          throw Exception('Failed to load weather for $element');
        }
      }
      return forecastList;
    }

    String imageCloud = 'assets/img/cloud.gif';
    String imageRain = 'assets/img/rain.gif';
    String imageStorm = 'assets/img/storm.gif';
    String imageSnow = 'assets/img/snow.gif';
    String imageMix = 'assets/img/mix.gif';
    String imageClear = 'assets/img/clear.gif';
    String imageDrizzle = 'assets/image/drizzle.gif';


    return FutureBuilder<List<Forecast>>(
      future: getOpenWeather(),
      builder: (context, snapshot) {

        return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {

              ListForecast? fList = snapshot.data?[index].list.first;
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData) {
                String weatherType = '${fList!.weather.map((e) => e.main)}';
                String icon = '${fList!.weather.map((e) => e.icon)}';
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
                    country: '${snapshot.data?[index].city.country}',
                    imagePath: image,
                    temperature: '${(fList.main!.temp! - 273.15).toInt()}°',
                    city: '${snapshot.data?[index].city.name}',
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
