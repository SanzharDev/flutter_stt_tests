import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/components/home/home_bottom_component.dart';
import 'package:stt_flutter/src/components/home/records_list.dart';
import 'package:stt_flutter/src/providers/records_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEST'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => RecordsProvider(),
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
      ),
    );
  }
}
