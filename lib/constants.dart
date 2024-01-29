import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StopwatchAppConstantValues {
  static const Color primaryColor = Color(0xFF7851A9);
  static const Color secondaryColor = Color(0xFF1E296D);
  static const Color backgroundColor = Color(0xFF020000);
  static const Color textColor = Color(0xFFFFFFFF);

  //
  static const Color startButtonColor = Color(0x2283EC72);
  static const Color resetButtonColor = Color(0x7B5D5656);
  static const Color stopButtonColor = Color(0x35D00812);
  static const MaterialColor lapButtonColor = Colors.pink;

  static TextTheme textThemes = TextTheme(
    displayLarge: TextStyle(
        fontSize: 24.sp, fontWeight: FontWeight.bold, color: textColor),
    bodyLarge: TextStyle(
        fontSize: 14.sp, fontWeight: FontWeight.normal, color: textColor),
    bodySmall: TextStyle(
        fontSize: 12.sp, fontStyle: FontStyle.normal, color: textColor),
  );
}
