import 'package:calendar_app/providers/days_provider.dart';
import 'package:calendar_app/utils/style_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final daysProvider=Provider.of<DaysProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Agregar evento', style: StyleSettings.h1,),
                SizedBox(height: 20,),
                Text('Fecha del evento: ${daysProvider.daySelected}', style:  Theme.of(context).textTheme.titleLarge,),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () async{
                        TimeOfDay? newTime= await showTimePicker(
                          context: context, 
                          initialTime:TimeOfDay.now(),
                        );
                        if(newTime==null) return;
                        daysProvider.setInitialTime=newTime;
                      },
                      child: _cardTime( data: 'Hora inicio', daysProvider: daysProvider.initialTime,)
                    ),
                    GestureDetector(
                      onTap: () async{
                        TimeOfDay? newTime= await showTimePicker(
                          context: context, 
                          initialTime:TimeOfDay.now(),
                        );
                        if(newTime==null) return;
                        daysProvider.setFinalTime=newTime;
                      },
                      child: _cardTime( daysProvider: daysProvider.finalTime, data: 'Hora final',)
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: _styleField(),
                  
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    //add prefix icon
                    prefixIcon: Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
            
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
            
                    hintText: "Descripcion",
            
                    //make hint text
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w400,
                    ),
            
                    //create lable
                    labelText: 'Descripcion',
                    //lable style
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.check),
      ),
    );
  }

  TextStyle _styleField() {
    return TextStyle(
                fontWeight: FontWeight.w600,
              );
  }
}

class _cardTime extends StatelessWidget {
  const _cardTime({
    Key? key,
    required this.daysProvider, required this.data
  }) : super(key: key);

  final String daysProvider;
  final String data;

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(data, style:Theme.of(context).textTheme.titleLarge,),
            Text(daysProvider ,style:Theme.of(context).textTheme.titleLarge,)
          ],
        ),
      ),
    );
  }
}
