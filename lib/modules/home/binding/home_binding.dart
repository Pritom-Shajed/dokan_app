import 'package:dokan_app/modules/home/home.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);

    //Product
    Get.lazyPut<ProductRepository>(()=>ProductRepository(), fenix: true);
    Get.lazyPut<ProductController>(()=>ProductController(productRepo: Get.find()), fenix: true);
  }
}