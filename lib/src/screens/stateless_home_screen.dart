import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/components/home/stateless_home_bottom_component.dart';
import 'package:stt_flutter/src/components/home/stateless_records_list.dart';
import 'package:stt_flutter/src/providers/records_provider.dart';

class StatelessHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: RecordsProvider(),
        ),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 5,
            child: StatelessRecordsList(),
          ),
          Expanded(
            child: StatelessHomeBottom(),
          ),
        ],
      ),
    );
  }
}
