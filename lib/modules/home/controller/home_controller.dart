import 'package:dokan_app/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final _isProductsTapped = true.obs;

  get isProductsTapped => _isProductsTapped.value;

  set isProductsTapped(value) {
    _isProductsTapped.value = value;
  }

  final _isProfileTapped = false.obs;

  get isProfileTapped => _isProfileTapped.value;

  set isProfileTapped(value) {
    _isProfileTapped.value = value;
  }

  final Rx<Widget> _currentScreen = Rx<Widget>(const ProductsPage());

  get currentScreen => _currentScreen.value;

  set currentScreen (value) => _currentScreen.value = value;

  productsTap() {
    isProductsTapped = true;
    isProfileTapped = false;
    currentScreen = const ProductsPage();
  }

  profileTap() {
    isProfileTapped = true;
    isProductsTapped = false;
    currentScreen = const ProfilePage();
  }


}