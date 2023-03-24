import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appSettingsNotifierProvider = Provider<AppSettingsNotifier>((ref) {
  return AppSettingsNotifier();
});

class AppSettingsNotifier extends ChangeNotifier {
  bool _createdBefore = false;
  bool get isCreatedBefore => _createdBefore;
  set isCreatedBefore(bool value) {
    _createdBefore = value;
    notifyListeners();
  }
}
