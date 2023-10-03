import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation_layer/presentation_layer.dart';

import 'di.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}





class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => di.sl<FetchWeatherProvider>(),
      child: MaterialApp(
        title: 'Weather Forecast App',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: Home(),
      ),
    );
  }
}

