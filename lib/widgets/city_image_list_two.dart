import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/views/city_data.dart';

import '../models/weather_model.dart';
import 'city_image.dart';

class CityImageListTwo extends StatelessWidget {

  const CityImageListTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 50;

    List<WeatherModel> weatherList = <WeatherModel>[];
/*
    weatherList.add(Weather(
      city: 'Managua',
      temperature: '30º',
      country: 'Nicaragua',
      weather: 'Sunny',
      icon: const Icon(
        Icons.sunny,
        color: Colors.yellow,
      ),
      imagePath: 'assets/img/managua.jpg',
    ));

    weatherList.add(Weather(
      imagePath: 'assets/img/london.jpg',
      temperature: '20º',
      city: 'London',
      icon: const Icon(
        Icons.snowing,
        color: Colors.white,
      ),
      weather: 'Snow',
      country: 'UK',
    ));
    weatherList.add(Weather(
      imagePath: 'assets/img/london.jpg',
      temperature: '20º',
      city: 'London',
      icon: const Icon(
        Icons.snowing,
        color: Colors.white,
      ),
      weather: 'Snow',
      country: 'UK',
    ));

    weatherList.add(Weather(
      imagePath: 'assets/img/toronto.jpg',
      temperature: '20º',
      city: 'Toronto',
      icon: const Icon(
        Icons.snowing,
        color: Colors.white,
      ),
      weather: 'Snow',
      country: 'Canada',
    ));

    weatherList.add(Weather(
      imagePath: 'assets/img/leon.jpg',
      temperature: '50º',
      city: 'Leon',
      icon: const Icon(
        Icons.local_fire_department_sharp,
        color: Colors.orange,
      ),
      weather: 'Hell',
      country: 'Nicaragua',
    ));
*/


    return ListView(
        scrollDirection: Axis.vertical,
        children: weatherList.map((weather) {
          return CityImage(
            width: width,
            weather: weather,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  CityData(weather: weather, apiUrl: "",)));
            },
          );
        }).toList());
  }
}
