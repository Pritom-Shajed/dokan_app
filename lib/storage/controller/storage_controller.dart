import 'package:dokan_app/storage/storage.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {
  final StorageRepository _storageRepo;

  StorageController({required StorageRepository storageRepo}) : _storageRepo = storageRepo;


  Future<void> saveUserToken ({required String token}) async{
    await _storageRepo.saveUserToken(token: token);
  }

  String getUserToken () {
    return  _storageRepo.getUserToken();
  }

  bool isUserLoggedIn () {
    return  _storageRepo.isUserLoggedIn();
  }

  void clearData ()  {
    _storageRepo.clearData();
  }
}