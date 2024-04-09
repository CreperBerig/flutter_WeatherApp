import 'package:flutter/material.dart';
import 'package:simple_weather_app/repositores/weather_modul.dart';

class MainWeatherWidget extends StatelessWidget {
  final WeatherResponse weather;
  const MainWeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "📍 ${weather.name}",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            Text(
              "Доброе утро",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Image.asset('assets/8.png'),
            Center(
              child: Column(
                children: [
                  Text(
                    '${weather.main.temp.round()} °C',
                    style: TextStyle(
                      fontSize: 42,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                      ),
                  ),
                  Text('${weather.weather[0].description.toUpperCase()}',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Text('Вторник - 15:12',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/6.png', scale: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Восход", style: TextStyle(color: Colors.white, fontSize: 14),),
                              Text("07:15", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/12.png', scale: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Закат", style: TextStyle(color: Colors.white, fontSize: 14),),
                              Text("19:15", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/14.png', scale: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Мин.", style: TextStyle(color: Colors.white, fontSize: 14),),
                              Text("${weather.main.temp_min} °C", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/15.png', scale: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Макс.", style: TextStyle(color: Colors.white, fontSize: 14),),
                              Text("${weather.main.temp_max} °C", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}