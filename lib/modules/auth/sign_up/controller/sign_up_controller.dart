import 'package:dokan_app/modules/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final SignUpRepository _signInRepo;

  SignUpController({required SignUpRepository signUnRepo}) : _signInRepo = signUnRepo;

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

}