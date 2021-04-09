import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecordCardDropdownMenu extends StatelessWidget {
  final Function _changeEditingState;
  final Function _deleteRecord;

  RecordCardDropdownMenu({
    Function changeEditingState,
    Function deleteRecord,
  })  : _changeEditingState = changeEditingState,
        _deleteRecord = deleteRecord;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      onCanceled: () => log('canceled'),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          child: ListTile(
            onTap: _changeEditingState,
            leading: RawMaterialButton(
              onPressed: () => log('Record title edit pressed'),
              child: Icon(
                Icons.edit,
                // size: 28.0,
                color: Colors.blue,
              ),
              shape: CircleBorder(),
            ),
            title: Text('Edit'),
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            onTap: () => log('copy'),
            leading: RawMaterialButton(
              onPressed: () => log('Record text copy pressed'),
              child: Icon(
                Icons.copy,
                // size: 28.0,
                color: Colors.blue,
              ),
              shape: CircleBorder(),
            ),
            title: Text('Copy text'),
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            onTap: _deleteRecord,
            leading: RawMaterialButton(
              onPressed: () => log('Record delete pressed'),
              child: Icon(
                Icons.delete,
                // size: 28.0,
                color: Colors.blue,
              ),
              shape: CircleBorder(),
            ),
            title: Text('Delete'),
          ),
        )
      ],
    );
  }
}
