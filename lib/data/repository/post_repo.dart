import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:theblue_crown/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/models/place_order_model.dart';
import 'package:theblue_crown/models/post_model.dart';
import 'package:theblue_crown/utils/app_constants.dart';

import '../../models/place_post_model.dart';

class PostRepo {

  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  PostRepo({required this.sharedPreferences, required this.apiClient});

  List<String> postLength = [];

  Future<Response> placePost(int id, PlacePostBody createPost) async {
    print("The createPost object in createPost in PostRepo is  :::::::::::::::: " + createPost.toString());
    return await apiClient.postData(
      '/api/v1/post/comment/post-comment/$id',
      // AppConstants.PLACE_COMMENT_URI,
      createPost.toJson(),
    );
  }

  Future<Response> getPostList(productId) async {
    return await apiClient.getData(
      // '/api/v1/post/comment/get-all-comments/$productId'
      '${AppConstants.GET_ALL_COMMENTS_URI}''$productId',
    );
  }

  List<PostModel> getPostLength(id){
    if(sharedPreferences.containsKey('/api/v1/post/comment/get-all-comments/$id')){
      //cartHistory = [];
      postLength = sharedPreferences.getStringList('/api/v1/post/comment/get-all-comments/$id')!;
    }
    List<PostModel> getPostLength = [];
    postLength.forEach((element) => getPostLength.add(PostModel.fromJson(jsonDecode(element))));
    return getPostLength;
  }

}