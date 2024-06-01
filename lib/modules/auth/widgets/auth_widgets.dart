import 'dart:io';

import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthWidgets {
  AuthWidgets._();

  static Widget footer ({VoidCallback? onTapGoogle, VoidCallback? onTapLoginOrSignUp, VoidCallback? onTapFacebook, VoidCallback? navigateToSignUp, VoidCallback? navigateToSignIn, required bool isSignInPage}){
    return Column(
      children: [
        AppButtons.buttonWithBg(onTap: onTapLoginOrSignUp,text: isSignInPage ? 'Login' : 'Sign Up'),

        52.verticalSpace,

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButtons.socialMediaButton(onTap: onTapGoogle ?? () => AppToasts.shortToast(Strings.comingSoon),svgIconPath: AppSvgIcons.facebook),
            12.horizontalSpace,
            AppButtons.socialMediaButton(onTap: onTapFacebook ?? () => AppToasts.shortToast(Strings.comingSoon),svgIconPath: AppSvgIcons.google),
          ],
        ),

        52.verticalSpace,

       isSignInPage ? AppButtons.textButton(text: 'Create new account', onTap: navigateToSignUp, fontSize: Dimensions.fontSize18, color: AppColors.lightFontColor) :   AppTexts.richTextWithTap(normalText: 'Already have an account?', tappableText: 'Login', onTap: navigateToSignIn)
      ],
    );
  }


  static dpWithEditButton ({String? imagePath, VoidCallback? onTapPickImage}){
    return Stack(
      clipBehavior: Clip.none,
      children: [Container(
          width: 122.h,
          height: 122.h,
          padding: imagePath != null && imagePath.isNotEmpty ? null : REdgeInsets.all(50),
          decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              image: imagePath != null && imagePath.isNotEmpty ? DecorationImage(image: FileImage(File(imagePath)), fit: BoxFit.cover) : null,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, 3),
                    blurRadius: 2,
                    spreadRadius: 0,
                    color: AppColors.shadowColor),
              ]),
          child: imagePath != null && imagePath.isNotEmpty ? null : AppIconWidgets.svgAssetIcon(iconPath: AppSvgIcons.user),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child:  Container(
            padding: REdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.gradiantColor,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(1, 3),
                      blurRadius: 2,
                      spreadRadius: 0,
                      color: AppColors.shadowColor),
                ]),
            child: AppButtons.svgIconButton(onTap: onTapPickImage, iconPath: AppSvgIcons.camera, size: Dimensions.radius12),
          ),)
      ],
    );
  }
}