import 'dart:collection';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:weather_app/models/country_list_model.dart';
import 'package:weather_app/widgets/custom_drawer.dart';

import '../blocs/weather_bloc.dart';
import '../widgets/main_screen_list_selector.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List currentList = [];
  LinkedHashMap<String?, List<String>?> citiesList = LinkedHashMap();

  List<CountryList> countriesList = [];

  Widget topIconBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.menu,
            color: Color.fromRGBO(6, 57, 112, 1),
            size: 35,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ],
    );
  }

  void changeList(String country) {
    setState(() {
      citiesList.forEach((key, value) {
        if (key == country) {
          currentList = value!.toList();
        }
      });
    });
  }

  Widget mainTitle() {
    return Container(
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
    );
  }

  Widget bodyContainer(WeatherBloc blocWeather) {
    return Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 10,
          right: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              topIconBar(),
              mainTitle(),
              MainScreenListSelector(
                currentWeatherList:
                    blocWeather.getCurrentWeatherList(currentList),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    WeatherBloc blocWeather = BlocProvider.of<WeatherBloc>(context);

    List<CountryList> getCountries() {
      countryList.then((value) {
        for (var element in value) {
          countries.add(element);
        }
      });
      return countries;
    }

    LinkedHashMap<String?, List<String>?> createCountryList() {
      getCountries();
      for (var element in countries) {
        element.data?.forEach((country) {
          citiesList.addAll({country.country: country.cities});
        });
      }

      return citiesList;
    }

    createCountryList();

    Future<List<CountryList>> getCountries() async {
      List<CountryList> countries = await blocWeather.getCountryList();
      for (var country in countries) {
        countriesList.add(country);
      }
      return countriesList;
    }

    Future<LinkedHashMap<String?, List<String>?>> createCountryList() async {
      await getCountries();
      for (var element in countriesList) {
        element.data?.forEach((country) {
          citiesList.addAll({country.country: country.cities});
        });
      }
      return citiesList;
    }


    createCountryList();
    return Scaffold(
      key: _scaffoldKey,
      body: bodyContainer(blocWeather),
      drawer: CustomDrawer(
        citiesList: citiesList,
        changeList: (String country) {
          setState(() {
            citiesList.forEach((key, value) {
              if (key == country) {
                currentList = value!.toList();
              }
            });
          });
        },
      ),
    );
  }
}
