import 'package:dokan_app/helper/helper.dart';
import 'package:dokan_app/network/network.dart';
import 'package:get/get.dart';

Future<void> init () async{
  //Api
  Get.lazyPut(() => ApiClient(baseUrl: Environment.baseApiUrl), fenix: true);

}