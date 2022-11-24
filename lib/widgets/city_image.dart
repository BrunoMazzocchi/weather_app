import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityImage extends StatefulWidget {
  final double width;

  const CityImage({Key? key, required this.width}) : super(key: key);

  @override
  State<CityImage> createState() => _CityImageState();
}

class _CityImageState extends State<CityImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        padding: const EdgeInsets.all(
          5
        ),
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
              image: Image.asset("assets/img/managua.jpg").image,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.sunny,
                  color: Colors.yellow,
                ),
                Text(
                  "Sunny",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "30º",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Managua",
                  style: TextStyle(
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
    );
  }
}
