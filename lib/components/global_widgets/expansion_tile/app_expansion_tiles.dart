import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppExpansionTiles {
  AppExpansionTiles._();


  static Widget expansionTile ({required String iconSvgPath, required String title, bool isLast = false, required Widget expandedContent}){
    bool isExpanded = false;
    return StatefulBuilder(builder: (context, setState){
      return  Padding(
        padding: REdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: ()=>setState(() => isExpanded = !isExpanded),
              child:  Container(
                margin: REdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    AppIconWidgets.svgAssetIcon(iconPath: iconSvgPath),
                    10.horizontalSpace,
                    Expanded(child: AppTexts.largeText(text: title)),
                    AppIconWidgets.svgAssetIcon(iconPath: isExpanded ? AppSvgIcons.arrowDown : AppSvgIcons.arrowRight)
                  ],
                ),
              ),
            ),
            AnimatedScale(
              duration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
              scale: isExpanded ? 1.0 : 0.9,
              child: isExpanded ? expandedContent : null,
            ),

            isExpanded ? 12.verticalSpace : 0.verticalSpace,
            Divider(color: AppColors.dividerColor,)
          ],
        ),
      );
    });
  }

}