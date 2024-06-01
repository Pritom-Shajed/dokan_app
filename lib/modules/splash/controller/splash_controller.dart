import 'dart:developer';
import 'package:dokan_app/routes/pages/app_pages.dart';
import 'package:dokan_app/storage/storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onReady() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(milliseconds: 1500)).whenComplete(() {
      final isUserLoggedIn = Get.find<StorageController>().isUserLoggedIn();
      if(isUserLoggedIn){
        Get.offAllNamed(Routes.SIGN_IN);
      } else {
        Get.offAllNamed(Routes.SIGN_IN);
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.onClose();
  }
}