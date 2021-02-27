import 'dart:developer' as developer;

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

import '../app/app.locator.dart';
import '../datamodels/user.dart';

const String DB_NAME = 'restaurant_database.sqlite';
const String usersTableName = 'users';

class DatabaseService {
  final _migrationService = locator<DatabaseMigrationService>();
  Database _database;

  Future initialise() async {
    _database = await openDatabase(DB_NAME, version: 1);

    await _migrationService.runMigration(
      _database,
      migrationFiles: [
        '1_create_schema.sql',
      ],
      verbose: true,
    );
  }

  Future<List<User>> getUsers() async {
    final List<Map> userResults = await _database.query(usersTableName);
    return userResults.map((user) => User.fromJson(user as String)).toList();
  }

  Future addUser(User user) async {
    try {
      await _database.insert(usersTableName, user.toMap());
    } catch (e) {
      developer.log('Could not insert the user: $e');
    }
  }
}
