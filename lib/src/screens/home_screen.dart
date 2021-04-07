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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _records = null;
    super.dispose();
  }

  Future<void> _addRecord() async {
    RecordService recordService = await RecordService.instance.recordService;
    DateTime now = DateTime.now();
    recordService.saveRecord(Record(
      path: 'No path',
      title: 'Created at $now',
      text: 'Text for $now',
      creationDate: 'now',
      duration: 1,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 5,
          child: HomeRecordsList(),
        ),
        Expanded(
          child: HomeBottom(
            onPressed: () {
              _addRecord();
            },
          ),
        ),
      ],
    );
  }
}
