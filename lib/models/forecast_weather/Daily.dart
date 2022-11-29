
import 'Temp.dart';
import 'Weather.dart';

class Daily {
  Daily({
   required   this.dt,

    required    this.temp,

    required   this.weather,
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
  int? dt;

  late  Temp? temp;


  late  List<Weather> weather;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;

    final temp = this.temp;
    if (temp != null) {
      map['temp'] = temp.toJson();
    }


    if (weather != null) {
      map['weather'] = weather.map((v) => v.toJson()).toList();
    }

    return map;
  }

}