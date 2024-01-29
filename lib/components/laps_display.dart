import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../helpers.dart';
import '../models/lap.dart';
import '../services/lap_cache_service.dart';
import '../state/lap_engine.dart';

class LapDisplay extends StatelessWidget {
  final String label;
  final Lap lap;
  const LapDisplay({super.key, required this.label, required this.lap});

  @override
  Widget build(BuildContext context) {
    LapEngine lapEngine = Provider.of<LapEngine>(context);
    LapsCacheService lapsCacheService = LapsCacheService.instance;
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
            Row(
              children: [
                Text(
                  Helper.formatDisplayTime(lap.elapsedTime),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                ),
                SizedBox(
                  width: 0.05.sw,
                ),
                GestureDetector(
                  onTap: () {
                    lapEngine.removeLap(lap.id);
                    lapsCacheService.removeLap(lap.id);
                  },
                  child: Icon(
                    Icons.delete_outline,
                    color: StopwatchAppConstantValues.stopButtonColor
                        .withOpacity(0.8),
                  ),
                )
              ],
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
              lap: stopwatchTimer.savedLaps[index],
            ),
          );
        }),
      ),
    );
  }
}
