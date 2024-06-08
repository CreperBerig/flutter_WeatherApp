import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import 'weather_modul.dart';

class WeatherService {
  final Dio _dio = Dio();
  final api_key = '8ed2a0cf83e275421deb7b5d15e3bf31';

  Future<WeatherResponse> fetchWeather() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


      final response = await _dio.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
          'lat': position.latitude,
          'lon': position.longitude,
          'units': 'metric',
          'lang': 'ru',
          'appid': api_key,
        },
      );
      return WeatherResponse.fromJson(response.data);
    } catch (error) {
      throw Exception("Failed to load data: $error");
    }
  }
}

//lat=53.20&lon=45.00&lang=ru&units=metric&appid=4aa1ca0b12e06de913eeb23d2b07a0d9