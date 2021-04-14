import 'package:flutter/material.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/services/records_service.dart';

class RecordsProvider extends ChangeNotifier {
  final List<Record> _records = [];

  List<Record> get records {
    if (_records.isEmpty) _getRecordsFromDB();
    return _records;
  }

  Future<void> _getRecordsFromDB() async {
    RecordService recordService = await RecordService.instance.recordService;
    List<Record> records = await recordService.records();
    _records.addAll(records);
    notifyListeners();
  }

  Future<void> addRecord(Record record) async {
    RecordService recordService = await RecordService.instance.recordService;
    recordService.saveRecord(record);
    _records.add(record);
    notifyListeners();
  }

  Future<void> removeRecord(Record record) async {
    RecordService recordService = await RecordService.instance.recordService;
    recordService.deleteRecord(record);
    // if it won't work, then try to override == in Record class
    _records.remove(record);
    notifyListeners();
  }

  Future<void> updateRecordTitle(Record record) async {
    RecordService recordService = await RecordService.instance.recordService;
    await recordService.updateRecord(record);
    notifyListeners();
  }
}
