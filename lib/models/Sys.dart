class Sys {
  Sys({
    required  this.pod,});

  Sys.fromJson(dynamic json) {
    pod = json['pod'];
  }
  late  String pod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pod'] = pod;
    return map;
  }

}