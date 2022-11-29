import 'package:flutter/material.dart';

import 'city_image_list.dart';
import 'city_image_list_two.dart';

class MainScreenListSelector extends StatefulWidget {
  const MainScreenListSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreenListSelector> createState() => _MainScreenListSelectorState();
}

class _MainScreenListSelectorState extends State<MainScreenListSelector> {


  Widget currentList =  const CityImageList();
  Widget weatherList =  const CityImageList();
  Widget weatherList2 = const CityImageListTwo();

  changeWeather(int list) {
    setState(() {
      switch (list) {
        case 1:
          currentList = weatherList;
          break;
        case 2:
          currentList = weatherList2;
          break;
      }
    });
  }

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
                  onTap: () {
                    changeWeather(1);
                  },
                  child: const Text(
                    "Today",
                    style: TextStyle(
                      color: Color.fromRGBO(6, 57, 112, 1),
                      fontSize: 15.0,
                      fontFamily: "",
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              InkWell(
                  onTap: () {
                    changeWeather(2);
                  },
                  child: const Text(
                    "Tomorrow",
                    style: TextStyle(
                      color: Color.fromRGBO(6, 57, 112, 1),
                      fontSize: 15.0,
                      fontFamily: "",
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          )),
      SizedBox(
        height: height,
        child: currentList,
      )
    ]);
  }
}
