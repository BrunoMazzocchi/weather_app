import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityData extends StatelessWidget {
  const CityData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset("assets/img/managua.jpg").image,
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
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 45,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  margin: const EdgeInsets.only(
                    top: 20,
                    left: 20
                  ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Row(
                       children:  const [
                         Icon(Icons.sunny,
                           color: Colors.yellow,
                           size: 30,),
                         SizedBox(
                           width: 5,
                         ),
                         Text(
                           "Sunny",
                           style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 25,
                           ),
                         )

                       ],
                     ),
                     Row(
                       children: const [
                          Text(
                           "Managua",
                           style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 20,
                           ),
                           textAlign: TextAlign.left,
                         )
                       ],
                     )
                   ],

                 )
                ),
                const Text("30º",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold
                ),)
              ],
            )
          ],
        ),
        ),
    );
  }
}
