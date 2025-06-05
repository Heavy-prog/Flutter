import 'package:flutter/material.dart';
import 'package:Clima/sevices/location.dart';
import 'package:Clima/sevices/networking.dart';
class WeatherModel{
  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    Networking net = Networking();
    await location.getLocation();
    final weatherData = await net.getResponse(location);
    return weatherData;

  }
  String getWeatherIcon(int condition){
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20 && temp<=25) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}