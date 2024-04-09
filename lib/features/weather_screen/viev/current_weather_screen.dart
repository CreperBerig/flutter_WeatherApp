import 'package:flutter/material.dart';
import 'package:simple_weather_app/repositores/weather_modul.dart';

import '../../../repositores/weather_servis.dart';
import '../widgets/main_weather_widget.dart';

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
      backgroundColor: Colors.purpleAccent.shade700,
      /*appBar: AppBar(
        title: Text(
          'Weather app',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600
            ),
          ),
        backgroundColor: Colors.purpleAccent.shade700,
        ),*/
      body: Center(
        child: FutureBuilder(
          future: _weather,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return MainWeatherWidget(weather: snapshot.requireData,);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      )
    );
  }
}