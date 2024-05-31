import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class AppIconWidgets {

  static Widget svgAssetIcon ({double? size, Color? color, required String iconPath}) => SvgPicture.asset(iconPath, width: size, height: size, color: color,);

}