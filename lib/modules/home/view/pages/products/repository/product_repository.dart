import 'dart:convert';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/services.dart';

class ProductRepository {


  Future loadProducts() async {
    final String response = await rootBundle.loadString(AppJsons.productJson);
    final json = await jsonDecode(response);

    return json;
  }
}