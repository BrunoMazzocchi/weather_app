import 'package:flutter/material.dart';

class CityImage extends StatefulWidget {
  final double width;
  final String imagePath;
  final String temperature;
  final String city;
  final Icon icon;
  final String weather;
  final VoidCallback onTap;
  const CityImage({
    Key? key,
    required this.width,
    required this.imagePath,
    required this.temperature,
    required this.city,
    required this.icon, required this.weather, required this.onTap,
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
                image: Image.asset(widget.imagePath).image,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:  [
                  widget.icon,
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.weather,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.temperature,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    widget.city,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
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
