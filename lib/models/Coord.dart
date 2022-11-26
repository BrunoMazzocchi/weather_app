class Coord {
  Coord({
    required   this.lat,
    required   this.lon,});

  Coord.fromJson(dynamic json) {
      lat = json['lat'];
       lon = json['lon'];
  }
 late double lat;
  late double lon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    return map;
  }

}