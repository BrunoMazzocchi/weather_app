import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class CityImage extends StatefulWidget {
  final WeatherModel weather;
  final double width;
  final VoidCallback onTap;
  const CityImage({
    Key? key,
    required this.weather,
    required this.onTap, required this.width,
  }) : super(key: key);

  @override
  State<CityImage> createState() => _CityImageState();
}

class _CityImageState extends State<CityImage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(
            top: 20,
          ),
          padding: const EdgeInsets.all(5),
          width: widget.width,
          height: 100,
          decoration: BoxDecoration(
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
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(widget.weather.imagePath).image,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:  [
                  Image(
                    image: Image.network(widget.weather.icon).image,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.weather.weather,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.weather.main?.temp?.toInt()}°',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    widget.weather.city,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
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
