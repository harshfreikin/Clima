import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constant.dart';


class WeatherModel {

  Future <dynamic> getCityWeather(String cityName)async{
    NetworkHelper networkHelper =NetworkHelper
   ('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

    Future<dynamic>getLocationWeather() async {
      Location location = Location();

      await location.getCurrentLocation();
      NetworkHelper networkHelper = NetworkHelper(
          // '$openWeatherUrl?lat=${location.latitude}&lon=${location
          //     .longitude}&appid=$apiKey&units=metric'
           "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=28573d08277b26d202750799e10af022&unit=metric"
      );

      var weatherData = await networkHelper.getData();
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