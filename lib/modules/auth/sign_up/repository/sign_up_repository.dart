import 'package:dokan_app/network/api/api_client.dart';
import 'package:dokan_app/network/network.dart';

class SignUpRepository {
  final ApiClient _apiClient;

  SignUpRepository({required ApiClient apiClient}) : _apiClient = apiClient;
}