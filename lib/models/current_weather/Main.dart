class Main {
  Main({
   required   this.temp,
    required this.feelsLike,
    required  this.tempMin,
    required  this.tempMax,
    required  this.pressure,
    required  this.humidity,});

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
  late double temp;
  late  double feelsLike;
  late  double tempMin;
  late  double tempMax;
  late int pressure;
  late int humidity;

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