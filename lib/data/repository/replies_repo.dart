import 'package:theblue_crown/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/models/place_order_model.dart';
import 'package:theblue_crown/models/place_reply_model.dart';
import 'package:theblue_crown/utils/app_constants.dart';

import '../../models/place_post_model.dart';

class RepliesRepo {

  final ApiClient apiClient;

  RepliesRepo({required this.apiClient});

  Future<Response> placeReplies (int id, PlaceReplyBody createReply) async {
    print("The createReply object in placeReplies in RepliesRepo is  :::::::::::::::: " + createReply.toString());
    return await apiClient.postData(
      '/api/v1/post/comment/post-reply/$id',
      // AppConstants.PLACE_POST_URI,
      createReply.toJson(),
    );
  }

  Future<Response> getRepliesList(int feedId, int foodId) async {
    // var endpoint = AppConstants.REPLIES_URI;

    return await apiClient.getData(
        '/api/v1/post/comment/get-all-replies/$feedId/$foodId',
        // '$endpoint' '?id=$id'
        // AppConstants.REPLIES_URI
    );
  }

}