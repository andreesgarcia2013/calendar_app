import 'package:calendar_app/providers/events_provider.dart';
import 'package:calendar_app/utils/style_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventosListProvider=Provider.of<EventsProvider>(context);
    final eventos=eventosListProvider.eventosByDay;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Eventos', style: StyleSettings.h1,),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: eventos.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => print('vista Evento $index'),
            child: ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text(
                eventos[index].desc,
                style: 
                colorText(eventos[index].date, eventos[index].completed)
                ),
            )
          )
        )
      ],
    );
  }

  TextStyle colorText(String date, int completed) {
    var textStyle;
    DateTime originalDate=DateTime.parse(date);
    if (completed==1) {
      textStyle = TextStyle(
        decoration: TextDecoration.lineThrough,
        color: Colors.grey
      );
    }else if(DateUtils.isSameDay(originalDate, DateTime.now())){
      textStyle = TextStyle(
        color: Colors.green,
      );
    }
    else{
      textStyle = TextStyle(
        color: Colors.red
      );
    }
    return textStyle;
  }
}