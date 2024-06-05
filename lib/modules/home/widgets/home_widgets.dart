import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeWidgets {
  HomeWidgets._();

  static Widget bottomNavBar ({required bool isProductsTapped, required bool isProfileTapped, VoidCallback? onTapProducts, VoidCallback? onTapProfile}){
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.radius24)),
      child: BottomAppBar(
        padding: REdgeInsets.symmetric(horizontal: 24, vertical: 24),
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButtons.svgIconButton(iconPath: AppSvgIcons.home, onTap: () => AppToasts.shortToast(Strings.homeMessage, gravity: ToastGravity.CENTER), color: AppColors.baseColor),
            AppButtons.svgIconButton(iconPath: AppSvgIcons.gridView, onTap: onTapProducts,  color: isProductsTapped ? AppColors.primaryColor : AppColors.baseColor),
            const SizedBox.shrink(),
            AppButtons.svgIconButton(iconPath: AppSvgIcons.cart, onTap: () => AppToasts.shortToast(Strings.homeMessage, gravity: ToastGravity.CENTER), color: AppColors.baseColor),
            AppButtons.svgIconButton(iconPath: AppSvgIcons.user, onTap: onTapProfile, color: isProfileTapped ? AppColors.primaryColor : AppColors.baseColor),
          ],
        ),

      ),
    );
  }


}