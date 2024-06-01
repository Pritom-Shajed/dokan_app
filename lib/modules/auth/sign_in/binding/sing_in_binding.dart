import 'package:dokan_app/modules/auth/auth.dart';
import 'package:get/get.dart';

class SingInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInRepository(apiClient: Get.find()));
    Get.put(SignInController(signInRepo: Get.find()));
  }
}