import 'dart:ui';
import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {

  get showLoaderOverlay => loaderOverlay.show(widgetBuilder: (progress) => _overlayLoader());

  get hideLoaderOverlay => loaderOverlay.hide();


  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  Size get screenSize => MediaQuery.of(this).size;

  double get screenRatio => MediaQuery.of(this).size.aspectRatio;
}

Widget _overlayLoader (){
  return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4.5,
          sigmaY: 4.5,
        ),
        child: Center(
          child: Container(
            width: 60.w,
            height: 60.w,
            padding: REdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius8),
            ),
            child: AppLoaders.dancingSquare(),
          ),
        ),
      ));
}