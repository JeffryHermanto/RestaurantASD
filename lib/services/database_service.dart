import 'dart:developer' as developer;

import 'package:dartz/dartz.dart';
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
    return userResults
        .map((user) => User.fromMap(user as Map<String, dynamic>))
        .toList();
  }

  Future<Either<Exception, Unit>> addUser(User newUser) async {
    try {
      final users = await getUsers();

      final searchedUser =
          users.where((element) => element.email == newUser.email).toList();

      if (searchedUser.isNotEmpty) {
        throw Exception('User already exist.');
      } else {
        await _database.insert(usersTableName, newUser.toMap());
        return right(unit);
      }
    } on Exception catch (e) {
      developer.log(e.toString());
      return left(e);
    }
  }
}
