import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/components/LapsDisplay.dart';
import 'package:stopwatch/components/StopwatchControls.dart';
import 'package:stopwatch/components/StopwatchDisplay.dart';
import 'package:stopwatch/state/LapEngine.dart';
import 'package:stopwatch/state/StopwatchTimer.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StopwatchTimer()),
        ChangeNotifierProvider(create: (_) => LapEngine()),
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
