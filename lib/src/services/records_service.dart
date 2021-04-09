import 'package:sqflite/sqflite.dart';
import 'package:stt_flutter/src/database/database_initializer.dart';
import 'package:stt_flutter/src/models/record.dart';

class RecordService {
  static Database _database;

  //make this class singleton
  RecordService._privateConstructor();
  static final RecordService instance = RecordService._privateConstructor();

  static RecordService _recordService;
  Future<RecordService> get recordService async {
    if (_recordService == null) _recordService = await _initRecordService();
    return _recordService;
  }

  Future<RecordService> _initRecordService() async {
    _database = await DatabaseInitializer.instance.database;
    return new RecordService._privateConstructor();
  }

  Future<int> saveRecord(Record record) async {
    // if the same data is inserted to table, then ConflictAlgorithm.replace,
    // allows to replace old data with new one coming.
    return await _database.insert(DatabaseInitializer.table, record.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Record>> records() async {
    final List<Map<String, dynamic>> maps = await _database.query('records');
    return List.generate(maps.length, (i) {
      return Record(
        id: maps[i]['id'],
        path: maps[i]['path'],
        title: maps[i]['title'],
        text: maps[i]['text'],
        creationDate: maps[i]['creation_date'],
        duration: maps[i]['duration'],
      );
    });
  }

  Future<void> updateRecord(Record record) async {
    await _database.update(
      'records',
      record.toMap(),
      where: "id = ?",
      whereArgs: [record.id],
    );
  }

  Future<void> deleteRecord(Record record) async {
    await _database.delete(
      'records',
      where: "id = ?",
      whereArgs: [record.id],
    );
  }
}
