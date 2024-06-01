import 'package:dokan_app/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  final SharedPreferences _sharedPreferences;

  StorageRepository({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;



  Future<void> saveUserToken ({required String token}) async {
    await _sharedPreferences.setString(StorageConstants.TOKEN, token);
  }

  String getUserToken ()  {
    return _sharedPreferences.getString(StorageConstants.TOKEN) ?? '';
  }

  bool isUserLoggedIn ()  {
    final token = _sharedPreferences.getString(StorageConstants.TOKEN);
    if(token == null){
      return false;
    } else {
      return true;
    }
  }

  bool clearData() {
    _sharedPreferences.clear();
    return true;
  }
}