import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class TimerCacheService {
  final String identifier = "timer";
  TimerCacheService._privateConstructor() {
    _initPrefs();
  }

  static final TimerCacheService _instance =
      TimerCacheService._privateConstructor();

  static TimerCacheService get instance => _instance;

  SharedPreferences? _prefs;

  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    if (_prefs?.getString(identifier) == null) {
      await _prefs?.setString(identifier, jsonEncode({}));
    }
  }

  Future<void> saveTimer(String timer) async {
    await _initPrefs();
    await _prefs?.setString(identifier, jsonEncode({identifier: timer}));
  }

  Future<String> getTimer() async {
    await _initPrefs();
    String? timerString = _prefs?.getString(identifier);

    if (timerString == "" || timerString == null || timerString == "{}") {
      return "0";
    }

    var data = jsonDecode(timerString) as Map<String, dynamic>;

    return data[identifier];
  }

  void clear() async {
    await _initPrefs();
    await _prefs?.clear();
  }
}
