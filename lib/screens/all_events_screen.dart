import 'package:calendar_app/providers/events_provider.dart';
import 'package:calendar_app/utils/style_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllEventsScreen extends StatelessWidget {
   
  AllEventsScreen({Key? key}) : super(key: key);

  @override
  bool light = false;

  @override
  Widget build(BuildContext context) {
    final eventosListProvider=Provider.of<EventsProvider>(context, listen: false);
    final eventos=eventosListProvider.allEventos;
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos los eventos', style:StyleSettings.h1,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: eventos.length,
          itemBuilder: (context, index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(eventos[index].date, style:StyleSettings.h1,),
                    Text(eventos[index].desc, style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
                  ],
                ),
              ),
              IconButton(onPressed: null, icon: Icon(Icons.arrow_forward_ios_rounded))
            ],
          )),
      )
    );
  }
}