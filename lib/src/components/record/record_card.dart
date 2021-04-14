import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/components/record/record_card_dropdown_menu.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/providers/records_provider.dart';
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
    widget.refreshList();
  }

  void _reverseIsEditingTitleState() {
    setState(() {
      _isEditingTitle = !_isEditingTitle;
    });
    log('changed state');
  }

  void removeRecord(BuildContext context) {
    Provider.of<RecordsProvider>(context, listen: true)
        .removeRecord(widget.record);
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
  void dispose() {
    super.dispose();
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: (!_isEditingTitle
                      ? Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Text(
                            _title,
                            style: kRecordTitleCardTextStyle,
                          ),
                        )
                      : TextField(
                          onChanged: (text) {
                            log('$text');
                          },
                          onSubmitted: (text) {
                            setState(() {
                              _title = text;
                              _isEditingTitle = false;
                              updateRecordTitle(_title);
                            });
                          },
                          decoration: InputDecoration(
                            labelText: _title,
                          ),
                        )),
                ),
                Expanded(
                  child: RecordCardDropdownMenu(
                    changeEditingState: _reverseIsEditingTitleState,
                    removeRecord: removeRecord,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Text('Other staff'),
            ),
          ),
        ],
      ),
    );
  }
}
