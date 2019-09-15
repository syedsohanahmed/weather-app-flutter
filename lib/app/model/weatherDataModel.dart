import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather/app/weatherdata.dart';

class WeatherDataModel extends ChangeNotifier {
  //To make singleton class
  static final WeatherDataModel _weatherDataModel =
      new WeatherDataModel._internal();

  factory WeatherDataModel() {
    return _weatherDataModel;
  }
  WeatherDataModel._internal();
  WeatherData _weather;
  final apiKey = "c65cfd1d349d708a4c1fba7633d23bed";

  //To fetch the value from API
  Future getWeatherData() async {
    final response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=chennai&appid=$apiKey&units=metric");
    Map responseBody = json.decode(response.body);

    //Assigning the returned value to a WeatherData variable
    _weather = WeatherData.fromJson(responseBody);
    print("SunRise: " + _weather.sunriseTime.toString());
    print("Sunset : " + _weather.sunsetTime.toString());
  }

  String get weatherDescription => _weather.description;

  double get weatherWindSpeed => _weather.windSpeed;

  int get weatherSunriseTime => _weather.sunriseTime;

  int get weatherSunsetTime => _weather.sunsetTime;

  num get weatherTemperature => _weather.temperature;

  int get weatherHumidity => _weather.humidity;

  String get weatherIconLabel => _weather.iconLabel;
}