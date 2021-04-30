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
    return _uploadsService;
  }

  Future<UploadsService> _initUploadsService() async {
    _database = await UploadedRecordsDatabase.instance.database;
    return new UploadsService._privateConstructor();
  }

  Future<int> save(UploadedRecord uploadedRecord) async {
    return await _database.insert(
        UploadedRecordsDatabase.table, uploadedRecord.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<UploadedRecord>> records() async {
    final List<Map<String, dynamic>> maps = await _database.query('uploads');
    return List.generate(maps.length, (i) {
      return UploadedRecord(
        id: maps[i]['id'],
        audioId: maps[i]['audio_id'],
        status: maps[i]['status'],
        text: maps[i]['text'],
        duration: maps[i]['duration'],
        path: maps[i]['path'],
      );
    });
  }

  Future<List<UploadedRecord>> recordsInProcess() async {
    final List<UploadedRecord> uploadedRecords = await records();
    final List<UploadedRecord> processingOrQueueRecords = uploadedRecords
        .where((element) =>
            element.status == 'Processing' || element.status == 'Queue')
        .toList();
    return processingOrQueueRecords;
  }

  Future<List<UploadedRecord>> recordsTranscribed() async {
    final List<UploadedRecord> uploadedRecords = await records();
    final List<UploadedRecord> transcribedRecords =
        uploadedRecords.where((element) => element.status == 'Done').toList();
    return transcribedRecords;
  }

  Future<void> updateByAudioId(
      String audioId, String text, String status) async {
    UploadedRecord record = await getByAudioId(audioId);
    UploadedRecord updatedTextRecord = UploadedRecord(
        id: record.id,
        audioId: audioId,
        status: status,
        text: text,
        duration: record.duration,
        path: record.path);
    await _database.update(
      '${UploadedRecordsDatabase.table}',
      updatedTextRecord.toMap(),
      where: "id = ?",
      whereArgs: [updatedTextRecord.id],
    );
  }

  Future<UploadedRecord> getByAudioId(String audioId) async {
    List<Map<String, dynamic>> result = await _database.query(
        '${UploadedRecordsDatabase.table}',
        where: "${UploadedRecordsDatabase.columnAudioId} == ?",
        whereArgs: [audioId]);
    return UploadedRecord(
      id: result[0]['id'],
      audioId: result[0]['audioId'],
      status: result[0]['status'],
      text: result[0]['text'],
      duration: result[0]['duration'],
      path: result[0]['path'],
    );
  }
}
