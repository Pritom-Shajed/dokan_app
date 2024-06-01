import 'package:dokan_app/components/global_widgets/global_widgets.dart';
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
        builder: (_) => Container(
          padding: REdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
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
}