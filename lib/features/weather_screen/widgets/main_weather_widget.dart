import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simple_weather_app/repositores/weather_modul.dart';

class MainWeatherWidget extends StatelessWidget {
  final WeatherResponse weather;
  const MainWeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(now);

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.35, 0.65],
            colors: gardientColors(now.hour)
            )
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(15, 15, 19, 0.75),
                borderRadius: BorderRadius.circular(8)
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "📍 ${weather.name}",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(color: Colors.white70, fontSize: 16)
                    ),
                  ),
                  Text(
                    "${getTimeSlesher(now.hour)}",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                      fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(getImage(weather.weather[0].id)),
            Center(
              child: Column(
                children: [
                  Text(
                    '${weather.main.temp.round()} °C',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 42,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Text('${weather.weather[0].description.toUpperCase()}',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                  Text('${getWeekDay(now.weekday)} - ${formattedTime}',
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/6.png', scale: 8,),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Восход", style: GoogleFonts.inter(
                                textStyle: TextStyle(color: Colors.white, fontSize: 14),
                              ),),
                              Text("${convertTime(weather.sys.sunrise)}",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)
                              ),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(width: 15,),
                      Row(
                        children: [
                          Image.asset('assets/12.png', scale: 8,),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Закат", style: GoogleFonts.inter(
                                textStyle: TextStyle(color: Colors.white, fontSize: 14),
                              ),),
                              Text("${convertTime(weather.sys.sunset)}", style: GoogleFonts.inter(
                                textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)
                              ),)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/14.png', scale: 8,),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Мин.", style: GoogleFonts.inter(
                                textStyle: TextStyle(color: Colors.white, fontSize: 14),
                              ),),
                              Text("${weather.main.temp_min.round()} °C", style: GoogleFonts.inter(
                                textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)
                              ),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(width: 15,),
                      Row(
                        children: [
                          Image.asset('assets/13.png', scale: 8,),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Макс.", style: GoogleFonts.inter(
                                textStyle: TextStyle(color: Colors.white, fontSize: 14),
                              ),),
                              Text("${weather.main.temp_max.round()} °C", style: GoogleFonts.inter(
                                textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)
                              ),)
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

  String getImage(int weatherCod) {
    int firstDigit = weatherCod ~/ 100;
    if (weatherCod == 800) {
      return 'assets/6.png';
    }else{
    switch(firstDigit){
      case 2: return 'assets/1.png';
      case 3: return 'assets/2.png';
      case 5: return 'assets/3.png';
      case 6: return 'assets/4.png';
      case 7: return 'assets/5.png';
      case 8: return 'assets/8.png';
      default: return 'assets/12.png';
    }
    }
  }

  String getWeekDay(int weekday){
    List<String> weekdays = ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье',];
    return weekdays[weekday - 1];
  }

  String getTimeSlesher(int hour){
    if(hour >=5 && hour < 11){
      return 'Доброе утро';
    } else if(hour >=11 && hour < 17) {
      return 'Добрый день';
    } else if(hour>=17 && hour < 23) {
      return 'Добрый вечер';
    } else {
      return 'Доброй ночи';
    }
  }

  String convertTime(int time) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return DateFormat('HH:mm').format(dateTime);
  }

  List<Color> gardientColors(int hour) {
    List<List<Color>> gradientColor = [
      [Color.fromRGBO(61, 0, 214, 1), Color.fromRGBO(255, 135, 67, 1), Color.fromRGBO(15, 15, 19, 1)],
      [Color.fromRGBO(255, 247, 54, 1), Color.fromRGBO(98, 247, 131, 1), Color.fromRGBO(15, 15, 19, 1)],
      [Color.fromRGBO(253, 68, 56, 1), Color.fromRGBO(255, 247, 54, 1), Color.fromRGBO(15, 15, 19, 1)],
      [Color.fromRGBO(161, 98, 247, 1), Color.fromRGBO(61, 0, 214, 1), Color.fromRGBO(15, 15, 19, 1)],
    ];

    if(hour >=5 && hour < 11){
      return gradientColor[0];
    } else if(hour >=11 && hour < 17) {
      return gradientColor[1];
    } else if(hour>=17 && hour < 23) {
      return gradientColor[2];
    } else {
      return gradientColor[3];
    }
  }
}