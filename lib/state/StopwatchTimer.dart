import 'dart:async';

import 'package:flutter/cupertino.dart';

class StopwatchTimer extends ChangeNotifier {
  DateTime? _startTime;
  Duration _elapsed = Duration.zero;
  Timer? _timer;

  Duration get elapsed =>
      _elapsed +
      (isRunning ? DateTime.now().difference(_startTime!) : Duration.zero);

  bool get isRunning => _timer != null;

  void _updateTime() {
    _elapsed += DateTime.now().difference(_startTime!);
    _startTime = DateTime.now();
    notifyListeners(); // Notify listeners about the change
  }

  void start() {
    if (isRunning) return;
    _startTime = DateTime.now();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer timer) {
      _updateTime();
    });
  }

  void stop() {
    if (!isRunning) return;
    _updateTime();
    _timer?.cancel();
    _timer = null;
  }

  void reset() {
    stop();
    _elapsed = Duration.zero;
    notifyListeners(); // Notify listeners about the change
  }
}
