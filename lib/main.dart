import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:weather_app/views/main_screen_view.dart';

import 'blocs/weather_bloc.dart';

Future main() async {
  await dotenv.load(fileName: "lib/.env");
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
      bloc: WeatherBloc(),
      child: const MaterialApp(home: MainScreen()),
    );
  }
}
