import 'package:dokan_app/network/api/api_client.dart';
import 'package:dokan_app/network/network.dart';

class SignInRepository {
  final ApiClient _apiClient;

  SignInRepository({required ApiClient apiClient}) : _apiClient = apiClient;
}