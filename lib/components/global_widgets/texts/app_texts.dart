import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

abstract class AppTexts {

  static Widget richTextWithTap ({VoidCallback? onTap, required String normalText, required String tappableText}){
    return RichText(
      text: TextSpan(
        text: '$normalText ',
        style: TextStyle(color: AppColors.lightFontColor, fontSize: Dimensions.fontSize18, fontFamily: AppFonts.roboto
        ),
        children: [
          TextSpan(
            text: tappableText,
            style: TextStyle(color: AppColors.blue, fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }

  static Widget extraLargeText ({int? maxLine, TextOverflow? overflow,required String text, Color? color, double? fontSize,TextDecoration? textDecoration, FontWeight? fontWeight}){
    return Text(text, maxLines: maxLine, overflow: overflow ?? TextOverflow.ellipsis, style: TextStyle(color: color ?? AppColors.baseFontColor, decoration: textDecoration, fontSize: fontSize ?? Dimensions.fontSize26, fontWeight: fontWeight),);
  }

  static Widget largeText ({int? maxLine, TextOverflow? overflow,required String text, Color? color, double? fontSize,TextDecoration? textDecoration, FontWeight? fontWeight}){
    return Text(text, maxLines: maxLine, overflow: overflow ?? TextOverflow.ellipsis, style: TextStyle(color: color ?? AppColors.baseFontColor, decoration: textDecoration, fontSize: fontSize ?? Dimensions.fontSize18, fontWeight: fontWeight),);
  }

  static Widget mediumText ({int? maxLine, TextOverflow? overflow, required String text, Color? color, double? fontSize, TextDecoration? textDecoration, FontWeight? fontWeight}){
    return Text(text, maxLines: maxLine, overflow: overflow ?? TextOverflow.ellipsis, style: TextStyle(color: color ?? AppColors.baseFontColor, decoration: textDecoration, fontSize: fontSize ?? Dimensions.fontSize14, fontWeight: fontWeight ),);
  }

  static Widget smallText ({int? maxLine, TextOverflow? overflow,required String text, TextAlign? textAlign, Color? color, double? fontSize,TextDecoration? textDecoration, FontWeight? fontWeight}){
    return Text(text, maxLines: maxLine, overflow: overflow ?? TextOverflow.ellipsis, textAlign: textAlign, style: TextStyle(color: color ?? AppColors.baseFontColor, decoration: textDecoration, fontSize: fontSize ?? Dimensions.fontSize12, fontWeight: fontWeight),);
  }

  static Widget extraSmallText ({int? maxLine, TextOverflow? overflow,required String text, Color? color, double? fontSize, TextDecoration? textDecoration, FontWeight? fontWeight}){
    return Text(text, maxLines: maxLine, overflow: overflow ?? TextOverflow.ellipsis, style: TextStyle(color: color ?? AppColors.baseFontColor, decoration: textDecoration, fontSize: fontSize ?? Dimensions.fontSize10, fontWeight: fontWeight),);
  }
}