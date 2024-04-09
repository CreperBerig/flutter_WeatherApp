import 'package:dio/dio.dart';

import 'weather_modul.dart';

class WeatherServis{
  final Dio _dio = Dio();

  Future<WeatherResponse> fetchWeather() async{
    try{
      final response = await _dio.get('https://api.openweathermap.org/data/2.5/weather', queryParameters: {
        'lat': 53.20,
        'lon': 45.00,
        'lang': 'ru',
        'units': 'metric',
        'appid': '8ed2a0cf83e275421deb7b5d15e3bf31',
      });

      print(response);
      return WeatherResponse.fromJson(response.data);
    } catch (error) {
      throw Exception("Failed to load data: $error");
    }
  }
}

//lat=53.20&lon=45.00&lang=ru&units=metric&appid=4aa1ca0b12e06de913eeb23d2b07a0d9