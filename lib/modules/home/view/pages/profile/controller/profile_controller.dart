import 'dart:convert';
import 'package:dokan_app/models/models.dart';
import 'package:dokan_app/modules/home/home.dart';
import 'package:dokan_app/modules/home/view/pages/profile/profile.dart';
import 'package:dokan_app/network/api/api.dart';
import 'package:dokan_app/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final ProfileRepository _profileRepo;

  ProfileController({required ProfileRepository profileRepo}) : _profileRepo = profileRepo;

  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passController;
  final GlobalKey<FormState> formKeyEmailName = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyPass = GlobalKey<FormState>();

  @override
  void onInit() {
    emailController = TextEditingController(text: Get.find<StorageController>().getUserEmail());
    nameController = TextEditingController();
    passController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    passController.dispose();
    super.onClose();
  }

  /// API CALLING
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set isLoading(value) => _isLoading.value = value;

  /// LOADING USER INFO

  final _userInfo = Rxn<UserInfo>();

  UserInfo? get userInfo => _userInfo.value;

  set userInfo(value) => _userInfo.value = value;

  Future<ResponseModel> fetchUserInfo () async{
    isLoading = true;
    try {
      final response = await _profileRepo.fetchUserInfo();


      final apiResponseHandler = ApiResponseHandler(
        response, successCallback: (response) {

        var responseBody = json.decode(response.body);

        userInfo = UserInfo.fromJson(responseBody);

        nameController.text = userInfo?.name ?? '';


        return ResponseModel(true, 'Successfully fetched');
      },
      );
      isLoading = false;
      return apiResponseHandler.handleResponse();
    } catch (e){
      isLoading = false;
      return ResponseModel(false, e.toString());
    }
  }

  /// UPDATING USER INFO

  Future<ResponseModel> updateEmailAndName ({required int userId}) async{

    try {
      final response = await _profileRepo.updateUserInfo(userId: userId, body: {
        "email": emailController.text.trim(),
        "name": nameController.text.trim()
      });


      final apiResponseHandler = ApiResponseHandler(
        response, successCallback: (response) {

        Get.find<StorageController>().saveUserEmail(email: emailController.text.trim());

        return ResponseModel(true, 'Successfully updated');
      },
      );
      return apiResponseHandler.handleResponse();
    } catch (e){
      return ResponseModel(false, e.toString());
    }
  }

  Future<ResponseModel> updatePass ({required int userId}) async{

    try {
      final response = await _profileRepo.updateUserInfo(userId: userId, body: {
        "password": passController.text.trim(),
      });


      final apiResponseHandler = ApiResponseHandler(
        response, successCallback: (response) {
          passController.clear();

        return ResponseModel(true, 'Successfully updated');
      },
      );
      return apiResponseHandler.handleResponse();
    } catch (e){
      return ResponseModel(false, e.toString());
    }
  }
}