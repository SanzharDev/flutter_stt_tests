import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadAudioScreen extends StatelessWidget {
  Future<void> _pickFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path);
      log('USER PICKED FILE: ${file.path}');
    } else {
      log('USER REFUSED TO PICK A FILE');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload audio'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _pickFile();
          },
          child: Icon(Icons.file_upload),
        ),
      ),
    );
  }
}
