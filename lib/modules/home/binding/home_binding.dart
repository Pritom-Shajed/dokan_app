import 'package:dokan_app/modules/home/home.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}