import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/widgets/main_screen_list_selector.dart';

import '../widgets/city_image_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Color.fromRGBO(6, 57, 112, 1),
                        size: 35,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Color.fromRGBO(6, 57, 112, 1),
                        size: 35,
                      ))
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
