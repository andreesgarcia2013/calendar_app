import 'package:calendar_app/models/event_model.dart';
import 'package:calendar_app/providers/db_provider.dart';
import 'package:flutter/material.dart';

class EventsProvider  extends ChangeNotifier{
  List<EventModel> eventosByDay=[];
  List<EventModel> allEventos=[];
  EventsProvider(date){
    print('Recuperando eventos');
    this.getEventsByDay(date);
    this.getAllEvents();
  }

  getEventsByDay(String date) async {
    print('get eventos');
    final events=await DBProvider.db.getAllEventsbyDate(date);
    this.eventosByDay=[...?events];
    notifyListeners();
  }

  getAllEvents() async {
    print('getAll eventos');
    final events=await DBProvider.db.getAllEvents();
    allEventos=[...?events];
    notifyListeners();
  }

  nuevoEvent(String desc, String date) async {
    final tempEvent=new EventModel(desc: desc, date: date, completed: 0);
    final id=await DBProvider.db.nuevoEvent(tempEvent);
    tempEvent.id=id;
    eventosByDay.add(tempEvent);
    notifyListeners();
  }

}