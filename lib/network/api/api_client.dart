import 'dart:convert';
import 'dart:developer';
import 'package:dokan_app/storage/controller/storage_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.baseUrl}) {
    final savedToken = Get.find<StorageController>().getUserToken();
    _mainHeaders = {
      'Content-Type':'application/json',
      'Authorization': savedToken.isNotEmpty ? 'Bearer $savedToken' : '',
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

  Future<http.Response> postRequest (String url, { Map<String, String>? headers, Map<String, dynamic>? body}) async{
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        headers: headers ?? _mainHeaders,
        body: jsonEncode(body)
      ).timeout(const Duration(seconds: 30));
      return response;
    } catch (e) {
      return http.Response(json.encode({'statusText': e.toString()}), 500);
    }

  }

  Future<http.Response> putRequest (String url, {Map<String, String>? headers, Map<String, dynamic>? body}) async{
    try {
      final response = await http.put(
          Uri.parse(baseUrl + url),
          headers: headers ?? _mainHeaders,
          body: jsonEncode(body)
      ).timeout(const Duration(seconds: 30));
      return response;
    } catch (e) {
      return http.Response(json.encode({'statusText': e.toString()}), 500);
    }
  }

  Future<http.Response> patchRequest (String url, {Map<String, String>? headers, Map<String, dynamic>? body}) async{
    try {
      final response = await http.patch(
          Uri.parse(baseUrl + url),
          headers: headers ?? _mainHeaders,
          body: jsonEncode(body)
      ).timeout(const Duration(seconds: 30));
      return response;
    } catch (e) {
      return http.Response(json.encode({'statusText': e.toString()}), 500);
    }
  }


}