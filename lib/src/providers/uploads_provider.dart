import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stt_flutter/src/models/uploaded_record.dart';
import 'package:stt_flutter/src/services/uploads_service.dart';

class UploadProvider extends ChangeNotifier {
  final List<String> _processingList = [];
  final List<UploadedRecord> _transcribedRecordsList = [];
  bool _checkingIsInitialized = false;
  bool _isLoading = false;

  UploadProvider() {
    _initProcessingList();
    _initTranscribedRecordsList();
  }

  Future<void> pickFile() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      File file = File(result.files.single.path);
      _sendAudio(
          result.files.single.path, 'http://192.168.88.77:8008/long_audio/');
      log('USER PICKED FILE: ${file.path}');
    } else {
      log('USER REFUSED TO PICK A FILE');
    }
  }

  List<String> get processingList => UnmodifiableListView(_processingList);

  bool get isLoading => _isLoading;

  List<UploadedRecord> get transcribedRecords => _transcribedRecordsList;

  Future<void> _initTranscribedRecordsList() async {
    UploadsService uploadsService =
        await UploadsService.instance.uploadsService;
    if (_transcribedRecordsList.isNotEmpty) _transcribedRecordsList.clear();
    _transcribedRecordsList.addAll(await uploadsService.recordsTranscribed());
    log('Initialized transcribed records list ${_transcribedRecordsList.length}');
    notifyListeners();
  }

  Future<void> _initStatusCheck() async {
    log('Checking initialized');
    return Timer.periodic(Duration(seconds: 100), _repeatingAction);
  }

  void _repeatingAction(Timer timer) {
    _checkProcessingRecords();
    if (_processingList.isEmpty) {
      timer.cancel();
      log('Checking canceled');
      _checkingIsInitialized = false;
    }
  }

  Future<void> _initProcessingList() async {
    UploadsService uploadsService =
        await UploadsService.instance.uploadsService;
    List<UploadedRecord> records = await uploadsService.recordsInProcess();
    _processingList.addAll(
        List.generate(records.length, (index) => records[index].audioId));
    if (_processingList.isNotEmpty) {
      _initStatusCheck();
      _checkingIsInitialized = true;
    }
  }

  Future<void> _checkProcessingRecords() async {
    if (_processingList.isNotEmpty) {
      for (String audioId in _processingList) {
        log('Requesting result of transcribe audio_id = $audioId');
        _getTranscribedText(audioId);
      }
    } else {
      log('Processing list is empty');
    }
  }

  Future<void> _getTranscribedText(String audioId) async {
    Uri url =
        Uri.http('192.168.88.77:8008', '/long_audio', {'audio_id': audioId});
    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      log('Response from getTranscribedText: $result');
      if (result['status'] == 'Done')
        _onRecordTranscribeDone(audioId, result['text']);
    } else {
      log('Server responded with error. Status: ${response.statusCode}. Error message: ${response.body}');
    }
  }

  Future<void> _sendAudio(String filePath, String url) async {
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(http.MultipartFile('audio',
        File(filePath).readAsBytes().asStream(), File(filePath).lengthSync(),
        filename: filePath.split("/").last));
    try {
      _startLoading();
      http.StreamedResponse res = await request.send();
      String responseJson = await res.stream.bytesToString();
      _stopLoading();
      String id = jsonDecode(responseJson)['audio_id'];
      _add(audioId: id, path: filePath);
      log('Response from server: $id');
    } catch (e) {
      log('Error has arisen: $e');
      _stopLoading();
    }
  }

  Future<void> _add({@required String audioId, @required String path}) async {
    UploadsService uploadsService =
        await UploadsService.instance.uploadsService;
    await uploadsService.save(UploadedRecord(
      audioId: audioId,
      title: '',
      text: '',
      status: 'Processing',
      duration: 1,
      path: path,
    ));
    _processingList.add(audioId);
    if (!_checkingIsInitialized) {
      _initStatusCheck();
    }
    log('Added new id{$audioId}');
  }

  Future<void> _onRecordTranscribeDone(String audioId, String text) async {
    UploadsService uploadsService =
        await UploadsService.instance.uploadsService;
    uploadsService.updateByAudioId(audioId, text, 'Done').then((value) {
      _processingList.remove(audioId);
    });
    _initTranscribedRecordsList();
  }

  void _startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void _stopLoading() {
    _isLoading = false;
    notifyListeners();
  }
}
