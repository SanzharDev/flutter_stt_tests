import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/utilities/constants.dart';

class RecordCard extends StatefulWidget {
  final Record record;
  RecordCard({
    this.record,
  });
  @override
  _RecordCardState createState() => _RecordCardState();
}

class _RecordCardState extends State<RecordCard> {
  bool _isEditingTitle = false;
  String _title;

  @override
  void initState() {
    setState(() {
      _isEditingTitle = false;
      _title = widget.record.title;
    });
    super.initState();
  }

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
                  child: (!_isEditingTitle
                      ? Text(_title)
                      : TextField(
                          onChanged: (text) {
                            log('$text');
                          },
                          onSubmitted: (text) {
                            setState(() {
                              _title = text;
                              _isEditingTitle = false;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: _title,
                          ),
                        )),
                ),
                Expanded(
                  child: GestureDetector(
                    child: RawMaterialButton(
                      onPressed: () {
                        setState(() {
                          _isEditingTitle = !_isEditingTitle;
                        });
                      },
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
