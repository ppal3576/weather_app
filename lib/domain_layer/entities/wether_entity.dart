import 'package:equatable/equatable.dart';

class WeatherEntityCityCoord extends Equatable {
  double? lat;
  double? lon;

  WeatherEntityCityCoord({
    this.lat,
    this.lon,
  });
  WeatherEntityCityCoord.fromJson(Map<String, dynamic> json) {
    lat = json['lat']?.toDouble();
    lon = json['lon']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }

  @override
  List<Object?> get props => [];
}

class WeatherEntityCity extends Equatable {
  int? id;
  String? name;
  WeatherEntityCityCoord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  WeatherEntityCity({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });
  WeatherEntityCity.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    coord = (json['coord'] != null)
        ? WeatherEntityCityCoord.fromJson(json['coord'])
        : null;
    country = json['country']?.toString();
    population = json['population']?.toInt();
    timezone = json['timezone']?.toInt();
    sunrise = json['sunrise']?.toInt();
    sunset = json['sunset']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }

  @override
  List<Object?> get props => [];
}

class WeatherEntityListWind extends Equatable {
  double? speed;
  int? deg;
  double? gust;

  WeatherEntityListWind({
    this.speed,
    this.deg,
    this.gust,
  });
  WeatherEntityListWind.fromJson(Map<String, dynamic> json) {
    speed = json['speed']?.toDouble();
    deg = json['deg']?.toInt();
    gust = json['gust']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }

  @override
  List<Object?> get props => [];
}

class WeatherEntityListClouds extends Equatable {
  int? all;

  WeatherEntityListClouds({
    this.all,
  });
  WeatherEntityListClouds.fromJson(Map<String, dynamic> json) {
    all = json['all']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }

  @override
  List<Object?> get props => [];
}

class WeatherEntityListWeather extends Equatable {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherEntityListWeather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
  WeatherEntityListWeather.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    main = json['main']?.toString();
    description = json['description']?.toString();
    icon = json['icon']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }

  @override
  List<Object?> get props => [];
}

class WeatherEntityListMain extends Equatable {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  WeatherEntityListMain({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });
  WeatherEntityListMain.fromJson(Map<String, dynamic> json) {
    temp = json['temp']?.toDouble();
    feelsLike = json['feels_like']?.toDouble();
    tempMin = json['temp_min']?.toDouble();
    tempMax = json['temp_max']?.toDouble();
    pressure = json['pressure']?.toInt();
    seaLevel = json['sea_level']?.toInt();
    grndLevel = json['grnd_level']?.toInt();
    humidity = json['humidity']?.toInt();
    tempKf = json['temp_kf']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    data['humidity'] = humidity;
    data['temp_kf'] = tempKf;
    return data;
  }

  @override
  List<Object?> get props => [];
}

class WeatherEntityListEntity extends Equatable {
  final List<WeatherEntityList>? weatherEntityList;

  const WeatherEntityListEntity({required this.weatherEntityList});

  @override
  List<Object?> get props => [weatherEntityList];
}


class WeatherEntityList extends Equatable {
  int? dt;
  WeatherEntityListMain? main;
  List<WeatherEntityListWeather?>? weather;
  WeatherEntityListClouds? clouds;
  WeatherEntityListWind? wind;

  WeatherEntityList({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
  });
  WeatherEntityList.fromJson(Map<String, dynamic> json) {
    dt = json['dt']?.toInt();
    main = (json['main'] != null)
        ? WeatherEntityListMain.fromJson(json['main'])
        : null;
    if (json['weather'] != null) {
      final v = json['weather'];
      final arr0 = <WeatherEntityListWeather>[];
      v.forEach((v) {
        arr0.add(WeatherEntityListWeather.fromJson(v));
      });
      weather = arr0;
    }
    clouds = (json['clouds'] != null)
        ? WeatherEntityListClouds.fromJson(json['clouds'])
        : null;
    wind = (json['wind'] != null)
        ? WeatherEntityListWind.fromJson(json['wind'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['dt'] = dt;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (weather != null) {
      final v = weather;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['weather'] = arr0;
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [];
}

class WeatherEntity extends Equatable {
  int? cnt;
  WeatherEntityListEntity? list;
  WeatherEntityCity? city;

  WeatherEntity({
    this.cnt,
    this.list,
    this.city,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['cnt'] = cnt;
    // if (list != null) {
    //   final v = list;
    //   final arr0 = [];
    //   v!.forEach((v) {
    //     arr0.add(v!.toJson());
    //   });
    //    = arr0;
    // }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [];
}
