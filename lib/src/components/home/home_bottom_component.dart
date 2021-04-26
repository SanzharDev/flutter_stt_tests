import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/providers/records_provider.dart';
import 'package:stt_flutter/src/screens/upload_audio_screen.dart';

class StatelessHomeBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecordsProvider recordsProvider =
        Provider.of<RecordsProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: RawMaterialButton(
            onPressed: () {
              recordsProvider.addRecordDefault();
            },
            shape: CircleBorder(),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 48.0,
            ),
            fillColor: Colors.blue,
            constraints: BoxConstraints.tightFor(width: 76.0, height: 76.0),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            log('GO TO UPLOAD PAGE');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UploadAudioScreen()));
          },
          child: Icon(Icons.upload_outlined),
        ),
      ],
    );
  }
}
