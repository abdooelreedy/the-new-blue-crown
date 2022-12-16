import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theblue_crown/data/api/api_client.dart';
import 'package:theblue_crown/models/cart_model.dart';
import 'package:theblue_crown/models/products_model.dart';
import 'package:theblue_crown/utils/app_constants.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  List<String> recommended = [];

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
    // return await apiClient.getData(AppConstants.GRIDVIEWOFGATEGORY_URI);
  }

}