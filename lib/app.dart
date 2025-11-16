import 'package:flutter/material.dart';
import 'package:weatherhint/Ui/weather_screen.dart';

class WeatherHint extends StatefulWidget {
  const WeatherHint({super.key});

  @override
  State<WeatherHint> createState() => _WeatherHintState();
}

class _WeatherHintState extends State<WeatherHint> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
    );
  }
}
