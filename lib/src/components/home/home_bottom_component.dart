import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/services/records_service.dart';

class HomeBottom extends StatelessWidget {
  final Function refreshList;

  HomeBottom({this.refreshList});

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
    refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
            constraints: BoxConstraints.tightFor(width: 76.0, height: 76.0),
          ),
        ),
      ],
    );
  }
}
