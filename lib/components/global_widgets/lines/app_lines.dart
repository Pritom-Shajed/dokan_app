import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLines {
  AppLines._();

  static Widget bottomSheetTopLine (){
    return Center(child: Container(
      margin: REdgeInsets.only(top: 12, bottom: 20),
      alignment: Alignment.center, width: 47.w, height: 4.h,
      decoration: BoxDecoration(
          color: AppColors.pink.withOpacity(0.4),
          borderRadius: BorderRadius.circular(Dimensions.radius4)
      ),
    ));
  }
}