class Main {
  Main({
    required this.temp,
    required this.tempMax,
    required this.pressure,
  });

  Main.fromJson(dynamic json) {
    temp = json['temp'];

    tempMax = json['temp_max'];
    pressure = json['pressure'];
  }

  double? temp;

  double? tempMax;

  int? pressure;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;

    map['temp_max'] = tempMax;
    map['pressure'] = pressure;

    return map;
  }
}
