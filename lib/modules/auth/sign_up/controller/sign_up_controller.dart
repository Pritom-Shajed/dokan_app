import 'dart:convert';
import 'package:dokan_app/models/models.dart';
import 'package:dokan_app/modules/auth/auth.dart';
import 'package:dokan_app/network/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final SignUpRepository _signUpRepo;

  SignUpController({required SignUpRepository signUnRepo}) : _signUpRepo = signUnRepo;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController confirmPassController;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    confirmPassController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.onClose();
  }


  final _pickedImagePath = ''.obs;

  String get pickedImagePath => _pickedImagePath.value;

  set pickedImagePath (value) => _pickedImagePath.value = value;

  Future<void> pickImage(ImageSource src) async {
    final imagePicker = ImagePicker();
    XFile? xfile = await imagePicker.pickImage(source: src);

    if(xfile != null){
      pickedImagePath = xfile.path;
    }
  }

  final _isPassVisible = false.obs;

  bool get isPassVisible => _isPassVisible.value;

  set isPassVisible(value) => _isPassVisible.value = value;

  final _isConfirmPassVisible = false.obs;

  bool get isConfirmPassVisible => _isConfirmPassVisible.value;

  set isConfirmPassVisible(value) => _isConfirmPassVisible.value = value;

  void toogleConfirmPassVisibility (){
    isConfirmPassVisible = !isConfirmPassVisible;
  }

  void tooglePassVisibility (){
    isPassVisible = !isPassVisible;
  }

  ///API CALLS

  Future<ResponseModel> signUp () async{
    try {
      final response = await _signUpRepo.signUp(body: {
        "username": nameController.text.trim(),
        "email": emailController.text.trim(),
        "password": passController.text.trim()
      });


      final apiResponseHandler = ApiResponseHandler(
        response, successCallback: (response) {

        var responseBody = json.decode(response.body);


        final successMsg = responseBody['message'];

        return ResponseModel(true, successMsg);
      },
      );

      return apiResponseHandler.handleResponse();
    } catch (e){
      return ResponseModel(false, e.toString());
    }
  }

}