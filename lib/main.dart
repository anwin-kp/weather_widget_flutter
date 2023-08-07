import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'weather_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            'Weather Widget',
            style: TextStyle(
              color: Colors.white, // Text color
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.black, // App bar background color
          border: null,
        ),
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 211, 211, 211),
          body: WeatherWidget(title: 'Weather'),
        ),
      ),
    );
  }
}
