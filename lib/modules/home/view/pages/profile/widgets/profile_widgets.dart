import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/models/models.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileWidgets {
  ProfileWidgets._();

  static Widget profileHeader ({required String name, required String email, required String userImageLink}){
    return  Column(
      children: [

        // AVATAR
        DottedBorder(
          borderType: BorderType.Circle,
          dashPattern: const [2, 4],
          padding: REdgeInsets.all(8),
          color: AppColors.pink,
          child: CachedNetworkImage(
            imageUrl: userImageLink,
            imageBuilder:
                (context, imageProvider) =>
                CircleAvatar(
                  radius: Dimensions.radius70,
                  backgroundColor: AppColors.greyColor.withOpacity(0.2),
                  backgroundImage: imageProvider,
                ),
            placeholder: (context, url) => Skeletonizer(
              enabled: true,
              child: CircleAvatar(
                radius: Dimensions.radius70,
                backgroundColor: AppColors.greyColor.withOpacity(0.2),
                backgroundImage: NetworkImage(AppPngIcons.placeHolder),
              ),
            ),
            errorWidget: (context, url, error)
            =>  CircleAvatar(
              radius: Dimensions.radius70,
              backgroundColor: AppColors.greyColor.withOpacity(0.2),
              backgroundImage: AssetImage(AppPngIcons.placeHolder),
            ),
          ),
        ),

        60.verticalSpace,

        // NAME AND EMAIL
        AppTexts.extraLargeText(text: name, fontWeight: FontWeight.bold),
        AppTexts.mediumText(text: email, color: AppColors.lightFontColor),
      ],
    );
  }

  static Widget options (BuildContext context, {GlobalKey<FormState>? formKeyEmailName, GlobalKey<FormState>? formKeyPass,TextEditingController? emailController, TextEditingController? nameController, TextEditingController? passController, VoidCallback? onTapEmailSave, VoidCallback? onTapPassSave}){
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
              isLast: option.isLast,
              expandedContent: index == 0 ? Form(
                key: formKeyEmailName,
                child: Column(
                  children: [
                    AppTextFields.textFieldWithTitle(context, title: 'Email', controller: emailController,
                        validator: (email){
                          if(email == null || email.isEmpty) {
                            return Strings.emptyTextField;
                          } else if(!AppRegex.isEmailValid(email)){
                            return Strings.emailNotValid;
                          }
                          return null;
                        }
                    ),
                    AppTextFields.textFieldWithTitle(context, title: 'Name', controller: nameController,
                        validator: (name){
                          if(name == null || name.isEmpty) {
                            return Strings.emptyTextField;
                          }
                          return null;
                        }
                    ),
                    6.verticalSpace,
                    AppButtons.buttonWithBg(text: 'Save', onTap: onTapEmailSave),
                  ],
                ),
              ) : index == 1 ? Form(
                key: formKeyPass,
                child: Column(
                  children: [
                    AppTextFields.textFieldWithTitle(context, title: 'Password', controller: passController, obscureText: true,
                      validator: (pass){
                        if(pass == null || pass.isEmpty) {
                          return Strings.emptyTextField;
                        }
                        return null;
                      }
                    ),
                    6.verticalSpace,
                    AppButtons.buttonWithBg(text: 'Save', onTap: onTapPassSave),
                  ],
                ),
              ) : AppTexts.mediumText(text: Strings.notAvailable));
        }),
      ),
    );
  }
}