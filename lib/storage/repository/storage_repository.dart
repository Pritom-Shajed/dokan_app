import 'package:dokan_app/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  final SharedPreferences _sharedPreferences;

  StorageRepository({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;

  // SAVING TOKEN TO CALL APIS THROUGHOUT THE APP AND TO MAKE USER STAY LOGGED IN
  Future<void> saveUserToken ({required String token}) async {
    await _sharedPreferences.setString(StorageConstants.TOKEN, token);
  }

  // SAVING EMAIL AS FETCHING USER INFO DOESN'T GIVES USER EMAIL TO SHOW
  Future<void> saveUserEmail ({required String email}) async {
    await _sharedPreferences.setString(StorageConstants.EMAIL, email);
  }

  String getUserEmail ()  {
    return _sharedPreferences.getString(StorageConstants.EMAIL) ?? '';
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