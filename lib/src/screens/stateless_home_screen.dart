import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/components/home/home_bottom_component.dart';
import 'package:stt_flutter/src/components/home/records_list.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/providers/records_provider.dart';

class StatelessHomeScreen extends StatelessWidget {
  final List<Record> _records = [];
  _fetchRecords(BuildContext context) {
    _records.addAll(Provider.of<RecordsProvider>(context).records);
  }

  @override
  Widget build(BuildContext context) {
    _fetchRecords(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 5,
          child: RecordsList(
            records: _records,
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
