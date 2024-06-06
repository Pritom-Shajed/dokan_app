import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtons {
  AppButtons._();

  static Widget iconButton ({double? size, VoidCallback? onTap, required IconData icon, Color? color}){
    return IconButton(onPressed: onTap, icon: Icon(icon, color: color ?? AppColors.white, size: size ?? 24.h,));
  }

  static Widget checkBox ({required bool value, ValueChanged<bool?>? onChanged}){
    return Container(
      margin: REdgeInsets.only(right: 8),
      child: SizedBox(
        width: 24.h,
        height: 24.h,
        child: Checkbox(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (!states.contains(MaterialState.selected)) {
              return Colors.white;
            }
            return null;
          }),
          side: BorderSide(color: AppColors.pink, width: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius6)),
          activeColor: AppColors.pink,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }

  static Widget svgIconButton ({double? size, VoidCallback? onTap, required String iconPath, Color? color}){
    return GestureDetector(
        onTap: onTap,
        child: AppIconWidgets.svgAssetIcon(iconPath: iconPath, size: size, color: color));
  }

  static Widget svgIconButtonWithText ({double? size, bool isIconAtRight = false, required String text, VoidCallback? onTap, required String iconPath, Color? color}){
    return GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            !isIconAtRight ? AppIconWidgets.svgAssetIcon(iconPath: iconPath, size: size, color: color) : const SizedBox.shrink(),
            !isIconAtRight ? 6.horizontalSpace : 0.horizontalSpace,
            AppTexts.mediumText(text: text, color: color),
            isIconAtRight ? 6.horizontalSpace : 0.horizontalSpace,
            isIconAtRight ? AppIconWidgets.svgAssetIcon(iconPath: iconPath, size: size, color: color) : const SizedBox.shrink(),

          ],
        ));
  }

  static Widget textButton ({required String text, double? fontSize, FontWeight? fontWeight, VoidCallback? onTap, Color? color}){
    return GestureDetector(onTap: onTap,child: AppTexts.smallText(text: text, fontSize: fontSize, fontWeight: fontWeight, color: color ?? AppColors.primaryColor));
  }

  static Widget buttonWithBg ({VoidCallback? onTap, required String text, Color strokeColor = Colors.transparent, Color? textColor, Color? bgColor}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        padding: REdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: strokeColor),
            color: bgColor ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(Dimensions.radius10)
        ),
        child: AppTexts.largeText(text: text, color: textColor ?? AppColors.white),
      ),
    );
  }

  static Widget saveAndCancelButton ({String cancelText = 'Cancel', String saveText = 'Save', VoidCallback? onTapCancel, VoidCallback? onTapSave}){
    return  Row(
      children: [
        Expanded(child: AppButtons.buttonWithBg(text: 'Cancel', strokeColor: AppColors.stokeColor, onTap: onTapCancel ?? () => Get.back(), textColor: AppColors.extraLightFontColor, bgColor: AppColors.white)),
        10.horizontalSpace,
        Expanded(child: AppButtons.buttonWithBg(text: 'Save', onTap: onTapSave ?? () => Get.back(), bgColor: AppColors.green)),
      ],
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