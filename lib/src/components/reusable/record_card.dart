import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/services/records_service.dart';
import 'package:stt_flutter/src/utilities/constants.dart';

class RecordCard extends StatefulWidget {
  final Record record;
  final Function refreshList;
  RecordCard({
    this.record,
    this.refreshList,
  });
  @override
  _RecordCardState createState() => _RecordCardState();
}

class _RecordCardState extends State<RecordCard> {
  bool _isEditingTitle = false;
  String _title;

  Future<void> updateRecordTitle(String title) async {
    RecordService recordService = await RecordService.instance.recordService;
    Record updatedTitleRecord = widget.record.titleUpdatedClone(title);
    log('Updated record: ${updatedTitleRecord.toMap()}');
    await recordService.updateRecord(updatedTitleRecord);
  }

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
                              updateRecordTitle(_title);
                              widget.refreshList;
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
