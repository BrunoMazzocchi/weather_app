import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:weather_app/bloc/bloc_weather.dart';
import 'package:weather_app/views/main_screen_view.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return BlocProvider(
      bloc: BlocWeather(),
      child: const MaterialApp(home: MainScreen()),
    );
  }
}
