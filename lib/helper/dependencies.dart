import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theblue_crown/controllers/auth_controller.dart';
import 'package:theblue_crown/controllers/cart_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/category_lists/category_list_view_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/galaxy_texapon_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/grid_view_of_sections_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/malaysia_texapon_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/renotex_texapon_controller.dart';
import 'package:theblue_crown/controllers/language_controller.dart';
import 'package:theblue_crown/controllers/image_controller.dart';
import 'package:theblue_crown/controllers/location_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/popular_product_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/recommended_product_controller.dart';
import 'package:theblue_crown/controllers/post_controller.dart';
import 'package:theblue_crown/controllers/replies_controller.dart';
import 'package:theblue_crown/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/data/repository/auth_repo.dart';
import 'package:theblue_crown/data/repository/cart_repo.dart';
import 'package:theblue_crown/data/repository/location_repo.dart';
import 'package:theblue_crown/data/repository/post_repo.dart';
import 'package:theblue_crown/data/repository/replies_repo.dart';
import 'package:theblue_crown/data/repository/repo_lists/category_lists/category_list_view_repo.dart';
import 'package:theblue_crown/data/repository/repo_lists/category_lists/category_of_texapon_list_view_repo.dart';
import 'package:theblue_crown/data/repository/repo_lists/product_grids/galaxy_texapon_repo.dart';
import 'package:theblue_crown/data/repository/repo_lists/grid_view_of_sections_repo.dart';
import 'package:theblue_crown/data/repository/repo_lists/product_grids/malaysia_texapon_repo.dart';
import 'package:theblue_crown/data/repository/repo_lists/product_grids/recommended_product_repo.dart';
import 'package:theblue_crown/data/repository/repo_lists/product_grids/renotex_texapon_repo.dart';
import 'package:theblue_crown/data/repository/repo_lists/category_lists/taylos_category_list_view_repo.dart';
import 'package:theblue_crown/data/repository/repo_lists/sub_section_grids/vcosity_enhancers_sub_section_repo.dart';
import 'package:theblue_crown/data/repository/user_repo.dart';
import 'package:theblue_crown/models/language_model.dart';
import 'package:theblue_crown/utils/app_constants.dart';
import '../controllers/controller_lists/category_lists/category_of_texapon_list_view_controller.dart';
import '../controllers/controller_lists/category_lists/taylos_category_list_view_controller.dart';
import '../controllers/controller_lists/product_grids/el_momtaz_labsa_controller.dart';
import '../controllers/controller_lists/sub_section_grids/grid_view_of_category_controller.dart';
import '../controllers/controller_lists/sub_section_grids/viscosity_enhancers_sub_section_controller.dart';
import '../controllers/controller_lists/product_grids/super_el_momtaz_labsa_controller.dart';
import '../controllers/order_controller.dart';
import '../controllers/user_controller.dart';
import '../data/repository/like_repo.dart';
import '../data/repository/order_repo.dart';
import '../data/repository/repo_lists/product_grids/el_momtaz_labsa_repo.dart';
import '../data/repository/repo_lists/sub_section_grids/grid_view_of_category_repo.dart';
import '../data/repository/repo_lists/product_grids/popular_product_repo.dart';
import '../data/repository/repo_lists/product_grids/super_el_momtaz_labsa_repo.dart';

Future<Map<String, Map<String, String>>> init() async {

  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(()=>AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(()=>UserRepo(apiClient: Get.find()));

  //repos
  // Section Grid
  Get.lazyPut(() => GridViewOfSectionsRepo(apiClient: Get.find()));

  // SubSection Grids
  Get.lazyPut(() => GridViewOfCategoryRepo(apiClient: Get.find()));
  Get.lazyPut(() => ViscosityEnhancersSubSectionRepo(apiClient: Get.find()));

  // Category Lists
  Get.lazyPut(() => CategoryListViewRepo(apiClient: Get.find()));
  Get.lazyPut(() => CategoryOfTexaponListViewRepo(apiClient: Get.find()));
  Get.lazyPut(() => TaylosCategoryListViewRepo(apiClient: Get.find()));

  // Product Grids
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => ElMomtazLabsaRepo(apiClient: Get.find()));
  Get.lazyPut(() => SuperElMomtazLabsaRepo(apiClient: Get.find()));
  Get.lazyPut(() => GalaxyTexaponRepo(apiClient: Get.find()));
  Get.lazyPut(() => RenotexTexaponRepo(apiClient: Get.find()));
  Get.lazyPut(() => MalaysiaTexaponRepo(apiClient: Get.find()));

  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => OrderRepo(apiClient: Get.find()));
  Get.lazyPut(() => OrderRepo(apiClient: Get.find()));
  Get.lazyPut(() => PostRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => LikeRepo(apiClient: Get.find()));
  Get.lazyPut(() => RepliesRepo(apiClient: Get.find()));

  //controllers
  // Section Grid
  Get.lazyPut(() => GridViewOfSectionsController(gridViewOfSectionsRepo: Get.find()));

  // SubSection Grids
  Get.lazyPut(() => GridViewOfCategoryController(gridViewOfCategoryRepo: Get.find()));
  Get.lazyPut(() => ViscosityEnhancersSubSectionController(viscosityEnhancersSubSectionRepo: Get.find()));

  // Category Lists
  Get.lazyPut(() => CategoryListViewController(categoryListViewRepo: Get.find()));
  Get.lazyPut(() => CategoryOfTexaponListViewController(categoryOfTexaponListViewRepo: Get.find()));
  Get.lazyPut(() => TaylosCategoryListViewController(taylosCategoryListViewRepo: Get.find()));

  // Product Grids
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => ElMomtazLabsaController(elMomtazLabsaRepo: Get.find()));
  Get.lazyPut(() => SuperElMomtazLabsaController(superElMomtazLabsaRepo: Get.find()));
  Get.lazyPut(() => GalaxyTexaponController(galaxyTexaponRepo: Get.find()));
  Get.lazyPut(() => RenotexTexaponController(renotexTexaponRepo: Get.find()));
  Get.lazyPut(() => MalaysiaTexaponController(malaysiaTexaponRepo: Get.find()));

  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()),);
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
  Get.lazyPut(() => ImageController());
  Get.lazyPut(() => OrderController(orderRepo: Get.find()));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => PostController(postRepo: Get.find(), orderRepo: Get.find(), likeRepo: Get.find(), repliesRepo: Get.find(), productId: Get.put(22)));
  Get.lazyPut(() => RepliesController(likeRepo: Get.find(), repliesRepo: Get.find()));

  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();
  for(LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle.loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();

    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
      // print("${_json[key]}");
    });
    // en_US ar_EG
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] = _json;
  }
  return _languages;
}