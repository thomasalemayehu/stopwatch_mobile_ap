import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stopwatch/constants.dart';
import 'package:stopwatch/pages/StopwatchPage.dart';

void main() {
  runApp(const StopwatchApp());
}

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: 'Stopwatch Application',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: StopwatchAppConstantValues.backgroundColor,
          primaryColor: StopwatchAppConstantValues.primaryColor,
          textTheme: StopwatchAppConstantValues.textThemes,
        ),
        home: const StopwatchPage(),
      ),
    );
  }
}
