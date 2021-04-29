import 'package:flutter/material.dart';

class RecordCardProvider extends ChangeNotifier {
  bool _isEditingTitle = false;
  String _title = '';

  bool get isEditingTitle => _isEditingTitle;

  String get title => _title;

  set title(String title) => _title = title;

  set isEditingTitle(bool isEditingTitle) => _isEditingTitle = isEditingTitle;

  void changeEditingTitle(bool isEditingTitle) {
    _isEditingTitle = isEditingTitle;
    notifyListeners();
  }
}
