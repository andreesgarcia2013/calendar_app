import 'package:flutter/material.dart';

class DaysProvider extends ChangeNotifier{
  String _daySelected='Hoy';

  String _initialTime='00:00';
  String _finalTime='23:59';

  String get daySelected{
    return _daySelected;
  }
  set setDay(DateTime value){
    String today ="${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2,'0')}-${DateTime.now().day.toString().padLeft(2,'0')}";
    String dateSlug ="${value.year.toString()}-${value.month.toString().padLeft(2,'0')}-${value.day.toString().padLeft(2,'0')}";
    if (dateSlug==today) {
      _daySelected='Hoy';
    }
    else{
    _daySelected=dateSlug;
    }
    notifyListeners();
  }

  String get initialTime{
    return _initialTime;
  }

  String get finalTime{
    return _finalTime;
  }

  set setInitialTime(TimeOfDay time){
    String realTime='${time.hour}:${time.minute}';
    _initialTime=realTime;
    notifyListeners();
  }

  set setFinalTime(TimeOfDay time){
    String realTime='${time.hour}:${time.minute}';
    _finalTime=realTime;
    notifyListeners();
  }


}