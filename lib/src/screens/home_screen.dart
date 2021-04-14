import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/components/home/home_bottom_component.dart';
import 'package:stt_flutter/src/components/home/stateless_records_list.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/providers/records_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Record> _records = [];

  Future<void> _fetchRecords() async {
    _records.addAll(
        await Provider.of<RecordsProvider>(context, listen: true).records);
    for (Record r in _records) {
      log('$r');
    }
    log('-------------------------------------');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _records.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fetchRecords();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 5,
          child: StatelessRecordsList(),
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
