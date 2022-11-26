class Rain {
  Rain({
    required  this.h,});

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