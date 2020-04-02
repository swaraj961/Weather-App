import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';
const apikey = '54668cdcac911bf5adbe9d3714990753';
const openweatherAPI = 'https://api.openweathermap.org/data/2.5/weather';
 class WeatherModel {
Future<dynamic> getcityname(String cityname) async{
  var url = '$openweatherAPI?q=$cityname&appid=$apikey&units=metric';
  NetworkHelper n2 = NetworkHelper(url);
  var citydata =  await n2.getdata();
  return citydata;
}

Future<dynamic> getweatherlocation() async{
  Location loc = Location();
    await loc.getcurrentlocation();
   
  //using package get latt and longi

    NetworkHelper n1 = NetworkHelper(
        '$openweatherAPI?lat=${loc.lattitude}&lon=${loc.longitude}&appid=$apikey&units=metric'); // puttedinto url
    var weatherdata = await n1.getdata(); 
    return weatherdata;
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
