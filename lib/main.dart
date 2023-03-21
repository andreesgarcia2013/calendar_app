import 'package:calendar_app/models/event_model.dart';
import 'package:calendar_app/providers/days_provider.dart';
import 'package:calendar_app/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final tempEvent=new EventModel(desc: "Preparar cafe", date: "2023-04-26", completed: false);
    DBProvider.db.initDB();
    // DBProvider.db.updateEvent(EventModel(id:1,desc: "Tomar agua", date: "2023-04-26", completed: 0));
    // DBProvider.db.getAllEventsbyDate('2023-04-26').then((value) => print(value![0].desc));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((_) => DaysProvider()), lazy: false,)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home',
        routes: {
          '/home':(_) => HomeScreen(),
        },
      ),
    );
  }
}