import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stt_flutter/src/components/home/home_bottom_component.dart';
import 'package:stt_flutter/src/components/home/home_records_list_component.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/services/records_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Record> _records = List.empty();

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
  void dispose() {
    _records = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 5,
          child: HomeRecordsList(
            records: _records,
            refreshList: _fetchRecords,
          ),
        ),
        Expanded(
          child: HomeBottom(
            refreshList: _fetchRecords,
          ),
        ),
      ],
    );
  }
}
