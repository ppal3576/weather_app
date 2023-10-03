
import 'package:dartz/dartz.dart';

import '../domain_layer.dart';

abstract class FetchWeatherRepository {
  Future<Either<WeatherEntity, Failure>> fetchWeatherData({required double lat, required double lon, required int days});
}