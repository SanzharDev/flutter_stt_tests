import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/models/record.dart';
import 'package:stt_flutter/src/providers/record_card_provider.dart';
import 'package:stt_flutter/src/providers/records_provider.dart';

enum SelectedOption { editTitle, copyText, deleteRecord }

class StatelessRecordCardDropdown extends StatelessWidget {
  StatelessRecordCardDropdown({
    Record record,
  }) : this._record = record;
  final Record _record;

  _onItemSelected(SelectedOption option, BuildContext context) {
    switch (option) {
      case SelectedOption.editTitle:
        _editTitle(context);
        break;
      case SelectedOption.copyText:
        _copyText(context);
        break;
      case SelectedOption.deleteRecord:
        _deleteRecord(context);
        break;
    }
  }

  _editTitle(BuildContext context) {
    bool isEditingTitle =
        Provider.of<RecordCardProvider>(context, listen: false).isEditingTitle;
    Provider.of<RecordCardProvider>(context, listen: false)
        .changeEditingTitle(!isEditingTitle);
  }

  _copyText(BuildContext context) {
    log('copying text of record{$_record}');
  }

  _deleteRecord(BuildContext context) {
    Provider.of<RecordsProvider>(context, listen: false).removeRecord(_record);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      onSelected: (value) {
        _onItemSelected(value, context);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          value: SelectedOption.editTitle,
          child: ListTile(
            leading: Icon(
              Icons.edit_outlined,
              color: Colors.blue,
            ),
            title: Text('Edit'),
          ),
        ),
        const PopupMenuItem(
          value: SelectedOption.copyText,
          child: ListTile(
            leading: Icon(
              Icons.copy,
              color: Colors.blue,
            ),
            title: Text('Copy'),
          ),
        ),
        const PopupMenuItem(
          value: SelectedOption.deleteRecord,
          child: ListTile(
            leading: Icon(
              Icons.delete_outline,
              color: Colors.blue,
            ),
            title: Text('Delete'),
          ),
        ),
      ],
    );
  }
}
