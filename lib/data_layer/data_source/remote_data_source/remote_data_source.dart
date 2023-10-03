import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data_layer/config/weather_config.dart';
import 'package:weather_app/data_layer/data_layer.dart';
import 'package:weather_app/data_layer/exception/exception.dart';

class FetchWeatherRemoteSrc {
  final http.Client client;

  FetchWeatherRemoteSrc({required this.client});

  Future<WeatherModel> fetchWeatherData(
      {required double lat, required double lon, required int days}) async {
    final String url = "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&cnt=$days&appid=${WeatherConfig.apiKey}";
    final result = await client.get(Uri.parse("$url"), headers: {"Content-Type": "application/json"});
    if (result.statusCode != 200) {
      throw ServerException();
    } else {
      final Map<String, dynamic> response = json.decode(result.body);
      return WeatherModel.fromJson(response);
    }
  }
}
