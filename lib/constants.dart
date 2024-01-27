import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StopwatchAppConstantValues {
  static const primaryColor = Color(0xFF7851A9);
  static const secondaryColor = Color(0xFF1E296D);
  static const backgroundColor = Color(0xFF020000);
  static const textColor = Color(0xFFFFFFFF);

  //
  static const startButtonColor = Color(0x2283EC72);
  static const resetButtonColor = Color(0x7B5D5656);
  static const stopButtonColor = Color(0x35D00812);
  static const lapButtonColor = Colors.pink;

  static var textThemes = TextTheme(
    displayLarge: TextStyle(
        fontSize: 24.sp, fontWeight: FontWeight.bold, color: textColor),
    bodyLarge: TextStyle(
        fontSize: 14.sp, fontWeight: FontWeight.normal, color: textColor),
    bodySmall: TextStyle(
        fontSize: 12.sp, fontStyle: FontStyle.normal, color: textColor),
  );
}
