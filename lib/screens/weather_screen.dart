import 'package:fintness_project/data/weather.dart';
import 'package:fintness_project/shared/menu_bottom.dart';
import 'package:fintness_project/shared/menu_drawer.dart';
import 'package:flutter/material.dart';
import '../data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      appBar: AppBar(title: const Text('Weather Info')),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [Padding(padding: EdgeInsets.all(16))],
          )),
    );
  }

  Future<void> getData() async {
    HttpHelper http = HttpHelper();
    result = await http.getWeather('18.521428', '73.8544541');
    setState(() {});
  }
}
