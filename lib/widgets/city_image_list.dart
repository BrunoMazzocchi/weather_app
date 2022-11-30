import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/blocs/weather_bloc.dart';
import 'package:weather_app/models/current_weather/current_weather_model.dart';

import '../models/weather_model.dart' as weatherModel;
import '../models/weather_model.dart';
import '../views/city_data.dart';
import 'city_image.dart';

class CityImageList extends StatelessWidget {
  const CityImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherBloc weatherBloc = BlocProvider.of(context);
    double width = MediaQuery.of(context).size.width;

    List countries = [];

    countries.add("Managua,ni");
    countries.add("Masaya,ni");
    countries.add("Jinotega,ni");
    countries.add("Esteli,ni");
    countries.add("Leon,ni");
    countries.add("Chinandega,ni");
    countries.add("Tipitapa,ni");
    countries.add("Tokyo, jp");
    countries.add("California, us");
    countries.add("Zaragoza");
    countries.add("Toronto, ca");



    String imageCloud = 'assets/bg/cloud.gif';
    String imageRain = 'assets/bg/rain.gif';
    String imageStorm = 'assets/bg/storm.gif';
    String imageSnow = 'assets/bg/snow.gif';
    String imageMix = 'assets/bg/mix.gif';
    String imageClear = 'assets/bg/clear.gif';
    String imageDrizzle = 'assets/bg/drizzle.gif';

    return FutureBuilder<List<CurrentWeather>>(
      future: weatherBloc.getCurrentWeatherList(countries),
      builder: (context, snapshot) {
        return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData) {
                String weatherType =
                    '${snapshot.data?[index].weather?.map((e) => e.main)}';
                String icon =
                    '${snapshot.data?[index].weather?.map((e) => e.icon)}';
                String image = imageMix;

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

                WeatherModel weather = weatherModel.WeatherModel(
                     dt: snapshot.data?[index].dt,

                    imagePath: image,
                    currentWeather: snapshot.data![index],
                    city: '${snapshot.data?[index].name}',
                    icon:
                        'http://openweathermap.org/img/w/${icon.replaceAll(RegExp(r'[^\w\s]+'), '')}.png',
                    weather: weatherType.replaceAll(RegExp(r'[^\w\s]+'), ''));

                String coord = 'lat=${weather.currentWeather.coord.lat}&lon=${weather.currentWeather.coord.lon}';
                var uri = "https://api.openweathermap.org/data/3.0/onecall?$coord&exclude=hourly,minutely&appid=$key&units=metric";
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
