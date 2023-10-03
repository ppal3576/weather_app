import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation_layer/presentation_layer.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Consumer(builder: (context, value, child) {
        final weatherProvider = Provider.of<FetchWeatherProvider>(context);

        return Scaffold(body: buildResult(weatherProvider),);
      },),
    );
  }

  Widget buildResult(FetchWeatherProvider weatherProvider) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (weatherProvider.weather == null)
            const Text('Enter a location and press Get Weather'),
          if (weatherProvider.weather != null) ...[
            Text('Location: ${weatherProvider.weather!.fold(
                  (weather) => '${weather.cnt}',
                  (failure) => "failure.message : 400",
            )}'),
            Text('Temperature: ${weatherProvider.weather!.fold(
                  (weather) => '${weather.city}',
                  (failure) => "failure.message : 400",
            )}°C'),
          ],
          ElevatedButton(
            onPressed: () {
              weatherProvider.fetchWeatherData(days: 5,lat: 44.34, lon: 10.99); // Replace with user input
            },
            child: Text('Get Weather'),
          ),
        ],
      ),
    );
  }
}
