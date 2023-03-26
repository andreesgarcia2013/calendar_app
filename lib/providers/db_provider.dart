import 'dart:io';

import 'package:calendar_app/models/event_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if ( _database != null ) return _database;

    _database = await initDB();

    return _database;

  }

  Future<Database> initDB() async{

    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'EventsDB.db' );
    print( path );

    // Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) { },
      onCreate: ( Database db, int version ) async {

        await db.execute('''
          CREATE TABLE Events(
            id INTEGER PRIMARY KEY,
            desc TEXT,
            date TEXT,
            completed BOOL
          )
        ''');
      }
    );
  }

  Future<int> nuevoEvent(EventModel nuevoEvent) async {
    final db=await database;
    final res= await db!.insert('Events', nuevoEvent.toJson());

    return res;
  }

  Future<EventModel?> getEventbyDate(String date) async{
    final db=await database;
    final res=await db!.query('Events', where: 'date=?', whereArgs: [date]);
    return res.isNotEmpty
    ? EventModel.fromJson(res.first)
    : null;
  }

   Future<List<EventModel>?> getAllEventsbyDate(String date) async{
    final db=await database;
    final res=await db!.query('Events', where: 'date=?', whereArgs: [date]);
    return res.isNotEmpty
    ? res.map((e) => EventModel.fromJson(e)).toList()
    : null;
   }

   Future<List<EventModel>?> getAllEvents() async{
    final db=await database;
    final res=await db!.query('Events');
    return res.isNotEmpty
    ? res.map((e) => EventModel.fromJson(e)).toList()
    : null;
   }

   Future <int> updateEvent(EventModel nuevoEvent) async{
    final db=await database;
    final res=await db!.update('Events', nuevoEvent.toJson(), where: 'id=?', whereArgs: [nuevoEvent.id]);
    return res;
   }

   Future<int> deleteEvent(int id)async{
    final db=await database;
    final res=await db!.delete('Events', where: 'id=?', whereArgs: [id]);
    return res;
   }

}