

import 'package:get_it/get_it.dart';
import 'package:weather_app/data_layer/data_layer.dart';
import 'package:weather_app/domain_layer/domain_layer.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/presentation_layer/presentation_layer.dart';
GetIt sl = GetIt.instance;

Future<void> init() async {
  /// use-case
  sl.registerFactory(() => FetchWeatherUseCase(fetchWeatherRepository: sl()));

  ///repository
  sl.registerFactory<FetchWeatherRepository>(() => FetchWeatherRepoImpl(fetchWeatherRemoteSrc: sl()));
  /// provider / bloc
  sl.registerFactory(() => FetchWeatherProvider(fetchWeatherUseCase: sl()));
  /// others
  sl.registerFactory(() => FetchWeatherRemoteSrc(client: sl()));
  sl.registerFactory(() => http.Client());
}
