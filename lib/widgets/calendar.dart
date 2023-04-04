import 'package:calendar_app/models/event_model.dart';
import 'package:calendar_app/providers/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../providers/days_provider.dart';

class Calendar extends StatefulWidget {
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late final ValueNotifier<List<EventModel>> _selectedEvents;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final eventosListProvider=Provider.of<EventsProvider>(context, listen: false);
    final eventosNow=eventosListProvider.eventosByDay;
    _selectedEvents = ValueNotifier(eventosNow);
  }
  @override
  Widget build(BuildContext context) {
    final eventosListProvider=Provider.of<EventsProvider>(context, listen: false);
    
    return TableCalendar(
      startingDayOfWeek: StartingDayOfWeek.monday,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        final daysProvider=Provider.of<DaysProvider>(context, listen: false);
        daysProvider.setDay=_focusedDay;
        eventosListProvider.getEventsByDay(daysProvider.daySelected);
        setState(() {
        });
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          // Call `setState()` when updating calendar format
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
    );
  }
}