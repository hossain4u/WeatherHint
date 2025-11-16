import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  //-----------------Network--------------------
  Future<void> geoLocation(String city) async {
    final url = Uri.parse("https://geocoding-api.open-meteo.com/v1/search?name=$city&count=1&format=json");
    final res = await http.get(url);
    print("response: ${res.body}");
    if (res.statusCode !=200) throw Exception("Geocoding failed ${res.statusCode}");
    final deData = jsonDecode(res.body) as Map<String,dynamic>;

    final result = (deData['results']as List?)?? [];
    if (result.isEmpty) throw Exception("City Not Found");

    final m = result.first as Map<String,dynamic>;
    final lat = (m['latitude'] as num).toDouble();
    final lon = (m['longitude'] as num).toDouble();
    final name = "${m['name']},${m['country']}";

    print("lat= $lat, lon: $lon, name:$name");

  }

  @override
  void initState() {
    geoLocation("Dhaka");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('weather app')));
  }
}
