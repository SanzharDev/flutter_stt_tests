import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/components/record/record_card_dropdown_menu.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/providers/record_card_provider.dart';
import 'package:stt_flutter/src/providers/records_provider.dart';
import 'package:stt_flutter/src/utilities/constants.dart';

class StatelessRecordCard extends StatelessWidget {
  StatelessRecordCard({
    Record record,
  }) : this._record = record;
  final Record _record;

  _updateTitle(BuildContext context, String title) {
    Record record = _record.titleUpdatedClone(title);
    Provider.of<RecordsProvider>(context, listen: false).updateRecord(record);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecordCardProvider>(
      builder: (context, recordCardProvider, child) {
        recordCardProvider.title = _record.title;
        return Container(
          height: 175.0,
          margin: EdgeInsets.all(15.0),
          decoration: kRecordCardBoxDecoration,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 4,
                      child: (!recordCardProvider.isEditingTitle
                          ? Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Text(
                                recordCardProvider.title,
                                style: kRecordTitleCardTextStyle,
                              ),
                            )
                          : TextField(
                              onSubmitted: (text) {
                                _updateTitle(context, text);
                                recordCardProvider.changeEditingTitle(false);
                              },
                              decoration: InputDecoration(
                                labelText: recordCardProvider.title,
                              ),
                            )),
                    ),
                    Expanded(
                      child: StatelessRecordCardDropdown(
                        record: _record,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Text('Other staff'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
