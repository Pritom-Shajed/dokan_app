import 'dart:convert';
import 'dart:developer';

import 'package:dokan_app/models/models.dart';
import 'package:dokan_app/modules/auth/auth.dart';
import 'package:dokan_app/network/api/api.dart';
import 'package:dokan_app/storage/controller/storage_controller.dart';
import 'package:dokan_app/utils/constants/constants.dart';
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


  ///API CALLS

  Future<ResponseModel> signIn () async{
    try {
      final response = await _signInRepo.signIn(body: {
        "username": emailController.text.trim(),
        "password": passController.text.trim()
      });


      final apiResponseHandler = ApiResponseHandler(
        response, successCallback: (response) {

         var responseBody = json.decode(response.body);

         Get.find<StorageController>().saveUserToken(token: responseBody['token']);
         Get.find<StorageController>().saveUserEmail(email: emailController.text.trim());

        return ResponseModel(true, Strings.welcome);
      },
      );

      return apiResponseHandler.handleResponse();
    } catch (e){
      return ResponseModel(false, e.toString());
    }
  }

}