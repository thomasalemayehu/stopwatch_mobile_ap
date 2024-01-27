import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/state/LapEngine.dart';

import '../helpers.dart';

class LapDisplay extends StatelessWidget {
  final String label;
  final Duration duration;
  const LapDisplay({super.key, required this.label, required this.duration});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 0.2,
          ),
        ),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              Helper.formatDisplayTime(duration),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

class LapsDisplay extends StatelessWidget {
  const LapsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.01.sh),
      child: SizedBox(
        child: Consumer<LapEngine>(builder: (context, stopwatchTimer, index) {
          return ListView.builder(
            itemCount: stopwatchTimer.savedLaps.length,
            itemBuilder: (BuildContext context, int index) => LapDisplay(
              label: 'Lap ${index + 1}',
              duration: stopwatchTimer.savedLaps[index].elapsedTime,
            ),
          );
        }),
      ),
    );
  }
}
