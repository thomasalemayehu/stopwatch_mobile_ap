import 'package:flutter/cupertino.dart';
import 'package:stopwatch/services/LapCacheService.dart';

import '../models/Lap.dart';

class LapEngine extends ChangeNotifier {
  List<Lap> savedLaps = [];

  LapEngine() {
    _loadLapsFromCache();
  }

  void _loadLapsFromCache() async {
    List<Map<String, dynamic>>? cachedLaps =
        await LapsCacheService.instance.getLaps();
    if (cachedLaps.isNotEmpty) {
      savedLaps = cachedLaps.map((lapMap) => Lap.fromJson(lapMap)).toList();
      notifyListeners();
    }
  }

  void addLap(Lap newLap) {
    savedLaps.add(newLap);
    notifyListeners();
  }

  void removeLap(int lapId) {
    savedLaps = [
      for (var lapInfo in savedLaps)
        if (lapInfo.id != lapId) lapInfo
    ];
    notifyListeners();
  }

  void clearLaps() {
    savedLaps = [];
    notifyListeners();
  }
}
