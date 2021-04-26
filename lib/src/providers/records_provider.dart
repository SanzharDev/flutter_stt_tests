import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/services/records_service.dart';

class RecordsProvider extends ChangeNotifier {
  final List<Record> _records = [];
  bool _isToBeUpdated = true;

  List<Record> get records {
    if (_isToBeUpdated) _getRecordsFromDB();
    return _records;
  }

  Future<void> _getRecordsFromDB() async {
    RecordService recordService = await RecordService.instance.recordService;
    List<Record> records = await recordService.records();
    _records.addAll(records);
    _isToBeUpdated = false;
    notifyListeners();
  }

  Future<void> addRecord(Record record) async {
    RecordService recordService = await RecordService.instance.recordService;
    int id = await recordService.saveRecord(record);
    Record recordWithId = Record.copyUpdatedId(record, id);
    _records.add(recordWithId);
    log('added record $recordWithId');
    notifyListeners();
  }

  Future<void> addRecordDefault() async {
    RecordService recordService = await RecordService.instance.recordService;
    Record record = Record.defaultObject();
    int id = await recordService.saveRecord(record);
    Record recordWithId = Record.copyUpdatedId(record, id);
    _records.add(recordWithId);
    notifyListeners();
  }

  Future<void> removeRecord(Record record) async {
    RecordService recordService = await RecordService.instance.recordService;
    recordService.deleteRecord(record);
    if (_records.isNotEmpty) {
      _records.remove(record);
    }
    notifyListeners();
  }

  Future<void> updateRecord(Record record) async {
    RecordService recordService = await RecordService.instance.recordService;
    await recordService.updateRecord(record);
    int index = _records
        .indexOf(_records.firstWhere((element) => element.id == record.id));
    _records.insert(index, record);
    _records.removeAt(index + 1);
    notifyListeners();
  }
}
