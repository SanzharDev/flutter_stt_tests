import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:stt_flutter/src/components/reusable/record_card.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/services/records_service.dart';

class HomeRecordsList extends StatefulWidget {
  @override
  _HomeRecordsListState createState() => _HomeRecordsListState();
}

class _HomeRecordsListState extends State<HomeRecordsList> {
  List<Record> _records;

  Future<void> _fetchRecords() async {
    RecordService recordService = await RecordService.instance.recordService;
    List<Record> records = await recordService.records();
    setState(() {
      _records = records;
    });
    for (Record r in _records) {
      log('$r');
    }
  }

  @override
  void initState() {
    _fetchRecords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: _records != null ? _records.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return RecordCard(
              record: _records[index],
              refreshList: _fetchRecords,
            );
          }),
    );
  }
}
