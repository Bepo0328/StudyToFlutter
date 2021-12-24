// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  String? cityName;
  int? temp;

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    temp = weatherData['main']['temp'].toInt();
    cityName = weatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$cityName',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '$temp',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
