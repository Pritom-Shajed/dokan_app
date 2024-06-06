import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsWidgets {
  ProductsWidgets._();

  static Widget productCard ({required int index,required String productImageUrl, required double avrgRating, required String title, required String salePrice, required String regularPrice, required String price}){
    return Container(
      margin: REdgeInsets.only(right: index.isEven ? 10 : 20, left: index.isOdd ? 10 : 20, bottom: 20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //Product Image
          Expanded(child: CachedNetworkImage(
            imageUrl: productImageUrl,
            imageBuilder:
                (context, imageProvider) =>
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top:Radius.circular(Dimensions.radius10)),
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,),
                  ),
                ),
            placeholder: (context, url) => Skeletonizer(
              enabled: true,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top:Radius.circular(Dimensions.radius10)),
                  image: DecorationImage(
                    image: AssetImage(AppPngIcons.placeHolder),
                    fit: BoxFit.cover,),
                ),
              ),
            ),
            errorWidget: (context, url, error)
            =>  Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top:Radius.circular(Dimensions.radius10)),
                image: DecorationImage(
                    image: AssetImage(AppPngIcons.placeHolder),
                    fit: BoxFit.cover,),
              ),
            ),
          ),),

          //Product Info
          Padding(
            padding: REdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //Title
                AppTexts.largeText(text: title, maxLine: 2, overflow: TextOverflow.ellipsis),
                8.verticalSpace,

                //Price
                Row(
                  children: [
                    AppTexts.mediumText(text: '\$${regularPrice.isEmpty ? price : regularPrice}', textDecoration: salePrice.isNotEmpty ? TextDecoration.lineThrough : null, fontSize: salePrice.isNotEmpty ? Dimensions.fontSize16 : Dimensions.fontSize18, color: salePrice.isNotEmpty ? AppColors.extraLightFontColor : null, fontWeight: salePrice.isNotEmpty ? null : FontWeight.bold),
                    salePrice.isNotEmpty ? 8.horizontalSpace : const SizedBox.shrink(),
                    salePrice.isNotEmpty ? Expanded(child: AppTexts.largeText(text: '\$${salePrice.isEmpty ? 0 : salePrice}', fontWeight: FontWeight.bold)) : const SizedBox.shrink(),
                  ],
                ),
                8.verticalSpace,

                //Rating
                PannableRatingBar(
                  rate: avrgRating,
                  items: List.generate(5, (index) =>
                   RatingWidget(
                    selectedColor: Colors.orange,
                    unSelectedColor: Colors.grey,
                    child: Icon(
                      Icons.star,
                      size: Dimensions.radius16,
                    ),
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  static Widget fiterBar ({VoidCallback? onTapFilter, VoidCallback? onTapMenu}){
    return Container(
      margin: REdgeInsets.only(top: 20, right: 20, left: 20),
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
              AppButtons.svgIconButtonWithText(onTap: onTapFilter, text: 'Sort by', iconPath: AppSvgIcons.arrowDown, isIconAtRight: true, color: AppColors.extraLightFontColor),
              16.horizontalSpace,
              AppButtons.svgIconButton(onTap: () => AppToasts.shortToast(Strings.filterMessage, gravity: ToastGravity.CENTER), iconPath: AppSvgIcons.menu, size: Dimensions.radius14)
            ],
          )
        ],
      ),
    );
  }
}