import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/modules/home/home.dart';
import 'package:dokan_app/utils/enums/enums.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:dokan_app/utils/constants/dimensions/dimensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppBottomSheets {
  AppBottomSheets._();

  static imageSourceChooser(BuildContext context,
      {required Function(ImageSource) onTapCam, required Function(ImageSource) onTapGallery,}) {
    showModalBottomSheet(
        useRootNavigator: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.radius16),
          ),
        ),
        context: context,
        builder: (_) => Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              AppLines.bottomSheetTopLine(),

              GestureDetector(
                onTap: (){
                  Get.back();
                  onTapCam(ImageSource.camera);
                },
                child: Row(
                  children: [
                     Icon(Icons.camera_alt, size: Dimensions.radius24,  color: AppColors.primaryColor),
                     8.horizontalSpace,
                    Expanded(
                      child: AppTexts.smallText(
                          text: 'Camera'),
                    ),
                  ],
                ),
              ),
              16.verticalSpace,
              GestureDetector(
                onTap: (){
                  Get.back();
                  onTapGallery(ImageSource.gallery);
                },
                child: Row(
                  children: [
                     Icon(Icons.photo_library_sharp, size: Dimensions.radius24, color: AppColors.primaryColor,),
                    8.horizontalSpace,
                    Expanded(
                      child: AppTexts.smallText(
                          text: 'Gallery'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  static filterBottomSheet (BuildContext context, {
    VoidCallback? onTapCancel,
    VoidCallback? onTapApply,
  }) {
    final controller = Get.find<ProductController>();
    showModalBottomSheet(
        useRootNavigator: true,
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.radius16),
          ),
        ),
        builder: (_) =>  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              AppLines.bottomSheetTopLine(),

              AppTexts.largeText(text: 'Filter', fontWeight: FontWeight.bold),
              16.verticalSpace,
              Row(
                children: <Widget>[
                  Obx(()=> AppButtons.checkBox(value: controller.selectedFilter == FilterProduct.priceLowToHigh,
                    onChanged: (value){
                      if(controller.selectedFilter != FilterProduct.priceLowToHigh){
                        controller.toggleFilterValue(FilterProduct.priceLowToHigh);
                      } else {
                        controller.toggleFilterValue(FilterProduct.none);
                      }

                    },),
                  ),
                  Expanded(child: AppTexts.mediumText(text: 'Price low > high')),
                ],
              ),
              10.verticalSpace,
              Row(
                children: <Widget>[
                  Obx(()=> AppButtons.checkBox(value: controller.selectedFilter == FilterProduct.priceHighToLow,
                    onChanged: (value){
                      if(controller.selectedFilter != FilterProduct.priceHighToLow){
                        controller.toggleFilterValue(FilterProduct.priceHighToLow);
                      } else {
                        controller.toggleFilterValue(FilterProduct.none);
                      }
                    },),
                  ),
                  Expanded(child: AppTexts.mediumText(text: 'Price high > low')),
                ],
              ),
              10.verticalSpace,
              Row(
                children: <Widget>[
                  Obx(()=> AppButtons.checkBox(value: controller.selectedFilter == FilterProduct.rating,
                    onChanged: (value){
                      if(controller.selectedFilter != FilterProduct.rating){
                        controller.toggleFilterValue(FilterProduct.rating);
                      } else {
                        controller.toggleFilterValue(FilterProduct.none);
                      }
                    },),
                  ),
                  Expanded(child: AppTexts.mediumText(text: 'Rating')),
                ],
              ),
              40.verticalSpace,
              Row(
                children: [
                  Expanded(child: AppButtons.buttonWithBg(text: 'Cancel', strokeColor: AppColors.buttonStroke, onTap: onTapCancel ?? () => Get.back(), textColor: AppColors.extraLightFontColor, bgColor: AppColors.white)),
                  10.horizontalSpace,
                  Expanded(child: AppButtons.buttonWithBg(text: 'Apply', onTap: (){
                    Get.back();
                    onTapApply?.call();
                  }, bgColor: AppColors.green)),
                ],
              )
            ],
          ),
        ));
  }
}