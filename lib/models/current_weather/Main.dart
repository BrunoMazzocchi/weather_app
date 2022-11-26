class Main {
  Main({

   required   this.temp,
    required this.feelsLike,
    required  this.tempMin,
    required  this.tempMax,
    required  this.pressure,
    required  this.humidity,

  });

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  late num temp;
  late  num feelsLike;
  late  num tempMin;
  late  num tempMax;
  late num pressure;
  late num humidity;

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