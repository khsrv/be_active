import 'dart:convert';

class ClockModel {
  int? id;
  String? time;
  String? name;

  ClockModel({this.id, this.time, this.name});

  ClockModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['time'] = time;
    data['name'] = name;
    return data;
  }

  String toStringd() {
    String data = '';
    var clock = ClockModel(id: id, time: time, name: name);
    data = json.encode(clock);
    return data;
  }

  ClockModel.fromString(String clockString) {
    Map<String, dynamic> valueMap = json.decode(clockString);
    ClockModel clockModel = ClockModel.fromJson(valueMap);
    id = clockModel.id;
    time = clockModel.time;
    name = clockModel.name;
  }

  String modelToString(ClockModel clockModel) {
    String clock = jsonEncode(clockModel);
    return clock;
  }
}
