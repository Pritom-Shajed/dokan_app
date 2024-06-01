import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtons {
  AppButtons._();

  static Widget iconButton ({double? size, VoidCallback? onTap, required IconData icon, Color? color}){
    return IconButton(onPressed: onTap, icon: Icon(icon, color: color ?? AppColors.white, size: size ?? 24.h,));
  }

  static Widget svgIconButton ({double? size, VoidCallback? onTap, required String iconPath, Color? color}){
    return GestureDetector(
        onTap: onTap,
        child: AppIconWidgets.svgAssetIcon(iconPath: iconPath, size: size, color: color));
  }

  static Widget textButton ({required String text, double? fontSize, FontWeight? fontWeight, VoidCallback? onTap, Color? color}){
    return GestureDetector(onTap: onTap,child: AppTexts.smallText(text: text, fontSize: fontSize, fontWeight: fontWeight, color: color ?? AppColors.primaryColor));
  }

  static Widget buttonWithBg ({VoidCallback? onTap, required String text, Color? textColor, Color? bgColor}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        padding: REdgeInsets.all(20),
        decoration: BoxDecoration(
            color: bgColor ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(Dimensions.radius10)
        ),
        child: AppTexts.largeText(text: text, color: textColor ?? AppColors.white),
      ),
    );
  }

  static Widget socialMediaButton ({required String svgIconPath, VoidCallback? onTap, double? iconSize, double? boxSize}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: boxSize ?? 56.h,
        height: boxSize ?? 56.h,
        padding: REdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 3),
                  blurRadius: 2,
                  spreadRadius: 0,
                  color: AppColors.shadowColor),
            ]),
        child: AppIconWidgets.svgAssetIcon(iconPath: svgIconPath, size: iconSize ?? Dimensions.radius24),
      ),
    );
  }
}