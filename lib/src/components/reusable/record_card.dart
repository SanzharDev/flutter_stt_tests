import 'dart:developer';

import 'package:flutter/material.dart';
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
      height: 100.0,
      margin: EdgeInsets.all(15.0),
      decoration: kRecordCardBoxDecoration,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(record.text),
                ),
                Expanded(
                  child: GestureDetector(
                    child: RawMaterialButton(
                      onPressed: () => log('pressed edit'),
                      child: Icon(
                        Icons.edit,
                        size: 28.0,
                      ),
                      shape: CircleBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Text('Other functional staff'),
            ),
          ),
        ],
      ),
    );
  }
}
