class Wind {
  Wind({
   required    this.speed,
    required   this.deg,});

  Wind.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
  }
  double? speed;
  int? deg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    return map;
  }

}