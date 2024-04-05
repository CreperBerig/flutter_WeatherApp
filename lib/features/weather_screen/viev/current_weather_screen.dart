import 'package:flutter/material.dart';
import 'package:simple_weather_app/repositores/weather_modul.dart';

import '../../../repositores/weather_servis.dart';

class CurrentWeatherScreen extends StatefulWidget {
  const CurrentWeatherScreen({super.key});

  @override
  State<CurrentWeatherScreen> createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  late Future<WeatherResponse> _weather;
  @override
  void initState() {
    _weather = WeatherServis().fetchWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather app'),),
      body: Center(
        child: FutureBuilder(
          future: _weather,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Text('Данные полученны');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      )
    );
  }
}