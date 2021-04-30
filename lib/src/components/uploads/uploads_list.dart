import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/models/uploaded_record.dart';
import 'package:stt_flutter/src/providers/uploads_provider.dart';

class UploadsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UploadProvider>(builder: (context, uploadProvider, _) {
      final List<UploadedRecord> uploadedRecords =
          uploadProvider.transcribedRecords;
      return Container(
        child: ListView.builder(
          itemCount: uploadedRecords.length,
          itemBuilder: (BuildContext context, int index) {
            log('Uploaded record: ${uploadedRecords[index]}');
            return Text('audio id : ${uploadedRecords[index].audioId}');
          },
        ),
      );
    });
  }
}
