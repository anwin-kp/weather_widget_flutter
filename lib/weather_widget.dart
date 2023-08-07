import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'services/get_weather_icon.dart';

// WeatherData class to hold weather information
class WeatherData {
  WeatherData({
    required this.temperature,
    required this.weatherDescription,
    required this.date,
  });

  final String date;
  final String temperature;
  final String weatherDescription;
}

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({
    Key? key,
    required String title,
  }) : super(key: key);

  @override
  WeatherWidgetState createState() => WeatherWidgetState();
}

class WeatherWidgetState extends State<WeatherWidget> {
  WeatherData weatherData = WeatherData(
    temperature: '0',
    weatherDescription: 'Loading...',
    date: DateFormat('MMMM d, yyyy').format(DateTime.now()),
  );

  @override
  void initState() {
    super.initState();
    // Get the current location and fetch weather data when the widget initializes
    getCurrentLocation().then((position) {
      getWeatherData(position.latitude, position.longitude).then((data) {
        setState(() {
          weatherData = data;
        });
      }).catchError((error) {
        // Show a Cupertino dialog with an error message if weather data fetching fails
        showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text('Error'),
              content: Text(error.toString()),
              actions: [
                CupertinoDialogAction(
                  child: const Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      });
    }).catchError((error) {
      // Show a Cupertino dialog with an error message if getting the current location fails
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Error'),
            content: Text(error.toString()),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    });
  }

  // Method to get the current device location using Geolocator package
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service is disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission is denied.');
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  // Method to fetch weather data from OpenWeatherMap API using http package
  Future<WeatherData> getWeatherData(double lat, double lon) async {
    String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
    Map<String, dynamic> queryParameters = {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'appid': '1335434c2a00b9de35dd15945878eac1',
      'units': 'imperial', // Fetch temperature in Fahrenheit
    };

    try {
      // Build the API URL with query parameters
      Uri uri = Uri.parse(baseUrl).replace(queryParameters: queryParameters);
      // Send a GET request to the API and wait for the response
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        // Parse the JSON data from the response
        Map<String, dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print(data);
        }
        // Extract the temperature and weather description from the data and create a WeatherData object
        WeatherData weatherData = WeatherData(
          temperature: data['main']['temp'].toString(),
          weatherDescription: data['weather'][0]['description'],
          date: DateFormat('MMMM d, yyyy').format(DateTime.now()),
        );
        return weatherData;
      } else {
        throw Exception('Failed to get weather data.');
      }
    } catch (e) {
      throw Exception('Failed to get weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the appropriate weather icon based on the weather description
    Icon weatherIcon = getWeatherIcon(weatherData.weatherDescription);
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: 110,
        width: double.infinity,
        child: Card(
          elevation: 0,
          color: Colors.white,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [Colors.lightBlue[200]!, Colors.lightBlue[100]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                weatherIcon, // Display the weather icon
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weatherData.date, // Display the date
                        style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(150, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        weatherData
                            .weatherDescription, // Display the weather description
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "${weatherData.temperature}F", // Display the temperature in Fahrenheit
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
