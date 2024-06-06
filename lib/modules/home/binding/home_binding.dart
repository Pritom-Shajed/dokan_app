import 'package:dokan_app/modules/home/home.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);

    //Product
    Get.lazyPut<ProductRepository>(()=>ProductRepository(), fenix: true);
    Get.lazyPut<ProductController>(()=>ProductController(productRepo: Get.find()), fenix: true);

    //Profile
    Get.lazyPut<ProfileRepository>(()=>ProfileRepository(apiClient: Get.find()), fenix: true);
    Get.lazyPut<ProfileController>(()=>ProfileController(profileRepo: Get.find()), fenix: true);
  }
}