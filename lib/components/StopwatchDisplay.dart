import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StopwatchDisplay extends StatelessWidget {
  const StopwatchDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 8.0,
          style: BorderStyle.solid,
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: SizedBox(
        width: 0.65.sw,
        height: 0.25.sh,
        child: Center(
            child: Text(
          "00:00:00",
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(letterSpacing: 4, fontSize: 28.sp),
        )),
      ),
    );
  }
}
