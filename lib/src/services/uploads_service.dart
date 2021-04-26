import 'package:sqflite/sqflite.dart';
import 'package:stt_flutter/src/database/uploaded_audios_database.dart';

class UploadsService {
  static Database _database;

  UploadsService._privateConstructor();
  static final UploadsService instance = UploadsService._privateConstructor();

  static UploadsService _uploadsService;
  Future<UploadsService> get uploadsService async {
    if (_uploadsService == null) _uploadsService = await _initUploadsService();
  }

  Future<UploadsService> _initUploadsService() async {
    _database = await UploadedAudiosDatabase.instance.database;
    return new UploadsService._privateConstructor();
  }
}
