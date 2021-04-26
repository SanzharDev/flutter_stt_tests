import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UploadProvider extends ChangeNotifier {
  final List<String> _waitingList = [];
  bool _isLoading = false;

  List<String> get waitingList => _waitingList;

  bool get isLoading => _isLoading;

  void _startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void _stopLoading() {
    _isLoading = false;
    notifyListeners();
  }

  void _add({@required String id}) {
    _waitingList.add(id);
    log('Added new id{$id}');
  }

  Future<void> pickFile(BuildContext context) async {
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
    _startLoading();
    http.StreamedResponse res = await request.send();
    String responseJson = await res.stream.bytesToString();
    _stopLoading();
    String id = jsonDecode(responseJson)['id'];
    _add(id: id);
    log('Response from server: $id');
  }

  Future<void> getTranscribedText(BuildContext context) async {
    String id = _waitingList.last;
    Uri url = Uri.http('192.168.88.77:8008', '/long_audio', {'user_id': id});
    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    log('Response from getTranscribedText: ${jsonDecode(response.body)}');
  }
}
