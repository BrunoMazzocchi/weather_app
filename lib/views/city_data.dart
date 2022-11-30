import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:http/http.dart' as http;
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/blocs/weather_bloc.dart';

import '../models/forecast_weather/forecast_weather_model.dart';
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
    WeatherBloc weatherBloc = BlocProvider.of(context);

    var sunset =
        DateTime.fromMillisecondsSinceEpoch((weather.currentWeather.sys.sunset)! * 1000);
    var sunrise =
        DateTime.fromMillisecondsSinceEpoch((weather.currentWeather.sys.sunrise)! * 1000);
    var currentHour = DateTime.fromMillisecondsSinceEpoch((weather.dt)! * 1000);
    int time = 1;


    String currentHourImage = 'assets/img/night.svg';
    if (currentHour.hour <= 10) {
      time = 1;
    } else if (currentHour.hour > 10 && currentHour.hour <= 15) {
      time = 2;
    } else if (currentHour.hour > 15 && currentHour.hour <= sunset.hour) {
      time = 3;
    } else if (currentHour.hour > sunset.hour) {
      time = 4;
    }
    currentHourImage = 'assets/img/night.svg';
    switch (time) {
      case 1:
        currentHourImage = 'assets/img/noun.svg';
        break;
      case 2:
        currentHourImage = 'assets/img/sun.svg';
        break;
      case 3:
        currentHourImage = 'assets/img/afternoon.svg';
        break;
      case 4:
        currentHourImage = 'assets/img/night.svg';
        break;
    }



    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      body: SlidingUpPanel(
        maxHeight: 400,

        collapsed: Container(
            decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        )),

        // Panel in the slider
        panel: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(6, 57, 112, 1),
          ),
          child: FutureBuilder<ForecastWeather>(
            future: weatherBloc.getCurrentForecast(''),
            builder: (context, snapshot) {

              return ListView.builder(
                  itemCount: snapshot.data?.daily.length,
                  itemBuilder: (context, index) {
                    if(snapshot.data !=null) {
                      String icon =
                          '${snapshot.data?.daily[index].weather.map((e) => e.icon)}';

                      String temp =
                      (('${snapshot.data?.daily[index].temp?.max.toInt()}'));

                      var timestamp = (snapshot
                          .data?.daily[index].dt); // timestamp in seconds


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
                                      image: Image.network(
                                          'http://openweathermap.org/img/w/${icon.replaceAll(RegExp(r'[^\w\s]+'), '')}.png')
                                          .image,
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
                    } else {
                      return const SizedBox(
                        width: 60,
                        height: 100,
                        child: CircularProgressIndicator(),
                      );
                    }
                  });
            },
          ),
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
                    '${weather.currentWeather.main?.temp?.toInt()}°',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width - 20,
                margin: const EdgeInsets.only(
                  top: 50,
                  left: 10,
                  right: 10,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'It feels like: ${weather.currentWeather.main?.feelsLike?.toInt()}°',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Min temperature today: ${weather.currentWeather.main?.tempMin?.toInt()}°',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Max temperature today: ${weather.currentWeather.main?.tempMax?.toInt()}°',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'The pressure today: ${weather.currentWeather.main?.pressure?.toInt()}°',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'The pressure today: ${weather.currentWeather.main?.pressure?.toInt()}°',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          currentHourImage,
                          color: Colors.black,
                          width: 50,
                          height: 50,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                    'Sunrise: ${sunrise.hour}:${sunrise.minute}'),
                                Text('Sunset: ${sunset.hour}:${sunset.minute}'),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
