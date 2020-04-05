import '../services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../services/networking.dart';

class WeatherModel {
  Future getTextLocationWeather(String locationName) async {
    NetworkHelper n = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?q=$locationName&appid=1841643540a7fba3fb2e180bef97f9fa&units=metric");
    var weatherData = await n.getWeather();
    return weatherData;
  }

  Future getLocationWeather() async {
    LocationInfo l = LocationInfo();

    await l.getLocation();
    print("Getting lat long");

    double lat = l.lat;
    double long = l.long;
    NetworkHelper n = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=1841643540a7fba3fb2e180bef97f9fa&units=metric");
    var weatherData = await n.getWeather();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
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
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
