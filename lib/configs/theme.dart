import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: KColors.backgroundColor,
  scaffoldBackgroundColor: KColors.backgroundColor,
  primaryColor: KColors.primaryColor,
  accentColor: KColors.primaryColor,
  buttonColor: KColors.primaryColor,
  canvasColor: Colors.transparent,
  visualDensity: VisualDensity.adaptivePlatformDensity
);
final SystemUiOverlayStyle systemStyle = SystemUiOverlayStyle(
  statusBarBrightness: Brightness.dark,  
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: KColors.backgroundColor,
  systemNavigationBarColor: KColors.backgroundColor,
  systemNavigationBarIconBrightness: Brightness.dark
);

class KColors {
  static const backgroundColor = Color(0xfff0f5ff);
  static const primaryColor = Color(0xff0075f6);
  static const text = Color(0xff6f89a1);
  static const accentText = Color(0xff020f24);
}