import 'package:dokan_app/network/api/api_client.dart';
import 'package:dokan_app/network/network.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class SignInRepository {
  final ApiClient _apiClient;

  SignInRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<http.Response> signIn ({required Map<String, dynamic> body}) async{
    return await _apiClient.postRequest(ApiEndpoints.loginUrl, body: body);
  }
}