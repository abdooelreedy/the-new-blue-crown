import 'package:theblue_crown/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/models/place_like_model.dart';
import 'package:theblue_crown/models/place_order_model.dart';
import 'package:theblue_crown/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/place_post_model.dart';

class LikeRepo {

  final ApiClient apiClient;

  LikeRepo({required this.apiClient});

/* Future<Response> placeLike ( newIndex,  commentId) async {

    return await apiClient.postData(
      '/api/v1/post/comment/like/$newIndex',
      // '/api/v1/post/comment/like/3',
      // AppConstants.PLACE_POST_URI,
      commentId.toJson(),
    );*/
  Future<Response> placeProductLike ( newIndex,  commentId) async {

    return await apiClient.postData(
      '/api/v1/post/comment/productLike/$newIndex',
      // '/api/v1/post/comment/like/3',
      // AppConstants.PLACE_POST_URI,
      commentId.toJson(),
    );
  }

  // Future<Response> placeLike(PlaceLikeBody commentId, int index) async {
  //   // print("The commentId object in placeLike in LikeRepo is  :::::::::::::::: " + commentId.toString());
  //   // String id = (index - 1).toString();
  //   // print("String id is  :::::::::::::::: " + id);
  //   return await apiClient.postData(
  //     // '/api/v1/post/comment/like/$commentId',
  //     '/api/v1/post/comment/like/2',
  //     // AppConstants.PLACE_LIKE_URI + '/' + '1',
  //     commentId.toJson(),
  //   );
  // }

  // Future<Response> placeReplies (PlaceReplyBody createReply, int id) async {
  //   print("The createReply object in placeReplies in RepliesRepo is  :::::::::::::::: " + createReply.toString());
  //   return await apiClient.postData(
  //     '/api/v1/post/comment/comment/$id',
  //     // AppConstants.PLACE_POST_URI,
  //     createReply.toJson(),
  //   );
  // }


  Future<Response> placeLike ( newIndex,  commentId) async {

    return await apiClient.postData(
      '/api/v1/post/comment/like/$newIndex',
      // '/api/v1/post/comment/like/3',
      // AppConstants.PLACE_POST_URI,
      commentId.toJson(),
    );



    // return await apiClient.postLike(
    //   newIndex,
    //   // '/api/v1/post/comment/like/$commentId',
    //   // '/api/v1/post/comment/like/3',
    //   // AppConstants.PLACE_POST_URI,
    //   // commentId.toJson(),
    // );



    // late String token;
    // token = AppConstants.TOKEN;
    //
    // return await http.post(
    //     Uri.parse('http://192.168.1.6:8000/api/v1/post/comment/comments/$commentId'),
    //     headers: {
    //       'Content-type' : 'application/json; charset=UTF-8',
    //       'Authorization' : 'Bearer $token',
    //       // 'Connection' : 'Keep-Alive',
    //       // "HttpHeaders.contentTypeHeader": "application/json",
    //       "Accept": "application/json"
    //     }
    // );

  }

}