import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/data_layer/data_layer.dart';
import 'package:weather_app/di.dart';
import 'package:weather_app/domain_layer/domain_layer.dart';
import 'package:weather_app/domain_layer/entities/wether_entity.dart';
import 'package:http/http.dart' as http;

class FetchWeatherProvider with ChangeNotifier {

  final FetchWeatherUseCase fetchWeatherUseCase;
  Either<WeatherEntity,Failure>? _weather;

  FetchWeatherProvider({required this.fetchWeatherUseCase});

  Either<WeatherEntity,Failure>? get weather => _weather;

  Future<void> fetchWeatherData({required double lat, required double lon, required int days}) async {
    _weather = await fetchWeatherUseCase.fetchWeatherData(lon: lat,lat: lon,days: days);
    notifyListeners();
  }
}
