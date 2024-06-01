import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/modules/home/controller/home_controller.dart';
import 'package:dokan_app/modules/home/home.dart';
import 'package:dokan_app/utils/constants/app_icons/app_icons.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final PageStorageBucket pageBucket = PageStorageBucket();
    DateTime timeBackPressed = DateTime.now();

    return Scaffold(
      body: WillPopScope(
          onWillPop: () async {
              if(controller.isProductsTapped){
                final difference = DateTime.now().difference(timeBackPressed);
                final isExitWarning = difference >= const Duration(seconds: 2);

                timeBackPressed = DateTime.now();

                if (isExitWarning) {
                  AppToasts.shortToast(Strings.exitApp, gravity: ToastGravity.CENTER);
                } else {
                  SystemNavigator.pop();
                }
              } else {
                controller.productsTap();
              }
            return false;
          },
          child: Obx(() => PageStorage(bucket: pageBucket, child: controller.currentScreen))),
      floatingActionButton: FloatingActionButton(onPressed: () {}, backgroundColor: AppColors.primaryColor, child: AppIconWidgets.svgAssetIcon(iconPath: AppSvgIcons.search),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(() => HomeWidgets.bottomNavBar(
          isProductsTapped: controller.isProductsTapped,
          onTapProducts: controller.productsTap,
          isProfileTapped: controller.isProfileTapped,
          onTapProfile: controller.profileTap,
      )),
    );
  }
}
