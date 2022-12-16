import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/el_momtaz_labsa_controller.dart';
import 'package:theblue_crown/controllers/replies_controller.dart';
import 'package:theblue_crown/models/place_like_model.dart';
import 'package:theblue_crown/models/place_post_model.dart';
import 'package:theblue_crown/models/post_model.dart';
import 'package:theblue_crown/pages/home/reply_page.dart';
import 'package:theblue_crown/routes/route_helper.dart';
import 'package:theblue_crown/utils/app_constants.dart';
import 'package:theblue_crown/utils/dimensions.dart';
import 'package:theblue_crown/widgets/app_text_field.dart';

import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/post_controller.dart';
import '../../widgets/custom_big_text.dart';
import '../../widgets/custom_small_text.dart';
import '../../widgets/post_data.dart';
import '../../widgets/post_field.dart';

class CommentPage extends StatefulWidget {

  var productId;

  CommentPage({
    Key? key,
    required this.productId
  }) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {

  final PostController _postController = Get.put(PostController(postRepo: Get.find(), orderRepo: Get.find(), likeRepo: Get.find(), repliesRepo: Get.find(), productId: Get.find()));
  final TextEditingController _textController = TextEditingController();
  late bool _isLoggedIn;

  @override
  void initState(){
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_isLoggedIn){
      Get.find<PostController>().getAllPosts(widget.productId);
    }
  }

