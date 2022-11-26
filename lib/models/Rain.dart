class Rain {
  Rain({
   required   this.h,});

  Rain.fromJson(dynamic json) {
    h = json['3h'];
  }
  double? h;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['3h'] = h;
    return map;
  }

}