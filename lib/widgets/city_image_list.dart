import 'package:flutter/material.dart';
import 'package:weather_app/blocs/weather_bloc.dart';
import 'package:weather_app/models/current_weather/current_weather_model.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../constants/assets_constants.dart';
import '../models/weather_model.dart' as weather_model;
import '../models/weather_model.dart';
import '../views/city_data.dart';
import 'city_image.dart';

class CityImageList extends StatelessWidget {
  final Future<List<CurrentWeather>> countries;

  const CityImageList({
    Key? key,
    required this.countries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    WeatherBloc weatherBloc = BlocProvider.of(context);
    double width = MediaQuery.of(context).size.width;



    return FutureBuilder<List<CurrentWeather>>(
      future: countries,
      builder: (context, snapshot) {
        return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData) {
                // These are coming from 'constants/assets_constants'

                weatherType =
                    '${snapshot.data?[index].weather?.map((e) => e.main)}';

                String icon =
                    '${snapshot.data?[index].weather?.map((e) => e.icon)}';


                String image = weatherBloc.weatherBackground();

                WeatherModel weather = weather_model.WeatherModel(
                    dt: snapshot.data?[index].dt,
                    imagePath: image,
                    currentWeather: snapshot.data![index],
                    city: '${snapshot.data?[index].name}',
                    icon: // Gets the icon image and remove everything just in case
                        'http://openweathermap.org/img/w/${icon.replaceAll(RegExp(r'[^\w\s]+'), '')}.png',
                    weather: weatherType.replaceAll(RegExp(r'[^\w\s]+'), ''));

                return CityImage(
                  width: width,
                  weather: weather,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CityData(weather: weather)));
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
