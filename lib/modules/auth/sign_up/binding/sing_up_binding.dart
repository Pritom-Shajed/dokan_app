import 'package:dokan_app/modules/auth/auth.dart';
import 'package:get/get.dart';

class SingUnBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpRepository(apiClient: Get.find()));
    Get.put(SignUpController(signUnRepo: Get.find()));
  }
}