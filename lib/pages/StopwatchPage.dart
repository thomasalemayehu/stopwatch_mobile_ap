import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/components/LapsDisplay.dart';
import 'package:stopwatch/components/StopwatchControls.dart';
import 'package:stopwatch/components/StopwatchDisplay.dart';
import 'package:stopwatch/state/LapEngine.dart';
import 'package:stopwatch/state/StopwatchTimer.dart';

import '../models/Lap.dart';
import '../services/LapCacheService.dart';
import '../services/TimerCacheService.dart';

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
        key: const Key("mySpecialKey"),
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
            width: 1.0,
          ),
        ),
      ),
      child: SizedBox(
        width: 0.9.sw, // Set the width to take up the available space
        height: 1, // Set the desired height of the top border
      ),
    );
  }
}
