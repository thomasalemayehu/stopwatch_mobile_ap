import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stopwatch/constants.dart';

//
class ControlButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  const ControlButton(
      {super.key, required this.label, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
            style: Theme.of(context).textTheme.bodySmall,
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
    return SizedBox(
      height: 0.1.sh,
      width: 0.9.sw,
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ControlButton(
              label: "Reset",
              backgroundColor: StopwatchAppConstantValues.resetButtonColor,
            ),
            ControlButton(
              label: "Start",
              backgroundColor: StopwatchAppConstantValues.startButtonColor,
            ),
          ],
        ),
      ),
    );
  }
}
