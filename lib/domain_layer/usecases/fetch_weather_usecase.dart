

import 'package:dartz/dartz.dart';
import 'package:weather_app/domain_layer/domain_layer.dart';


class FetchWeatherUseCase {

  final FetchWeatherRepository fetchWeatherRepository;

  FetchWeatherUseCase({required this.fetchWeatherRepository});


  Future<Either<WeatherEntity, Failure>> fetchWeatherData({required double lat, required double lon, required int days}) async {
    final result = await fetchWeatherRepository.fetchWeatherData(days: days,lat: lat,lon: lon);
    return result;
  }



}