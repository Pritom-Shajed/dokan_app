import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

abstract class GlobalAppBar {
  static PreferredSizeWidget common({String? text, Color? color, String? suffixIconPath, VoidCallback? onTapSuffix}) => AppBar(
        title: text != null ? AppTexts.largeText(text: text, fontSize: Dimensions.fontSize22, color: AppColors.baseColor, fontWeight: FontWeight.bold) : null,
       centerTitle: true,
        actions: suffixIconPath == null ? null : [
          Padding(
            padding: REdgeInsets.only(right: 20),
            child: AppButtons.svgIconButton(onTap: onTapSuffix ?? () => AppToasts.shortToast(Strings.notAvailable, gravity: ToastGravity.CENTER), iconPath: suffixIconPath, color: AppColors.baseColor),
          )
        ],
        backgroundColor: Colors.transparent,
      );
}
