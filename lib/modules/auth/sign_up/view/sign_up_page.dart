import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/modules/auth/auth.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<SignUpController>();

    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                  Obx(
                    () => AuthWidgets.dpWithEditButton(
                        imagePath: controller.pickedImagePath,
                        onTapPickImage: () => AppBottomSheets.imageSourceChooser(
                          context,
                          onTapCam: controller.pickImage,
                          onTapGallery: controller.pickImage,
                        )),
                  ),
                  52.verticalSpace,
                  AppTextFields.textFieldHintOnly(context,
                      hintText: 'Name',
                      controller: controller.nameController,
                      prefixIconSvgPath: AppSvgIcons.user,
                      validator: (name){
                        if(name == null || name.isEmpty){
                          return Strings.emptyTextField;
                        }
                        return null;
                      },
                  ),
                  24.verticalSpace,
                  AppTextFields.textFieldHintOnly(context,
                      hintText: 'Email',
                      controller: controller.emailController,
                      prefixIconSvgPath: AppSvgIcons.email,
                      validator: (email){
                        if(email == null || email.isEmpty){
                          return Strings.emptyTextField;
                        } else if(!AppRegex.isEmailValid(email)){
                          return Strings.emailNotValid;
                        }
                        return null;
                      },
                  ),
                  24.verticalSpace,
                Obx(() => AppTextFields.textFieldHintOnly(context,
                    hintText: 'Password',
                    controller: controller.passController,
                    obscureText: !controller.isPassVisible,
                    prefixIconSvgPath: AppSvgIcons.pass,
                    suffixIconSvgPath: controller.isPassVisible ? AppSvgIcons.eyeOpen : AppSvgIcons.eyeClosed,
                    onTapSuffixIcon: controller.tooglePassVisibility,
                    validator: (pass){
                      if(pass == null || pass.isEmpty){
                        return Strings.emptyTextField;
                      } else if(!AppRegex.isPassValid(pass)){
                        return Strings.passNotValid;
                      }
                      return null;
                    },
                ),),
                  24.verticalSpace,
               Obx(() =>    AppTextFields.textFieldHintOnly(context,
                   hintText: 'Confirm Password',
                   controller: controller.confirmPassController,
                   obscureText: !controller.isConfirmPassVisible,
                   prefixIconSvgPath: AppSvgIcons.pass,
                   suffixIconSvgPath: controller.isConfirmPassVisible ? AppSvgIcons.eyeOpen : AppSvgIcons.eyeClosed,
                   onTapSuffixIcon: controller.toogleConfirmPassVisibility,
                   validator: (pass){
                     if(pass == null || pass.isEmpty){
                       return Strings.emptyTextField;
                     } else if(pass != controller.passController.text){
                       return Strings.passMismatched;
                     }
                     return null;
                   },

               ),),
                  52.verticalSpace,

                AuthWidgets.footer(
                    isSignInPage: false,
                    onTapLoginOrSignUp: (){
                      if(controller.formKey.currentState!.validate()){

                      }
                    },
                    navigateToSignIn: () => Get.back())
              ],
            ),
          ),
        ),
      ),),
    );
  }
}
