import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  String weatherStateName;
  DateTime date;
  double temp;
  double minTemp;
  double maxTemp;
  WeatherModel({
    required this.weatherStateName,
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    return WeatherModel(
        weatherStateName: data['weather_state_name'],
        date: DateTime.parse(data['created']),
        temp: data['the_temp'],
        minTemp: data['min_temp'],
        maxTemp: data['max_temp']);
  }
  String getImage() {
    if (weatherStateName == 'Clear') {
      return 'assest/images/clear.png';
    } else if (weatherStateName == 'Light Cloud') {
      return 'assest/images/lightcloud.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assest/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assest/images/heavycloud.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'assest/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return 'assest/images/thunderstorm.png';
    } else {
      return 'assest/images/clear.png';
    }
  }

  MaterialColor? getThemeColor() {
    if (weatherStateName == 'Clear') {
      return Colors.blue;
    } else if (weatherStateName == 'Light Cloud') {
      return Colors.blue;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Thunderstorm') {
      return Colors.blueGrey;
    } else {
      return Colors.amber;
    }
  }
}
