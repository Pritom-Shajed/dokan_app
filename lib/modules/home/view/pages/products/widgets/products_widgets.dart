import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsWidgets {
  ProductsWidgets._();

  static Widget productCard ({required String productImageUrl, required String title, required String salePrice, required String regularPrice, required String totalSold}){
    return Container(
      margin: REdgeInsets.all(5),
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

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.radius10)),
                    image:  DecorationImage(
                        image: productImageUrl.isNotEmpty ? NetworkImage(productImageUrl) : AssetImage(AppPngIcons.placeHolder),
                        fit: BoxFit.cover)),
              )),
          Padding(
            padding: REdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTexts.largeText(text: title, maxLine: 2, overflow: TextOverflow.ellipsis),
                8.verticalSpace,
                Row(
                  children: [
                    AppTexts.mediumText(text: '\$$regularPrice', textDecoration: salePrice.isNotEmpty ? TextDecoration.lineThrough : null, color: AppColors.extraLightFontColor),
                    salePrice.isNotEmpty ? 8.horizontalSpace : const SizedBox.shrink(),
                    salePrice.isNotEmpty ? Expanded(child: AppTexts.largeText(text: '\$$salePrice', fontWeight: FontWeight.bold)) : const SizedBox.shrink(),
                  ],
                ),
                8.verticalSpace,
                Row(children: List.generate(5, (index){
                  return AppIconWidgets.svgAssetIcon(iconPath: AppSvgIcons.star);
                }),),
                8.verticalSpace,
                AppTexts.smallText(text: '$totalSold Sold', color: AppColors.extraLightFontColor)
              ],
            ),
          )
        ],
      ),
    );
  }
}