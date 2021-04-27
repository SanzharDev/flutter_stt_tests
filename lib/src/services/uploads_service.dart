import 'package:sqflite/sqflite.dart';
import 'package:stt_flutter/src/database/uploaded_records_database.dart';
import 'package:stt_flutter/src/models/uploaded_record.dart';

class UploadsService {
  static Database _database;

  UploadsService._privateConstructor();
  static final UploadsService instance = UploadsService._privateConstructor();

  static UploadsService _uploadsService;
  Future<UploadsService> get uploadsService async {
    if (_uploadsService == null) _uploadsService = await _initUploadsService();
  }

  Future<UploadsService> _initUploadsService() async {
    _database = await UploadedRecordsDatabase.instance.database;
    return new UploadsService._privateConstructor();
  }

  Future<int> saveUploadedRecord(UploadedRecord uploadedRecord) async {
    return await _database.insert(
        UploadedRecordsDatabase.table, uploadedRecord.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<UploadedRecord>> uploadedRecords() async {
    final List<Map<String, dynamic>> maps = await _database.query('uploads');
    return List.generate(maps.length, (i) {
      return UploadedRecord(
        id: maps[i]['id'],
        audioId: maps[i]['audioId'],
        status: maps[i]['status'],
        text: maps[i]['text'],
        duration: maps[i]['duration'],
        path: maps[i]['path'],
      );
    });
  }
}
