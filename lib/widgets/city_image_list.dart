import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/views/city_data.dart';

import 'city_image.dart';

class CityImageList extends StatelessWidget {
  final double width;

  const CityImageList({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        CityImage(
          width: width,
          imagePath: 'assets/img/managua.jpg',
          temperature: '30º',
          city: 'Managua',
          icon: const Icon(
            Icons.sunny,
            color: Colors.yellow,
          ), weather: 'Sunny', onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CityData()));
        },
        ),
        CityImage(
          width: width,
          imagePath: 'assets/img/london.jpg',
          temperature: '10º',
          city: 'London',
          icon: const Icon(
            Icons.cloudy_snowing,
            color: Colors.white,
          ), weather: 'Snowy', onTap: () {  },
        ),
        CityImage(
          width: width,
          imagePath: 'assets/img/toronto.jpg',
          temperature: '10º',
          city: 'Toronto',
          icon: const Icon(
            Icons.storm,
            color: Colors.white,
          ), weather: 'Raining', onTap: () {  },
        ),


      ]);
  }
}
