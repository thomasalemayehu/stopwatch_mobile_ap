import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/constants.dart';
import 'package:stopwatch/services/LapCacheService.dart';
import 'package:stopwatch/services/TimerCacheService.dart';
import 'package:stopwatch/state/LapEngine.dart';
import 'package:stopwatch/state/StopwatchTimer.dart';

import '../models/Lap.dart';

//
class ControlButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Function()? onTap;
  const ControlButton(
      {super.key,
      required this.label,
      required this.backgroundColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: SizedBox(
          width: 0.165.sw,
          height: 0.165.sw,
          child: Center(
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: backgroundColor.withOpacity(1.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class StopwatchControls extends StatelessWidget {
  const StopwatchControls({super.key});

  @override
  Widget build(BuildContext context) {
    LapsCacheService lapsCacheService = LapsCacheService.instance;
    TimerCacheService timerCacheService = TimerCacheService.instance;
    return SizedBox(
      key: const Key("stopwatchControls"),
      height: 0.1.sh,
      width: 0.9.sw,
      child: Center(
        child:
            Consumer<StopwatchTimer>(builder: (context, stopwatchTimer, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Consumer<LapEngine>(
                builder: (context, lapEngine, index) {
                  return stopwatchTimer.isRunning
                      ? ControlButton(
                          label: "Lap",
                          backgroundColor:
                              StopwatchAppConstantValues.resetButtonColor,
                          onTap: () {
                            // add to state
                            Lap newLap =
                                Lap(elapsedTime: stopwatchTimer.elapsed);
                            lapEngine.addLap(newLap);

                            // add to cache
                            lapsCacheService.saveLap(newLap.toJson());
                          },
                        )
                      : ControlButton(
                          label: "Reset",
                          backgroundColor:
                              StopwatchAppConstantValues.resetButtonColor,
                          onTap: () {
                            stopwatchTimer.reset();
                            timerCacheService.clear();

                            //
                            lapEngine.clearLaps();
                            lapsCacheService.clear();
                          },
                        );
                },
              ),

              //
              stopwatchTimer.isRunning
                  ? ControlButton(
                      label: "Stop",
                      backgroundColor:
                          StopwatchAppConstantValues.stopButtonColor,
                      onTap: () {
                        stopwatchTimer.stop();

                        timerCacheService.saveTimer(
                            stopwatchTimer.elapsed.inMilliseconds.toString());
                      },
                    )
                  : ControlButton(
                      label: "Start",
                      backgroundColor:
                          StopwatchAppConstantValues.startButtonColor,
                      onTap: stopwatchTimer.start,
                    ),
            ],
          );
        }),
      ),
    );
  }
}
