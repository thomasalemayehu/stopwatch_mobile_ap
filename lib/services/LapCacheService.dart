import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LapsCacheService {
  final String identifier = "laps";
  LapsCacheService._privateConstructor() {
    _initPrefs();
  }

  static final LapsCacheService _instance =
      LapsCacheService._privateConstructor();

  static LapsCacheService get instance => _instance;

  SharedPreferences? _prefs;

  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    if (_prefs?.getString(identifier) == null) {
      await _prefs?.setString(identifier, json.encode([]));
    }
  }

  Future<void> saveLap(Map<String, dynamic> data) async {
    await _initPrefs();
    List<Map<String, dynamic>> storedData = await getLaps();
    storedData.add(data);
    await _prefs?.setString(identifier, jsonEncode(storedData));
  }

  Future<List<Map<String, dynamic>>> getLaps() async {
    await _initPrefs();
    String? jsonString = _prefs?.getString(identifier);
    if (jsonString != null) {
      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((item) => item as Map<String, dynamic>).toList();
    }
    return [];
  }

  Future<void> removeLap(int lapId) async {
    await _initPrefs();
    String? jsonString = _prefs?.getString(identifier);
    if (jsonString != null) {
      List laps = json
          .decode(jsonString)
          .map((item) => item as Map<String, dynamic>)
          .toList();

      laps = [
        for (var lapInfo in laps)
          if (lapInfo['id'] != lapId) lapInfo
      ];
      await _prefs?.setString(identifier, jsonEncode(laps));
    }
  }

  void clear() async {
    await _initPrefs();
    await _prefs?.clear();
  }
}
