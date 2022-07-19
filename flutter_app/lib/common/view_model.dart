import "package:flutter/material.dart";

abstract class ViewModel extends ChangeNotifier {
  String _error = "";
  String get error => _error;
  bool get hasError => _error.isNotEmpty;
  bool _loading = false;
  bool get loading => _loading;

  @protected
  void set loading(bool value) {
    _loading = value;
  }

  @protected
  void set error(String value) {
    _error = value;
  }
}
