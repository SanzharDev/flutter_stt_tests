import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInitializer {
  static final _databaseName = 'SttRecords.db';
  static final _databaseVersion = 1;

  static final table = 'records';

  static final columnId = 'id';
  static final columnPath = 'path';
  static final columnTitle = 'title';
  static final columnText = 'text';
  static final columnCreationDate = 'creation_date';
  static final columnDuration = 'duration';

  // make this a singleton class
  DatabaseInitializer._privateConstructor();
  static final DatabaseInitializer instance =
      DatabaseInitializer._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database;
  }

  Future<Database> _initDatabase() async {
    // Avoid errors caused by flutter upgrade
    WidgetsFlutterBinding.ensureInitialized();
    // open database and store the reference.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId integer primary key, 
            $columnPath text not null,
            $columnTitle text not null,
            $columnText text not null, 
            $columnCreationDate text not null,
            $columnDuration integer not null
          )
       ''');
  }
}
