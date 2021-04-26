import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/providers/upload_provider.dart';

class UploadAudioScreen extends StatelessWidget {
  Future<void> _pickFile(BuildContext context) async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(type: FileType.audio);

    if (result != null) {
      File file = File(result.files.single.path);
      _sendAudio(context,
          fileName: result.files.single.path,
          url: 'http://192.168.88.77:8008/long_audio/');
      log('USER PICKED FILE: ${file.path}');
    } else {
      log('USER REFUSED TO PICK A FILE');
    }
  }

  Future<void> _sendAudio(BuildContext context,
      {String fileName, String url}) async {
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(http.MultipartFile('audio',
        File(fileName).readAsBytes().asStream(), File(fileName).lengthSync(),
        filename: fileName.split("/").last));
    http.StreamedResponse res = await request.send();
    String responseJson = await res.stream.bytesToString();
    String id = jsonDecode(responseJson)['id'];
    Provider.of<UploadProvider>(context, listen: false).add(id: id);
    log('Response from server: $id');
  }

  Future<void> _getTranscribedText(BuildContext context) async {
    String id =
        Provider.of<UploadProvider>(context, listen: false).waitingList.last;
    Uri url = Uri.http('192.168.88.77:8008', '/long_audio', {'user_id': id});
    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    log('Response from getTranscribedText: ${jsonDecode(response.body)}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload audio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                _pickFile(context);
              },
              child: Icon(Icons.file_upload),
            ),
            ElevatedButton(
              onPressed: () {
                _getTranscribedText(context);
              },
              child: Icon(Icons.read_more),
            ),
          ],
        ),
      ),
    );
  }
}
