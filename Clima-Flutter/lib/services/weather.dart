import 'package:clima/utilities/constants.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

class WeatherModel {
  Future<dynamic> getWeatherByCity(String city) async {
    NetworkHelper networkHelper = NetworkHelper(
      url: baseUrlApi + 'q=$city' + metricUnits + appid,
    );
    var decodedData = await networkHelper.getData();
    return decodedData;
  }

  Future<dynamic> getWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
      url: baseUrlApi +
          'lat=${location.lat}&lon=${location.long}' +
          metricUnits +
          appid,
    );
    var decodedData = await networkHelper.getData();
    return decodedData;
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
