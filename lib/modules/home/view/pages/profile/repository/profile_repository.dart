import 'package:dokan_app/network/api/api.dart';
import 'package:dokan_app/network/api/api_client.dart';
import 'package:dokan_app/utils/constants/api_endpoints/api_endpoints.dart';
import 'package:http/http.dart' as http;

class ProfileRepository {
  
  final ApiClient _apiClient;
  
  ProfileRepository({required ApiClient apiClient}) : _apiClient = apiClient;


  Future<http.Response> fetchUserInfo() async {
    return await _apiClient.getRequest(ApiEndpoints.userInfo);
  }
}