  @override
  Widget build(BuildContext context) {

    // final _connect = GetConnect();
    //
    // void _sendPostRequest () async {
    //   final response = await _connect.post(
    //     // AppConstants.BASE_URL + AppConstants.UPLOAD_URL + AppConstants.CREATE_POST_URI,
    //     'http://jsonplaceholder.typicode.com/posts',
    //       {
    //       'message': 'yesterday'
    //     }
    //   );
    //   print(response.body);
    // }

    final TextEditingController _noteController = TextEditingController();

    return GetBuilder<PostController>(builder: (postController){

      // _noteController.text = postController.foodNote;
      // PlaceLikeBody commentId = PlaceLikeBody(commentId: 1);
      // print("commentId from like from CommentPage :::::::::::::::::::::::::::::: " + commentId.toJson()['commentId'].toString());


      var response;

      return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Forum App'),
      //   backgroundColor: Colors.black,
      //   elevation: 0,
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RefreshIndicator(
            onRefresh: () async {
              // await _postController.getAllPosts();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                    textController: _noteController,
                    hintText: 'What do you want to ask ? ',
                  icon: Icons.comment,

                ),
                // PostFIeld(
                //   hintText: 'What do you want to ask?',
                //   controller: _textController,
                // ),
                // // const SizedBox(
                // //   height: ,
                // // ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(// backgroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10,
                      ),
                    ),
                    // onPressed: _sendPostRequest,
                    onPressed: () async {
                      PlacePostBody content = PlacePostBody(
                        content: _noteController.text,
                      );
                      print("content from CommentPage :::::::::::::::::::::::::::::: " + content.toJson()['content'].toString());
                      Get.find<PostController>().placePost(
                        widget.productId,
                        content,
                      );
                      _noteController.clear();
                      // postController.getAllPosts();
                    },
                    // onPressed: () /*async */{
                      // await _postController.createPost(
                      //   content: _textController.text.trim(),
                      // );
                      // print("The new post :::::::::::::::: " + _textController.toString());

                      // _postController.getAllPosts();
                      // CreatePostBody createPost = CreatePostBody(message: _textController.text );
                      // Get.find<PostController>().createPost(
                      //   createPost,
                      //   _callback,
                      // );
                      // print("The new post when press :::::::::::::::: " + createPost.toString());
                      // print("----------- My Type is ----------" + createPost.toJson()['message']);

                      // _textController.clear();
                      // postController.createPost(createPost);

                    // },
                    child: Obx(() {
                      return
                        _postController.isLoading.value
                          ? const CircularProgressIndicator() :
                        const Text('Post');
                    }),
                  ),
                SizedBox(height: Dimensions.height30,),
                const Text('Posts'),
                SizedBox(height: Dimensions.height20,),
                GetBuilder<RepliesController>(builder: (repliesController){
                  return GetBuilder<PostController>(builder: (postController){
                    return GetBuilder<ElMomtazLabsaController>(builder: (elMomtazLabsa){
                    // PlaceLikeBody commentId = PlaceLikeBody(commentId: 1);

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // itemCount: _postController.posts.value.length,
                      itemCount: postController.currentPostList.length,
                      itemBuilder: (context, index) {
                        int reversedIndex = postController.currentPostList.length - 1 - index;
                        // return Padding(
                        //   padding:
                        //   const EdgeInsets.symmetric(vertical: 8.0),
                        //   child: PostData(
                        //     post: _postController.posts.value[index],
                        //   ),
                        // );
                        String currentTime = postController.currentPostList[index].createdAt!;
                        var time = Get.find<PostController>().createdTime;
                        var currentPost = postController.currentPostList[index].id;
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Container(
                                //   alignment: Alignment.topCenter,
                                //   height: Dimensions.height45,
                                //   width: Dimensions.width30 * 2,
                                //   color: Colors.green,
                                // ),
                                CircleAvatar(
                                  radius: Dimensions.radius20 * 1.3,
                                  backgroundColor: Colors.grey[350],
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: Dimensions.width10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(Dimensions.height10),
                                      // height: 150,
                                      width: Dimensions.width30 * Dimensions.width15 / 1.15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                                        color: Colors.blueGrey[50],
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            postController.currentPostList[index].user!.fName.toString(),
                                            style: TextStyle(
                                                fontSize: Dimensions.font16 * 1.1,
                                                fontWeight: FontWeight.w800
                                            ),
                                          ),
                                          Text(
                                            postController.currentPostList[index].user!.email.toString(),
                                            style: TextStyle(
                                                fontSize: Dimensions.font12 * 1.1,
                                                color: Colors.grey
                                            ),
                                          ),
                                          SizedBox(  height: Dimensions.height10,  ),
                                          Text(postController.currentPostList[index].content.toString()),

                                        ],
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(  height: Dimensions.height20,  ),
                                        Container(
                                            height: Dimensions.height45,
                                            width: Dimensions.width30 * 2,
                                            color: Colors.transparent,
                                            child: Center(
                                              child: CustomSmallText(
                                                text: time.toString(),
                                                // text: postController.currentPostList[index].createdAt.toString(),
                                                // text: '',
                                                size: Dimensions.font20 / 1.1,
                                              ),
                                            )
                                        ),
                                        /*onPressed: () async {
                      PlacePostBody content = PlacePostBody(
                        content: _noteController.text,
                      );
                      print("content from CommentPage :::::::::::::::::::::::::::::: " + content.toJson()['content'].toString());
                      Get.find<PostController>().placePost(
                        content,
                      );
                      _noteController.clear();
                      postController.getAllPosts();
                    },*/
                                        InkWell(
                                          onTap: ()  {
                                            // postController.getAllPosts();
                                            PlaceLikeBody commentId = PlaceLikeBody(
                                              // commentId: postController.currentPostList.length - 1 - (index - 1),
                                              commentId: index,//postController.currentPostList[index].id!.toString(),
                                            );
                                            Get.find<PostController>().placeLikeAndDislike(
                                              postController.currentPostList[index].id,
                                              commentId,
                                            );
                                            postController.getAllPosts(postController.currentPostList[index].id!,);
                                            print("commentId from like from CommentPage :::::::::::::::::::::::::::::: " + commentId.toJson()['commentId'].toString());
                                          },
                                          child: Container(
                                              height: Dimensions.height45,
                                              width: Dimensions.width30 * 2,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: CustomSmallText(
                                                  text: "أعجبني",
                                                  size: Dimensions.font20 / 1.1,
                                                  // postController.currentPostList[index].content.toString()
                                                  color: postController.currentPostList[index].liked! ? Colors.blue : Colors.black,
                                                  // color: _postController.posts.value[index].liked! ? Colors.blue : Colors.black,
                                                  // color: response==true ? Colors.blue : Colors.black,
                                                  // color: commentId.toJson()['commentId'] <= 0 ? Colors.blue : Colors.black,
                                                  // color: Get.find<PostController>().likeAndDislike(commentId) == 1 ? Colors.blue : Colors.black,
                                                ),
                                              )
                                          ),
                                        ),
                                        //var currentPost = postController.currentPostList[index].id;
                                        InkWell(
                                          onTap: (){
                                            Get.toNamed(
                                              RouteHelper.getReplyPage(),
                                              arguments: ReplyPage(
                                                //var currentPost = postController.currentPostList[index].id;
                                                currentPost: currentPost,
                                                index: index,
                                                productId: index,
                                                // repliesController: RepliesController,
                                              ),
                                            );
                                          },
                                          child: Container(
                                              height: Dimensions.height45,
                                              width: Dimensions.width30 * 2,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: CustomSmallText(
                                                  text: "رد",
                                                  size: Dimensions.font20 / 1.1,
                                                ),
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Row(
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   mainAxisAlignment: MainAxisAlignment.start,
                                    //   children: [
                                    //     IconButton(
                                    //       onPressed: () async {
                                    //         // await _postController.likeAndDislike(widget.post.id);
                                    //         // _postController.getAllPosts();
                                    //       },
                                    //       icon: Icon(
                                    //         Icons.thumb_up,
                                    //         color: /*widget.post.liked! ? Colors.blue :*/ Colors.black,
                                    //       ),
                                    //     ),
                                    //     IconButton(
                                    //       onPressed: () {},
                                    //       // Get.to(
                                    //       // () => PostDetails(
                                    //       // post: widget.post,
                                    //       // ),
                                    //       // );
                                    //       // },
                                    //       icon: Icon(Icons.message),
                                    //     ),
                                    //   ],
                                    // ),

                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.height10 / 2,),
                          ],
                        );
                      },
                    );});
                  });}),
                // Obx(() {
                //   return _postController.isLoading.value ?
                //   const Center(
                //     child: CircularProgressIndicator(),
                //   ) :
                //   GetBuilder<PostController>(builder: (postController){
                //     return ListView.builder(
                //       shrinkWrap: true,
                //       physics: const NeverScrollableScrollPhysics(),
                //       // itemCount: _postController.posts.value.length,
                //       itemCount: postController.postList.length,
                //       itemBuilder: (context, index) {
                //         // return Padding(
                //         //   padding:
                //         //   const EdgeInsets.symmetric(vertical: 8.0),
                //         //   child: PostData(
                //         //     post: _postController.posts.value[index],
                //         //   ),
                //         // );
                //         return Container(
                //           height: 100,
                //           width: 200,
                //           color: Colors.red,
                //         );
                //       },
                //     );
                //   });
                //   // Container(
                //   //   height: 100,
                //   //   width: 200,
                //   //   color: Colors.red,
                //   // );
                // }
                // ),
          ],),),),),
    );});
  }


  void _callback(bool isSuccess, String message, String orderID){
    if(isSuccess){
      // it should be a Confirmation for order .. It goes to the confirmation page
      // Get.find<CartController>().clear();
      // Get.find<CartController>().removeCartSharedPreference();
      // Get.find<CartController>().addToHistory();
      // if(Get.find<OrderController>().paymentIndex == 0){
      //   Get.offNamed(RouteHelper.getOrderSuccessPage(orderID, "success"));
      // }else{
      //   Get.offNamed(RouteHelper.getPaymentPage(orderID, Get.find<UserController>().userInfoModel!.id));
      // }
    }else{
      showCustomSnackBar(message);
    }
  }
}
