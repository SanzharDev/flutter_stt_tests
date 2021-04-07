import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stt_flutter/src/components/record_card.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/services/records_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Record> _records = List.empty();

  @override
  void initState() {
    _fetchRecords();
    super.initState();
  }

  @override
  void dispose() {
    _records = null;
    super.dispose();
  }

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

  Future<void> _addRecord() async {
    RecordService recordService = await RecordService.instance.recordService;
    DateTime now = DateTime.now();
    Record tempRecord = Record(
      path: 'No path',
      title: 'Created at $now',
      text: 'Text for $now',
      creationDate: 'now',
      duration: 1,
    );
    log('Adding record ${tempRecord.title}');
    recordService.saveRecord(tempRecord);
    _fetchRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            child: ListView.builder(
                itemCount: _records.length,
                itemBuilder: (BuildContext context, int index) {
                  return RecordCard(
                    record: _records[index],
                  );
                }),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: RawMaterialButton(
                  onPressed: _addRecord,
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 48.0,
                  ),
                  fillColor: Colors.teal,
                  constraints:
                      BoxConstraints.tightFor(width: 76.0, height: 76.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
