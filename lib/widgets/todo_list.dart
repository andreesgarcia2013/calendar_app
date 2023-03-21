import 'package:calendar_app/utils/style_settings.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Eventos', style: StyleSettings.h1,),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => print('vista Evento $index'),
              child: _ItemEvent())
          )
        ],
      ),
    );
  }
}

class _ItemEvent extends StatelessWidget {
  const _ItemEvent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.calendar_month),
      title: Text('Hola mundo'),
    );
  }
}