import 'package:calendar_app/providers/days_provider.dart';
import 'package:calendar_app/providers/events_provider.dart';
import 'package:calendar_app/utils/style_settings.dart';
import 'package:calendar_app/widgets/add_event.dart';
import 'package:calendar_app/widgets/calendar.dart';
import 'package:calendar_app/widgets/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatelessWidget {
   
  const TestScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final daysProvider=Provider.of<DaysProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomScrollView(
          slivers: [
            _CustomAppBar(daysProvider: daysProvider, size: size),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    constraints: BoxConstraints(
                      minHeight: size.height
                    ),
                    child: TodoList()
                  )
                ]
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBarModalBottomSheet(
            expand: false,
            // topRadius: Radius.circular(15),
            context: context,
            builder: (context) => AddEvent());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
    required this.daysProvider,
    required this.size,
  }) : super(key: key);

  final DaysProvider daysProvider;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated:false,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/all');
        },
        icon: Icon(Icons.calendar_month, size: 28,color: Colors.black,)),
      title: Text(daysProvider.daySelected, style:StyleSettings.h1,),
      expandedHeight: size.height*.53,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: size.height*.05,
              ),
              Calendar(),
            ],
          )
        ),
      ),
    );
  }
}