import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/helper/extensions/build_context_extensions.dart';
import 'package:dokan_app/modules/auth/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dokan_app/routes/pages/app_pages.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();
    return Scaffold(
      body: SafeArea(child:
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                24.verticalSpace,
                AppIconWidgets.svgAssetIcon(iconPath: AppSvgIcons.appLogo, size: Dimensions.radius50),

                80.verticalSpace,

                AppTexts.extraLargeText(text: 'Sign In', fontWeight: FontWeight.bold),

                52.verticalSpace,
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
                Obx(
                  () => AppTextFields.textFieldHintOnly(context,
                      hintText: 'Password',
                      controller: controller.passController,
                      prefixIconSvgPath: AppSvgIcons.pass,
                      obscureText: !controller.isPassVisible,
                      suffixIconSvgPath: controller.isPassVisible ? AppSvgIcons.eyeOpen : AppSvgIcons.eyeClosed,
                      onTapSuffixIcon: controller.tooglePassVisibility,
                      validator: (pass){
                        if(pass == null || pass.isEmpty){
                          return Strings.emptyTextField;
                        }
                        return null;
                      },
                  ),
                ),
                24.verticalSpace,
                Align(
                    alignment: Alignment.centerRight,
                    child: AppButtons.textButton(onTap: ()=> AppToasts.shortToast(Strings.notAvailable),text: 'Forget password?', color: AppColors.extraLightFontColor)),

                52.verticalSpace,

                AuthWidgets.footer(
                    isSignInPage: true,
                    onTapLoginOrSignUp: (){
                      FocusManager.instance.primaryFocus?.unfocus();
                      if(controller.formKey.currentState!.validate()){
                        context.showLoaderOverlay;
                        controller.signIn().then((response){
                          if(response.isSuccess){
                            context.hideLoaderOverlay;
                            AppToasts.shortToast(response.message, gravity: ToastGravity.CENTER);
                            Get.offAllNamed(Routes.HOME);
                          } else {
                            context.hideLoaderOverlay;
                            AppToasts.longToast(response.message);
                          }
                        });
                      }
                    },
                    navigateToSignUp: () => Get.toNamed(Routes.SIGN_UP))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
