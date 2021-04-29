import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/components/record/record_card.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/providers/record_cards_provider.dart';
import 'package:stt_flutter/src/providers/records_provider.dart';

class StatelessRecordsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecordsProvider>(
      builder: (context, recordsProvider, _) {
        List<Record> _records = recordsProvider.records;
        return Container(
          child: ListView.builder(
              itemCount: _records != null ? _records.length : 0,
              itemBuilder: (BuildContext context, int index) {
                return ChangeNotifierProvider(
                  create: (context) => RecordCardProvider(),
                  child: StatelessRecordCard(
                    record: _records[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
