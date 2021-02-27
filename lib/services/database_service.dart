import 'package:sqflite/sqflite.dart';

const String DB_NAME = 'restaurant_database.sqlite';

class DatabaseService {
  // ignore: unused_field
  Database _database;

  Future initialise() async {
    _database = await openDatabase(DB_NAME, version: 1);
  }
}
