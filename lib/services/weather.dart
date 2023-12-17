import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '322d60dbfe4911901708e0099130b935';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition > 26 && condition < 30) {
      return "☁️";
    } else if (condition > 20 && condition < 25) {
      return "🌧️";
    } else if (condition > 15 && condition < 20) {
      return "🌩️";
    } else if (condition > 5 && condition < 10) {
      return "☃️";
    } else if (condition > 10 && condition < 15) {
      return "🌫️";
    } else if (condition > 30 && condition < 35) {
      return "🔅";
    } else {
      return "😎";
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return "it\'s 🍦 time";
    } else if (temp > 20) {
      return "Time for shorts and 👕";
    } else if (temp > 10) {
      return "You\'ll need 🧣 and 🧤";
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  getImage(int condition) {
    if (condition > 26 && condition < 30) {
      return 'images/cloud.jpg';
    } else if (condition > 21 && condition < 25) {
      return 'images/cloud2.jpg';
    } else if (condition > 16 && condition < 20) {
      return 'images/lightning.jpg';
    } else if (condition > 5 && condition < 10) {
      return 'images/snow.jpg';
    } else if (condition > 11 && condition < 15) {
      return 'images/fog.jpg';
    } else if (condition > 31 && condition < 35) {
      return 'images/sunshine.jpg';
    } else {
      return 'images/black.jpg';
    }
  }
}
