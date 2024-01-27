import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StopwatchAppConstantValues {
  static const primaryColor = Color(0xFF7851A9);
  static const secondaryColor = Color(0xFF1E296D);
  static const backgroundColor = Color(0xFF020000);
  static const textColor = Color(0xFFFFFFFF);

  //
  static const startButtonColor = Color(0x417DEE6A);
  static const resetButtonColor = Color(0x7BE81A21);
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
