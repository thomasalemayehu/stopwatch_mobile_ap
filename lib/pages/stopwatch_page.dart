import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../components/laps_display.dart';
import '../components/stopwatch_controls.dart';
import '../components/stopwatch_display.dart';
import '../models/lap.dart';
import '../services/lap_cache_service.dart';
import '../services/timer_cache_service.dart';
import '../state/lap_engine.dart';
import '../state/stopwatch_timer.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  Future<Map<String, dynamic>> _loadFromCache() async {
    final List<Lap> laps = [];
    final Map<String, dynamic> cachedData = {
      "timer": "0",
    };
    List<Map<String, dynamic>>? cachedLaps =
        await LapsCacheService.instance.getLaps();
    if (cachedLaps.isNotEmpty) {
      for (var lapMap in cachedLaps) {
        laps.add(Lap.fromJson(lapMap));
      }
    }
    cachedData['laps'] = laps;

    String cachedTimer = await TimerCacheService.instance.getTimer();
    cachedData['timer'] = cachedTimer;

    return cachedData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: _loadFromCache(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => StopwatchTimer(
                  duration: snapshot.hasError
                      ? Duration.zero
                      : Duration(
                          milliseconds: int.parse(snapshot.data!['timer'])),
                ),
              ),
              ChangeNotifierProvider(
                create: (_) => LapEngine(
                    cachedLaps: snapshot.hasError
                        ? [] as List<Lap>
                        : snapshot.data!['laps'] as List<Lap>),
              ),
            ],
            child: Scaffold(
                body: SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.04.sh),
                  child: Column(
                    children: [
                      //
                      const StopwatchDisplay(),

                      // Spacer
                      SizedBox(
                        height: 0.05.sh,
                      ),

                      //
                      const StopwatchControls(),

                      const Expanded(
                        child: LapsDisplay(),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          );
        });
  }
}

class BorderTop extends StatelessWidget {
  const BorderTop({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      child: SizedBox(
        width: 0.9.sw,
        height: 1,
      ),
    );
  }
}
