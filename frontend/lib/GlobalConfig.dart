import 'package:flutter/material.dart';

class GlobalConfig with ChangeNotifier {
  String _username = '';
  int _userId = 0;
  List<String> _categories = [];

  String get username => _username;
  int get userId => _userId;
  List<String> get categories => _categories;

  void setConfig(String username, int userId, List<String> categories) {
    _username = username;
    _userId = userId;
    _categories = categories;
    notifyListeners();
  }
}