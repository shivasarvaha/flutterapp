import 'package:fintness_project/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?lat=18.521428&lon=73.8544541&appid=be0d8d36fe6e4800a92851a5eb01a1fd

  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'be0d8d36fe6e4800a92851a5eb01a1fd';

  Future<Weather> getWeather(String lat, String lon) async {
    Map<String, dynamic> parameters = {'lat': lat, 'lon': lon, 'appid': apiKey};
    Uri url = Uri.https(authority, path, parameters);
    http.Response result = await http.get(url);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
