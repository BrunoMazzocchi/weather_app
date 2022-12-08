import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/current_weather/current_weather_model.dart';
import 'city_image_list.dart';

class MainScreenListSelector extends StatelessWidget {
   final Future<List<CurrentWeather>> currentWeatherList;


  const MainScreenListSelector({
    Key? key,
    required this.currentWeatherList,
    // required this.currentWeatherList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 50;
    double height = MediaQuery.of(context).size.height - 220;

    return Column(children: [
      Container(
          width: width,
          height: 50,
          margin: const EdgeInsets.only(
            top: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {},
                  child: const Text(
                    "Today's weather",
                    style: TextStyle(
                      color: Color.fromRGBO(6, 57, 112, 1),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          )),


      SizedBox(
        height: height,
        child: CityImageList(countries: currentWeatherList,),
      ),

    ]);
  }
}
