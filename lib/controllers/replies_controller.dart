import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:theblue_crown/data/repository/like_repo.dart';
import 'package:theblue_crown/data/repository/post_repo.dart';
import 'package:theblue_crown/data/repository/replies_repo.dart';
import 'package:theblue_crown/models/place_post_model.dart';
import 'package:theblue_crown/models/place_reply_model.dart';

import '../constance.dart';
import '../data/repository/order_repo.dart';
import '../models/comment_model.dart';
import '../models/order_model.dart';
import '../models/post_model.dart';
import '../models/replies_model.dart';

class RepliesController extends GetxController implements GetxService{

  RepliesRepo repliesRepo;
  LikeRepo likeRepo;

  RepliesController({
    required this.repliesRepo,
    required this.likeRepo
  });


  late List<RepliesModel> _currentRepliesList;
  List<RepliesModel> get currentRepliesList => _currentRepliesList;

  bool _isLoadingg = false;
  bool get isLoadingg => _isLoadingg;


  Rx<List<PostModel>> posts = Rx<List<PostModel>>([]);
  Rx<List<CommentModel>> comments = Rx<List<CommentModel>>([]);
  final isLoading = false.obs;
  final box = GetStorage();

  int _feedId = 1;
  int get feedId => _feedId;

  int _foodId = 1;
  int get foodId => _foodId;

  @override
  void onInit() {
    getReplies(feedId, foodId);
    super.onInit();
  }

  // Future createPost({required String content,}) async {
  //   try {
  //     var data = {'content': content,};
  //
  //     var response = await http.post(Uri.parse('${url}feed/store'),
  //       headers: {
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer ${box.read('token')}',
  //       },
  //       body: data,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       print(json.decode(response.body));
  //     } else {
  //       Get.snackbar(
  //         'Error in CreatePost',
  //         json.decode(response.body)['message'],
  //         snackPosition: SnackPosition.TOP,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     }
  //   } catch (e) {
  //     print("here in post_controller" + e.toString());
  //   }
  // }

  // Future<void> getAllPosts() async {
  //   _isLoadingg = true;
  //   Response response = await postRepo.getPostList();
  //   if(response.statusCode == 200){
  //     _currentPostList = [];
  //     _currentPostList.addAll(Autogenerated.fromJson(response.body).feeds);
  //   } else {    _currentPostList = [];    }
  //   _isLoadingg = false;
  //   update();
  // }

  Future<void> getReplies(int feedId, int foodId) async {
    _isLoadingg = true;

    Response response = await repliesRepo.getRepliesList(feedId, foodId);
    if(response.statusCode == 200){
      _currentRepliesList = [];
      _currentRepliesList.addAll(SingleReply.fromJson(response.body).comments);
      print("The length of current Replies 3 :::::::::::::::: " + _currentRepliesList.length.toString());
    } else {
      _currentRepliesList = [];
    }
    _isLoadingg = false;
    update();
  }

  // Future<int> getReplies2(int id) async {
  //   _isLoadingg = true;
  //
  //   Response response = await repliesRepo.getRepliesList(id);
  //   if(response.statusCode == 200){
  //     _currentRepliesList = [];
  //     _currentRepliesList.addAll(SingleReply.fromJson(response.body).comments);
  //
  //     print("The length of current Replies 3 :::::::::::::::: " + _currentRepliesList.length.toString());
  //   } else {
  //     _currentRepliesList = [];
  //   }
  //   int length = _currentRepliesList.length;
  //   _isLoadingg = false;
  //   update();
  //   return length;
  // }

  // Future getComments(id) async {
  //   try {
  //     comments.value.clear();
  //     isLoading.value = true;
  //
  //     var response = await http.get(
  //       Uri.parse('${url}feed/comments/$id'),
  //       headers: {
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer ${box.read('token')}',
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       isLoading.value = false;
  //       final content = json.decode(response.body)['comments'];
  //       for (var item in content) {
  //         comments.value.add(CommentModel.fromJson(item));
  //       }
  //     } else {
  //       isLoading.value = false;
  //       print(json.decode(response.body));
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }


  // Future<void> placePost(PlacePostBody content) async {
  //
  //   _isLoadingg = true;
  //
  //   await postRepo.placePost(content);
  // }

  Future<void> placeReply(int id, PlaceReplyBody body) async {

    _isLoadingg = true;

    await repliesRepo.placeReplies(id, body);
  }

  // Future createComment(id, body) async {
  //   try {
  //     isLoading.value = true;
  //     var data = {
  //       'body': body,
  //     };
  //
  //     var request = await http.post(
  //       Uri.parse('${url}feed/comment/$id'),
  //       headers: {
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer ${box.read('token')}',
  //       },
  //       body: data,
  //     );
  //
  //     if (request.statusCode == 200) {
  //       isLoading.value = false;
  //       print(json.decode(request.body));
  //     } else {
  //       isLoading.value = false;
  //       print(json.decode(request.body));
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  /*Future<void> placePost(PlacePostBody content) async {

    _isLoadingg = true;

    Response response = await postRepo.placePost(content);
    }*/

  Future placeLikeAndDislike(id, index) async {
    // try {
    //   isLoading.value = true;
    //   var request = await http.post(
    //     Uri.parse('${url}post/comment/like/$id'),
    //     headers: {
    //       'Accept': 'application/json',
    //       'Authorization': 'Bearer ${box.read('token')}',
    //     },
    //   );
    Response response = (await likeRepo.placeLike(id, index)) as Response;
    // String message = response.body.toString();
    // print("json.decode(response.body)                                  " + response.body.toString());
    // return message;
    print("I think the problem from here 2 :::::::::::: /////////////////////////////////// ::: " + response.body.toString());
    if (response.statusCode == 200 || response.body['message'] == 'liked') {
      print("I think the problem from here 3 :::::::::::: /////////////////////////////////// ::: " + response.statusCode.toString());
      _isLoadingg = false;
      print(response.body);

    } else if (response.statusCode == 200 || response.body['message'] == 'Unliked') {

      _isLoadingg = false;
      print(response.body);

    } else {

      _isLoadingg = false;
      print(response.body);

    }
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}