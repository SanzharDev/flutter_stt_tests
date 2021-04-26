import 'dart:developer';

import 'package:flutter/material.dart';

class UploadProvider extends ChangeNotifier {
  final List<String> _waitingList = [];
  bool _isLoading = false;

  List<String> get waitingList => _waitingList;

  bool get isLoading => _isLoading;

  void add({@required String id}) {
    _waitingList.add(id);
    log('Added new id{$id}');
  }
}
