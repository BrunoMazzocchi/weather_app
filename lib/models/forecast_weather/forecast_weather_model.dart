class ForecastWeather {
  late double lat;
  late double lon;
  late String timezone;
  late num timezoneOffset;
  late Current current;
  late List<Daily> daily;

  ForecastWeather({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.daily,
  });

  ForecastWeather.fromJson(dynamic json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current =
        (json['current'] != null ? Current.fromJson(json['current']) : null)!;
    if (json['daily'] != null) {
      daily = [];
      json['daily'].forEach((v) {
        daily.add(Daily.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    map['timezone'] = timezone;
    map['timezone_offset'] = timezoneOffset;
    map['current'] = current.toJson();
    map['daily'] = daily.map((v) => v.toJson()).toList();
    return map;
  }
}

class Current {
  Current({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.weather,
  });

  Current.fromJson(dynamic json) {
    dt = json['dt'];

    temp = json['temp'];
    feelsLike = json['feels_like'];

    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
  }

  late int dt;
  late num temp;
  late num feelsLike;

  late List<Weather> weather;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;

    map['temp'] = temp;
    map['feels_like'] = feelsLike;

    map['weather'] = weather.map((v) => v.toJson()).toList();

    return map;
  }
}

class Daily {
  Daily({
    required this.dt,
    required this.temp,
    required this.weather,
  });

  Daily.fromJson(dynamic json) {
    dt = json['dt'];

    temp = (json['temp'] != null ? Temp.fromJson(json['temp']) : null)!;

    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
  }

  late int dt;

  late Temp? temp;

  late List<Weather> weather;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;

    final temp = this.temp;
    if (temp != null) {
      map['temp'] = temp.toJson();
    }

    map['weather'] = weather.map((v) => v.toJson()).toList();

    return map;
  }
}

class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  FeelsLike.fromJson(dynamic json) {
    day = json['day'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  late double day;
  late double night;
  late double eve;
  late double morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['night'] = night;
    map['eve'] = eve;
    map['morn'] = morn;
    return map;
  }
}

class Rain {
  Rain({
    required this.h,
  });

  Rain.fromJson(dynamic json) {
    h = json['1h'];
  }

  late double h;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['1h'] = h;
    return map;
  }
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  Temp.fromJson(dynamic json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  late num day;
  late num min;
  late num max;
  late num night;
  late num eve;
  late num morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['min'] = min;
    map['max'] = max;
    map['night'] = night;
    map['eve'] = eve;
    map['morn'] = morn;
    return map;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
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
