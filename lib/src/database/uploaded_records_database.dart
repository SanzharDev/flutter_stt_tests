import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class UploadedRecordsDatabase {
  static final _databaseName = 'UploadedAudios.db';
  static final _databaseVersion = 1;

  static final table = 'uploads';

  static final columnId = 'id';
  static final columnAudioId = 'audio_id';
  static final columnStatus = 'status';
  static final columnText = 'text';
  static final columnDuration = 'duration';
  static final columnPath = 'path';

  UploadedRecordsDatabase._privateConstructor();
  static final UploadedRecordsDatabase instance =
      UploadedRecordsDatabase._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database;
  }

  Future<Database> _initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId integer primary key, 
            $columnAudioId text not null,
            $columnStatus text not null,
            $columnText text not null,
            $columnDuration integer not null,
            $columnPath text not null
          )
       ''');
  }
}
