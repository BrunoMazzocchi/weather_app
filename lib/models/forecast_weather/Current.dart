import 'Weather.dart';

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

    if (weather != null) {
      map['weather'] = weather.map((v) => v.toJson()).toList();
    }

    return map;
  }
}
