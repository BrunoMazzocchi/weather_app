import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/views/main_screen_view.dart';

void main() {
  runApp(MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
      home: MainScreen()
    );
  }
}
