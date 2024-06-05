import 'package:flutter/material.dart';

 class AppColors {

   AppColors._();

  static Color baseColor = hexToColor('#222455');
  static Color baseFontColor = Colors.black;
  static Color lightFontColor = hexToColor('#383C40');
  static Color extraLightFontColor = hexToColor('#A4A9AF');
  static Color primaryColor = hexToColor('#F75F55');
  static Color lightScaffoldBackgroundColor = hexToColor('#F8F8F8');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#FF679B');
  static Color secondaryDarkAppColor = hexToColor('#2F2E2E');
  static Color buttonStroke = hexToColor('#D2DBE0');
  static Color lightGray = hexToColor('#F6F6F6');
  static Color white = Colors.white;
  static Color blue = Colors.blue;
  static Color pink = hexToColor('#FF708A');
  static Color green = hexToColor('#1ABC9C');
  static Color shadowColor = Colors.grey.withOpacity(.3);
  

  static Gradient gradiantColor = LinearGradient(colors: [
    hexToColor('#F2709C'),
    hexToColor('#FF9472')
  ]);

  static Color skeletonColor1 = Colors.grey.shade200;
  static Color skeletonColor2 = Colors.grey.shade100;

}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}