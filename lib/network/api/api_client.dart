import 'dart:convert';
import 'dart:io';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import '../network.dart';

class ApiClient {
  final String baseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.baseUrl}) {
    _mainHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Future<http.Response> getRequest(String uri, {Map<String, String>? headers}) async {

    try {
      final response = await http.get(
        Uri.parse(baseUrl + uri),
        headers: headers ?? _mainHeaders,
      ).timeout(const Duration(seconds: 30));
      return response;
    } catch (e) {
      return http.Response(json.encode({'statusText': e.toString()}), 500);
    }
  }

  Future<http.Response> postRequest ({required String apiEndpoint, Map<String, String>? headers, Map<String, dynamic>? body}) async{

    try {
      final response = await http.post(
        Uri.parse(baseUrl + apiEndpoint),
        headers: headers ?? _mainHeaders,
        body: body
      ).timeout(const Duration(seconds: 30));
      return response;
    } catch (e) {
      return http.Response(json.encode({'statusText': e.toString()}), 500);
    }

  }

  Future<http.Response> putRequest ({required String apiEndpoint, Map<String, String>? headers, Map<String, dynamic>? body}) async{
    try {
      final response = await http.put(
          Uri.parse(baseUrl + apiEndpoint),
          headers: headers ?? _mainHeaders,
          body: body
      ).timeout(const Duration(seconds: 30));
      return response;
    } catch (e) {
      return http.Response(json.encode({'statusText': e.toString()}), 500);
    }
  }

  Future<http.Response> patchRequest ({required String apiEndpoint, Map<String, String>? headers, Map<String, dynamic>? body}) async{
    try {
      final response = await http.patch(
          Uri.parse(baseUrl + apiEndpoint),
          headers: headers ?? _mainHeaders,
          body: body
      ).timeout(const Duration(seconds: 30));
      return response;
    } catch (e) {
      return http.Response(json.encode({'statusText': e.toString()}), 500);
    }
  }


}