import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                        size: 45,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Color.fromRGBO(6, 57, 112, 1),
                        size: 45,
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
              Container(
                width: width - 50,
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
                          "Today",
                          style: TextStyle(
                            color: Color.fromRGBO(6, 57, 112, 1),
                            fontSize: 15.0,
                            fontFamily: "",
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    InkWell(
                        onTap: () {},
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
                ),
              ),
              SizedBox(
                height: height - 220,
                child: CityImageList(
                  width: width - 50,
                ),
              )
            ],
          )),
    );
  }
}
