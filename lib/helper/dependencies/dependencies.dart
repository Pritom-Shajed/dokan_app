import 'package:dokan_app/helper/helper.dart';
import 'package:dokan_app/network/network.dart';
import 'package:dokan_app/storage/storage.dart';
import 'package:get/get.dart';

Future<void> init () async{
  //Api
  Get.lazyPut(() => ApiClient(baseUrl: Environment.baseApiUrl), fenix: true);

  //Storage
  Get.lazyPut(() => StorageRepository(sharedPreferences:  Get.find()), fenix: true);
  Get.lazyPut(() => StorageController(storageRepo:  Get.find()), fenix: true);

}