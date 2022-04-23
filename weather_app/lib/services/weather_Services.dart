import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/Weather_Model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WeatherServices {
  // String baseUrl = 'https://api.weatherapi.com/';
  //String apiKey = 'ce6b53e3c195414bb92152607221804';
  String baseUrl2 = 'https://www.metaweather.com';

  Future<int> getCityId({required String cityName}) async {
    //Uri url = Uri.parse('${baseUrl}v1/forecast.json?key=${apiKey}&q=${cityName}&days=7');
    Uri url2 = Uri.parse('$baseUrl2/api/location/search/?query=$cityName');

    http.Response response = await http.get(url2);
    response.body;
    List<dynamic> data = jsonDecode(response.body);
    int cityID = data[0]['woeid'];
    return cityID;
  }

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;
    try {
      int id = await getCityId(cityName: cityName);
      Uri url2 = Uri.parse('$baseUrl2/api/location/$id/');
      http.Response response = await http.get(url2);
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      Map<String, dynamic> data = jsonData['consolidated_weather'][0];

      weatherData = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
      
    }
    return weatherData;
  }
}
