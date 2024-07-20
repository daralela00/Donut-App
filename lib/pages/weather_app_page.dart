import 'package:donut_app/services/weather_service.dart';
import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';

import '../models/weather_model.dart';

class WeatherAppPage extends StatefulWidget {
  const WeatherAppPage({super.key});

  @override
  State<WeatherAppPage> createState() => _WeatherAppPageState();
}

class _WeatherAppPageState extends State<WeatherAppPage> {

  final weatherService = WeatherService("78cf76903ec44d38e0418650aee7ae75");
  Weather? _weather;

  fetchWeather() async {

    String cityName = await weatherService.getCurrentCity();

    try {
      final weather = await weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition) {
      if (mainCondition == null) return 'assets/sun.json';

      switch (mainCondition.toLowerCase()) {
        case "clouds":
        case "mist":
        case "smoke":
        case "haze":
        case "dust":
        case "fog":
          return "assets/cloud.json";
        case "rain":
        case "drizzle":
        case "shower rain":
          return "assets/rain.json";
        case "thunderstorm":
          return "assets/thunder.json";
        case "clear":
          return "assets/sun.json";
        default:
          return "assets/sun.json";

      }
    }


  @override
  void initState() {
    super.initState();

    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // bottomNavigationBar: Container(
      //   color: const Color.fromRGBO(100, 0, 0, 1),
      //   child: const Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //     child: GNav(
      //       backgroundColor: Color.fromRGBO(100, 0, 0, 1),
      //       color: Colors.white,
      //       activeColor: Colors.white,
      //       tabBackgroundColor: Color.fromARGB(255, 129, 20, 20),
      //       padding: EdgeInsets.all(15),
      //       tabs: [
      //         GButton(
      //           icon: Icons.home,
      //           text: "Home",
      //         ),
      //         GButton(
      //           icon: Icons.settings,
      //           text: "Settings"
      //         ),
      //         GButton(
      //           icon: Icons.info,
      //           text: "Info"
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        title: const Row(
          children: [
              Padding(
                padding: EdgeInsets.only(left: 1),
                child: Text(
                  'Donut',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'Creattion-Demo',
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(100, 0, 0, 1),
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _weather?.cityName ?? "loading city...",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromRGBO(100, 0, 0, 1)
              ),
            ),

            const Icon(
              Icons.location_on,
              size: 30,
              color: Color.fromRGBO(100, 0, 0, 1),
            ),

            const SizedBox(height: 10),

            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

            const SizedBox(height: 10),

            Text(
              "${_weather?.temperature.round() ?? " "}°C",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromRGBO(100, 0, 0, 1)
              ),
            ),

            const SizedBox(height: 10),

            Container(
              height: MediaQuery.sizeOf(context).height * 0.15,
              width: MediaQuery.sizeOf(context).width * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Text(
                          "Max: ${_weather?.tempMax.round() ?? " "}°C",
                          style: const TextStyle(
                            color: Color.fromRGBO(100, 0, 0, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "Min: ${_weather?.tempMin.round() ?? " "}°C",
                          style: const TextStyle(
                            color: Color.fromRGBO(100, 0, 0, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Text(
                          "Wind: ${_weather?.windSpeed.round() ?? " "} m/s",
                          style: const TextStyle(
                            color: Color.fromRGBO(100, 0, 0, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "Humidity: ${_weather?.humidity.round() ?? " "}%",
                          style: const TextStyle(
                            color: Color.fromRGBO(100, 0, 0, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        )
                    ],
                  ),

                  
                ],
              ),
            ),
        
            
          ],
        ),
      ),
    );
  }
}