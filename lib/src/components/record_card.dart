import 'package:flutter/widgets.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/utilities/constants.dart';

class RecordCard extends StatelessWidget {
  final Record record;
  RecordCard({
    this.record,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: kRecordCardBoxDecoration,
      child: Text(
        '${record.title}',
      ),
    );
  }
}
