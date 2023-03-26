import 'package:calendar_app/models/event_model.dart';
import 'package:calendar_app/providers/days_provider.dart';
import 'package:calendar_app/providers/db_provider.dart';
import 'package:calendar_app/providers/events_provider.dart';
import 'package:calendar_app/screens/all_events_screen.dart';
import 'package:calendar_app/screens/stack_screen.dart';
import 'package:calendar_app/screens/test_scree.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final tempEvent=new EventModel(desc: "Tomar agua", date: "2023-03-25", completed: 0);
    // DBProvider.db.nuevoEvent(tempEvent);
    DBProvider.db.initDB();
    // DBProvider.db.updateEvent(EventModel(id:1,desc: "Tomar agua", date: "2023-04-26", completed: 0));
    // DBProvider.db.getAllEventsbyDate('2023-04-25').then((value) => print(value![0].desc));
    String today ="${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2,'0')}-${DateTime.now().day.toString().padLeft(2,'0')}";
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((_) => DaysProvider())),
        ChangeNotifierProvider(create: (_) => EventsProvider(today), lazy: false,)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home',
        routes: {
          '/home':(_) => TestScreen(),
          '/all':(_) => AllEventsScreen()
        },
        theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black
            )
          ),
          scaffoldBackgroundColor: Colors.white
        ),
      ),
    );
  }
}