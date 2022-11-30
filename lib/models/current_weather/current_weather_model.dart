class CurrentWeather {
  CurrentWeather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  CurrentWeather.fromJson(dynamic json) {
    coord = (json['coord'] != null ? Coord.fromJson(json['coord']) : null)!;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = (json['main'] != null ? Main.fromJson(json['main']) : null)!;
    wind = (json['wind'] != null ? Wind.fromJson(json['wind']) : null)!;
    clouds = (json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null)!;
    dt = json['dt'];
    sys = (json['sys'] != null ? Sys.fromJson(json['sys']) : null)!;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  CurrentWeather.withError(String errorMessage) {
    error = errorMessage;
  }

  late Coord coord;
  late List<Weather>? weather;
  late String base;
  late Main? main;
  late Wind? wind;

  late Clouds? clouds;
  late int dt;
  late Sys sys;

  late num? timezone;
  late num? id;
  late String name;
  late num? cod;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coord'] = coord.toJson();
    map['weather'] = weather?.map((v) => v.toJson()).toList();
    map['base'] = base;
    map['main'] = main?.toJson();
    map['wind'] = wind?.toJson();
    map['clouds'] = clouds?.toJson();
    map['dt'] = dt;
    map['sys'] = sys.toJson();
    map['timezone'] = timezone;
    map['id'] = id;
    map['name'] = name;
    map['cod'] = cod;
    return map;
  }
}

class Clouds {
  Clouds({
    required this.all,
  });

  Clouds.fromJson(dynamic json) {
    all = json['all'];
  }

  late num? all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  Coord.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  late double? lon;
  late double? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  late num? temp;
  late num? feelsLike;
  late num? tempMin;
  late num? tempMax;
  late num? pressure;
  late num? humidity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    return map;
  }
}

class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  Sys.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  late num? type;
  late num? id;
  late String country;
  late int sunrise;
  late int sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['country'] = country;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  late int id;
  late String main;
  late String description;
  late String icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
  });

  Wind.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  late num? speed;
  late num? deg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    return map;
  }
}
