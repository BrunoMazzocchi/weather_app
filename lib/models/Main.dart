class Main {
  Main({
   required   this.temp,
});

  Main.fromJson(dynamic json) {
    temp = json['temp'];

  }
 late num temp;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;

    return map;
  }

}