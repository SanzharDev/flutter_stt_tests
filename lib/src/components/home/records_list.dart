import 'package:flutter/material.dart';
import 'package:stt_flutter/src/components/record/record_card.dart';
import 'package:stt_flutter/src/models/record.dart';

class RecordsList extends StatelessWidget {
  RecordsList({List<Record> records}) : this._records = records;
  final List<Record> _records;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: _records != null ? _records.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return RecordCard(
              record: _records[index],
            );
          }),
    );
  }
}
