import 'package:flutter/cupertino.dart';

import '../models/lap.dart';

class LapEngine extends ChangeNotifier {
  List<Lap> savedLaps = [];

  LapEngine({required List<Lap> cachedLaps}) {
    savedLaps = cachedLaps;
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
