import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'weather_widget.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter Widgets are initialized
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(
        255, 88, 88, 88), // Set status bar color to match app bar
    statusBarIconBrightness:
        Brightness.light, // Use light icons (e.g., white) for status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
          backgroundColor:
              Color.fromARGB(255, 88, 88, 88), // App bar background color
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
