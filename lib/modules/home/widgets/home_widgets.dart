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

  static Widget fiterBar ({VoidCallback? onTapFilter, VoidCallback? onTapSort, VoidCallback? onTapMenu}){
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppButtons.svgIconButtonWithText(onTap: onTapFilter, text: 'Filter', iconPath: AppSvgIcons.filter, color: AppColors.extraLightFontColor),
          Row(
            children: [
              AppButtons.svgIconButtonWithText(onTap: onTapSort, text: 'Sort by', iconPath: AppSvgIcons.arrowDown, isIconAtRight: true, color: AppColors.extraLightFontColor),
              16.horizontalSpace,
              AppButtons.svgIconButton(onTap: onTapMenu, iconPath: AppSvgIcons.menu, size: Dimensions.radius14)
            ],
          )
        ],
      ),
    );
  }
}