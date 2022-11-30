import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../blocs/weather_bloc.dart';
import '../widgets/main_screen_list_selector.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherBloc blocWeather = BlocProvider.of<WeatherBloc>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(
            top: 30,
            left: 10,
            right: 10,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        print('Hola');
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Color.fromRGBO(6, 57, 112, 1),
                        size: 35,
                      )),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: const Alignment(-0.9, -0.7),
                child: const Text(
                  "Weather",
                  style: TextStyle(
                    color: Color.fromRGBO(6, 57, 112, 1),
                    fontSize: 30.0,
                    fontFamily: "",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const MainScreenListSelector(),
            ],
          )),
    );
  }
}
