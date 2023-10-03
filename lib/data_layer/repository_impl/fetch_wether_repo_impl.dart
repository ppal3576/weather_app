import 'package:dartz/dartz.dart';
import 'package:weather_app/data_layer/data_layer.dart';
import 'package:weather_app/data_layer/exception/exception.dart';
import 'package:weather_app/domain_layer/domain_layer.dart';

class FetchWeatherRepoImpl extends FetchWeatherRepository {
  final FetchWeatherRemoteSrc fetchWeatherRemoteSrc;

  FetchWeatherRepoImpl({required this.fetchWeatherRemoteSrc});

  @override
  Future<Either<WeatherEntity, Failure>> fetchWeatherData({required double lat, required double lon, required int days}) async {
    try {
      final result = await fetchWeatherRemoteSrc.fetchWeatherData(
          lat: lat, lon: lon, days: days);

      return left(result);
    } on ServerException {
      return right(ServerFailure());
    } catch (err) {
      return right(GeneralFailure(message: 'Something went wrong!'));
    }
  }
}
