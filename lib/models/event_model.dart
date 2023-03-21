// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

EventModel eventModelFromJson(String str) => EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
    EventModel({
        this.id,
        required this.desc,
        required this.date,
        required this.completed,
    });

    int? id;
    String desc;
    String date;
    int completed;

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        desc: json["desc"],
        date: json["date"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "desc": desc,
        "date": date,
        "completed": completed,
    };
}
