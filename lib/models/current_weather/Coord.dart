class Coord {
  Coord({
    required  this.lon,
    required   this.lat,});

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