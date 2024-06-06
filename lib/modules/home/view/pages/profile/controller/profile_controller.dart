import 'dart:convert';
import 'package:dokan_app/models/models.dart';
import 'package:dokan_app/modules/home/home.dart';
import 'package:dokan_app/modules/home/view/pages/profile/profile.dart';
import 'package:dokan_app/network/api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final ProfileRepository _profileRepo;

  ProfileController({required ProfileRepository profileRepo}) : _profileRepo = profileRepo;

  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passController;

  @override
  void onInit() {
    emailController = TextEditingController();
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

  /// LOADING USER INFO
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set isLoading(value) => _isLoading.value = value;

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
}