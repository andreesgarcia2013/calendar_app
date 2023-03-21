import 'package:calendar_app/providers/days_provider.dart';
import 'package:calendar_app/utils/style_settings.dart';
import 'package:calendar_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final daysProvider=Provider.of<DaysProvider>(context);
    return  Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(daysProvider.daySelected, style:StyleSettings.h1,),
                SizedBox(height: 10,),
                Calendar(),
                SizedBox(height: 10,),
                TodoList()
              ],
            ),
          ),
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





