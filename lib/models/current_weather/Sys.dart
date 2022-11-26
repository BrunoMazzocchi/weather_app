class Sys {
  Sys({
    required   this.type,
    required    this.id,
    required    this.country,
    required    this.sunrise,
    required    this.sunset,});

  Sys.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
late  int type;
  late  int id;
  late  String country;
  late int sunrise;
  late  int sunset;

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