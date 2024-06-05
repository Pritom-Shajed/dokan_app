import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/models/models.dart';
import 'package:dokan_app/utils/constants/app_icons/app_icons.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidgets {
  ProfileWidgets._();

  static Widget profileHeader (){
    return  Column(
      children: [
        DottedBorder(
          borderType: BorderType.Circle,
          dashPattern: const [2, 4],
          padding: REdgeInsets.all(8),
          color: AppColors.pink,
          child: CircleAvatar(
            radius: Dimensions.radius70,
            backgroundImage: AssetImage(AppPngIcons.placeHolder),
          ),
        ),

        60.verticalSpace,

        AppTexts.extraLargeText(text: 'Pritom', fontWeight: FontWeight.bold),
        AppTexts.mediumText(text: 'info@johnsmith.com', color: AppColors.lightFontColor),
      ],
    );
  }

  static Widget options (){
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(2, 3),
                blurRadius: 5,
                spreadRadius: 1,
                color: AppColors.shadowColor),
          ]),

      child: Column(
        children: List.generate(ProfileOptions.options.length, (index){
          final option = ProfileOptions.options[index];
          return AppExpansionTiles.expansionTile(
              iconSvgPath: option.iconSvgPath,
              title: option.title,
              expandedContent: index != 0 ? AppTexts.mediumText(text: Strings.notAvailable) : AppTexts.mediumText(text: 'Account'));
        }),
      ),
    );
  }
}