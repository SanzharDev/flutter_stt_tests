import 'package:flutter/widgets.dart';
import 'package:stt_flutter/src/components/reusable/record_card.dart';
import 'package:stt_flutter/src/models/record.dart';

class HomeRecordsList extends StatelessWidget {
  const HomeRecordsList({
    @required List<Record> records,
  }) : _records = records;

  final List<Record> _records;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: _records.length,
          itemBuilder: (BuildContext context, int index) {
            return RecordCard(
              record: _records[index],
            );
          }),
    );
  }
}
