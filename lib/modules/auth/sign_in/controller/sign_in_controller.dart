import 'package:dokan_app/modules/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final SignInRepository _signInRepo;

  SignInController({required SignInRepository signInRepo}) : _signInRepo = signInRepo;


  late TextEditingController emailController;
  late TextEditingController passController;
  final formKey = GlobalKey<FormState>();

  final _isPassVisible = false.obs;

  bool get isPassVisible => _isPassVisible.value;

  set isPassVisible(value) => _isPassVisible.value = value;

  void tooglePassVisibility (){
    isPassVisible = !isPassVisible;
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }

}