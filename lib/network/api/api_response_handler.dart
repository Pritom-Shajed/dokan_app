import 'dart:convert';
import 'package:dokan_app/models/models.dart';
import 'package:dokan_app/network/network.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:get/get.dart';

class ApiResponseHandler {
  final Response _response;
  final Function(Response) _successCallback;

  ApiResponseHandler(this._response, {Function(Response)? successCallback})
      : _successCallback = successCallback ?? _handleSuccess;

  Future<ResponseModel> handleResponse() async{
    late ResponseModel responseModel;

    if (!await NetworkChecker.hasInternet) {
      responseModel = _handleNetworkError();
    } else {
      switch (_response.statusCode) {
        case 200:
          responseModel = _successCallback(_response);
          break;
        case 400:
        case 401:
        case 403:
        case 404:
        case 422:
          responseModel = _handleClientError(_response.statusCode!);
          break;
        case 500:
          responseModel = _handleServerError();
          break;
        default:
          responseModel = _handleUnknownError();
          break;
      }
    }


    return responseModel;
  }

  static ResponseModel _handleSuccess(Response response) {
    var responseJson = json.decode(response.body);
    var msg = responseJson['message'];
    return ResponseModel(true, msg);
  }

  ResponseModel _handleClientError(int statusCode) {
    late String errorMsg;
    switch(statusCode){
      case 400:
        errorMsg = Strings.error400;
        break;
      case 401:
        errorMsg = Strings.error401;
        break;
      case 403:
        errorMsg = Strings.error403;
        break;
      case 404:
        errorMsg = Strings.error404;
        break;
      case 422:
        errorMsg = Strings.error422;
        break;
      default:
        errorMsg = Strings.unknownError;
        break;
    }


    if (_response.body.isNotEmpty) {
      var responseJson = _response.body;
      if (json.decode(responseJson)['message'] != null) {
        errorMsg = json.decode(responseJson)['message'];
      }
    }

    return ResponseModel(false, errorMsg);
  }

  ResponseModel _handleServerError() {
    String errorMsg = Strings.error500;
    if (_response.body.isNotEmpty) {
      var responseJson = _response.body;
      if (json.decode(responseJson)['message'] != null) {
        errorMsg = json.decode(responseJson)['message'];
      }
    }
    return ResponseModel(false, errorMsg);
  }

  ResponseModel _handleNetworkError() {
    return ResponseModel(false, Strings.noInternet);
  }

  ResponseModel _handleUnknownError() {
    return ResponseModel(false, Strings.unknownError);
  }
}
