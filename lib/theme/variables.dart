import 'package:flutter/material.dart';

ThemeData myThemeData() {
  return ThemeData(
    primaryColor: AppTheme.primaryColor,
    accentColor: AppTheme.secondaryColor,
    primaryColorLight: AppTheme.lightColor,
    scaffoldBackgroundColor: AppTheme.lightColor,
    platform: TargetPlatform.iOS,
    //  brightness: Brightness.light,
    fontFamily: 'Cairo',
    iconTheme: IconThemeData(
      size: 30,
      color: AppTheme.primaryColor,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: AppTheme.darkColor),
      subtitle1: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.darkColor),
      subtitle2: TextStyle(
          fontSize: 13, fontWeight: FontWeight.w500, color: AppTheme.darkColor),
      bodyText1: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, color: AppTheme.darkColor),
      bodyText2: TextStyle(
          fontSize: 13, fontWeight: FontWeight.w500, color: AppTheme.darkColor),
      overline: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: AppTheme.darkColor),
    ),
  );
}

class AppTheme {
  static final primaryColor = Color(0xFF3c3c8e);
  static final secondaryColor = Color(0xFFeff4ff);
  static final mediumColor = Color(0xFF838383);
  static final darkColor = Color(0xFF121212);
  static final lightColor = Color(0xFFf1f1f1);
  static final errorColor = Color(0xFFd80a2d);
  static final successColor = Color(0xFF62aa75);
  static final blueColor = Color(0xFF214fbf);
  static final controlHeight = 44;
  static final controlPadding = 8.0;
}
