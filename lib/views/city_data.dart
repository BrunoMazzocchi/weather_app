import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../models/forecast_weather/Forecast.dart';
import '../models/weather_model.dart';

class CityData extends StatelessWidget {
  final WeatherModel weather;
  final String apiUrl;

  const CityData({
    Key? key,
    required this.weather,
    required this.apiUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<Forecast> getOpenWeather() async {
      final response = await http.get(Uri.parse(apiUrl));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return Forecast.fromJson(data);
      } else {
        return Forecast.fromJson(data);
      }
    }

    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      body: SlidingUpPanel(

          collapsed: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              )
          ),

        // Panel in the slider
        panel: FutureBuilder<Forecast>(
          future: getOpenWeather(),
          builder: (context, snapshot) {


            return  ListView.builder(
                itemCount: snapshot.data?.daily.length,
                itemBuilder: (context, index) {

                  String icon = '${snapshot.data?.daily[index].weather.map((e) => e.icon)}';
                  var timestamp = (snapshot.data?.daily[index].dt); // timestamp in seconds
                  int temp = ((snapshot.data?.daily[index].temp.max)!.toInt());
                  final DateTime date =
                  DateTime.fromMillisecondsSinceEpoch(timestamp! * 1000);
                  return Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(6, 57, 112, 1),
                    ),
                    child: Column(
                      // Column with the next 5 weather days
                      children: [
                        Container(
                          width: 350,
                          height: 50,
                          margin: const EdgeInsets.only(
                            top: 5,
                          ),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                  ))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 70,
                                child: Text(
                                   "${date.month}/${date.day}/${date.year}",

                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                                child: Image(
                                  image: Image.network('http://openweathermap.org/img/w/${icon.replaceAll(RegExp(r'[^\w\s]+'), '')}.png').image,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                                child: Text(
                                  '$temp°',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });

          },
        ),

        // Panel in the background
        body: Container(
          padding: const EdgeInsets.only(
            top: 30,
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(weather.imagePath).image,
          )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 35,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 220,
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: Image.network(weather.icon).image,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                weather.weather,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                weather.city,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              )
                            ],
                          )
                        ],
                      )),
                  Text(
                    weather.temperature,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
