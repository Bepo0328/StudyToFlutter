// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_weather/data/my_location.dart';
import 'package:flutter_weather/data/network.dart';
import 'package:flutter_weather/screens/weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = 'Your Api Key';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?'
            'lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=${apikey}&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution?'
            'lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=${apikey}');

    var weatherData = await network.getWeatherData();
    var airData = await network.getAirData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherScreen(
            parseWeatherData: weatherData,
            parseAirData: airData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
