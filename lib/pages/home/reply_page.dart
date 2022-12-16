import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:theblue_crown/controllers/replies_controller.dart';
import 'package:theblue_crown/models/place_reply_model.dart';
import '../../constance.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/post_controller.dart';
import '../../models/post_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_small_text.dart';
import '../../widgets/input_widget.dart';
import '../../widgets/post_data.dart';

class ReplyPage extends StatefulWidget {

  var currentPost;
  final int index;
  final int productId;
  // var repliesController;

  ReplyPage({
    Key? key,
    required this.currentPost,
    required this.index,
    required this.productId,
    // required this.repliesController
  }) : super(key: key);

  @override
  State<ReplyPage> createState() => _ReplyPageState();
}

class _ReplyPageState extends State<ReplyPage> {


  // final PostController _postController = Get.put(PostController(orderRepo: Get.find(), postRepo: Get.find()));

  // @override
  // void initState() {
  //   // WidgetsBinding.instance.addPostFrameCallback((_) {
  //     // _postController.getComments(widget.post.id);
  //   // });
  //   super.initState();
  // }
  final controller2 = HomeController();
  late bool _isLoggedIn;

  @override
  void initState(){
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_isLoggedIn){
      Get.find<RepliesController>().getReplies(widget.currentPost, widget.productId);
    }
    print("widget.index is ::::::::::::___________________________________________________ " + widget.currentPost.toString());
    // print("current replies is ::::::::::::___________________________________________________ " + Get.find<RepliesController>().getReplies(widget.index.toString()).toString());
  }


  @override
  Widget build(BuildContext context) {

    final TextEditingController _replyController = TextEditingController();

    return
      Scaffold(
        backgroundColor: Colors.white,
        //resizeToAvoidBottomInset : false,
        //body: SingleChildScrollView(
        // backgroundColor: Colors.blue,
        body: AnimatedBuilder(
            animation: controller2,
            builder: (context, snapshot) {
              return LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                    return
                      // Stack(
                      // children: [
                      Stack(
                        children: [
                          // menu(context),
                          buildPage1(),
                          customcartview (context, constraints, controller2, _replyController),
                        ],
                      );
                    // customcartview (context, constraints, controller2),
                    // buildCart(),
                    // ],
                    // );
                    //   Stack(
                    //   children: <Widget>[
                    //     menu(context),
                    //     dashboard(context),
                    //     dashboard2(context),
                    //     dashboard3(context, constraints),
                    //     customcartview (context, constraints, controller2),
                    //   ],
                    // );
                  }
              );
            }
        ),
      );
  }


  Widget buildPage1() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
        child: Container(
        height: Dimensions.screenHeight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
    child: Column(
              children: [
                const SizedBox(height: 10,),
                // Container(
                //   width: double.infinity,
                //   height: 300,
                //   child: Obx(() {
                //     return _postController.isLoading.value
                //         ? Center(
                //       child: CircularProgressIndicator(),
                //     )
                //         : ListView.builder(
                //         itemCount: _postController.comments.value.length,
                //         shrinkWrap: true,
                //         itemBuilder: (context, index) {
                //           return ListTile(
                //             title: Text(
                //               _postController.comments.value[index].user!.fName,
                //             ),
                //             subtitle: Text(
                //               _postController.comments.value[index].body!,
                //             ),
                //           );
                //         });
                //   }),
                // ),
                GetBuilder<PostController>(builder: (postController){
                  return  Container(
                    height: 125,
                    width: double.maxFinite,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                  width: Dimensions.width30 * Dimensions.width15 / 1.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                                    color: Colors.blueGrey[50],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        postController.currentPostList[widget.index].user!.fName.toString(),
                                        style: TextStyle(
                                            fontSize: Dimensions.font16 * 1.1,
                                            fontWeight: FontWeight.w800
                                        ),
                                      ),
                                      Text(
                                        postController.currentPostList[widget.index].user!.email.toString(),
                                        style: TextStyle(
                                            fontSize: Dimensions.font12 * 1.1,
                                            color: Colors.grey
                                        ),
                                      ),
                                      SizedBox(  height: Dimensions.height10,  ),
                                      Text(postController.currentPostList[widget.index].content.toString()),

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
                                            text: "time.toString()",
                                            size: Dimensions.font20 / 1.1,
                                          ),
                                        )
                                    ),
                                    Container(
                                        height: Dimensions.height45,
                                        width: Dimensions.width30 * 2,
                                        color: Colors.transparent,
                                        child: Center(
                                          child: CustomSmallText(
                                            text: "أعجبني",
                                            size: Dimensions.font20 / 1.1,
                                          ),
                                        )
                                    ),
                                    //var currentPost = postController.currentPostList[index].id;
                                    InkWell(
                                      onTap: (){

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
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.height10 / 2,),
                      ],
                    ),
                  );
                }),
                SizedBox(height: Dimensions.height20,),
                GetBuilder<RepliesController>(builder: (repliesController){
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // itemCount: _postController.posts.value.length,
                    itemCount: repliesController.currentRepliesList.length,
                    itemBuilder: (context, index) {
                      // int reversedIndex = postController.currentRepliesList.length - 1 - index;
                      // return Padding(
                      //   padding:
                      //   const EdgeInsets.symmetric(vertical: 8.0),
                      //   child: PostData(
                      //     post: _postController.posts.value[index],
                      //   ),
                      // );
                      // String currentTime = postController.currentRepliesList[index].createdAt!;
                      // var time = Get.find<PostController>().createdTime;
                      // var currentPost = postController.currentRepliesList[index].id;
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
                                          repliesController.currentRepliesList[index].user!.fName.toString(),
                                          style: TextStyle(
                                              fontSize: Dimensions.font16 * 1.1,
                                              fontWeight: FontWeight.w800
                                          ),
                                        ),
                                        Text(
                                          repliesController.currentRepliesList[index].user!.email.toString(),
                                          style: TextStyle(
                                              fontSize: Dimensions.font12 * 1.1,
                                              color: Colors.grey
                                          ),
                                        ),
                                        SizedBox(  height: Dimensions.height10,  ),
                                        Text(repliesController.currentRepliesList[index].body.toString()),

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
                                              // text: time.toString(),
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
                                          // repliesController.getReplies(1);
                                          // PlaceLikeBody commentId = PlaceLikeBody(
                                          //   commentId: reversedIndex,
                                          // );
                                          // Get.find<PostController>().placeLikeAndDislike(
                                          // commentId,
                                          // reversedIndex,
                                          // );
                                          // repliesController.getReplies(1);
                                          // print("commentId from like from CommentPage :::::::::::::::::::::::::::::: " + commentId.toJson()['commentId'].toString());
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
                                                // color: postController.currentRepliesList[reversedIndex].liked! ? Colors.blue : Colors.black,
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
                                          // Get.toNamed(
                                          //   RouteHelper.getReplyPage(),
                                          // arguments: ReplyPage(
                                          //   currentPost: currentPost,
                                          //   index: index,
                                          //
                                          // ),
                                          // );
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
                  );
                }),

              ],
            ),),
          ),
        ),
    );
  }


  Widget customcartview (context, BoxConstraints constraints, HomeController controller2, TextEditingController _replyController){
    return AnimatedPositioned(
        duration: panelTransition,
        bottom: 0,
        right: 0,
        left: 0,
        height: controller2.homeState == HomeState.normal ? Dimensions.bottomHeightBar : (constraints.maxHeight - Dimensions.bottomHeightBar),
        child: Container(
          // height: Dimensions.height45 * 4,
          color: Colors.white,
          child: Column(
            children: [
              InputWidget(
                obscureText: false,
                hintText: 'Write a reply ...',
                controller: _replyController,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                ),
                onPressed: () async {
                  PlaceReplyBody body = PlaceReplyBody(
                    body: _replyController.text,
                  );
                  print("body from ReplyPage :::::::::::::::::::::::::::::: " + body.toJson()['body'].toString());
                  Get.find<RepliesController>().placeReply(
                    widget.currentPost,
                    body,
                  );
                  _replyController.clear();
                  // widget.repliesController
                  // postController.getAllPosts();


                  // await _postController.createComment(
                  // widget.post.id,
                  // _commentController.text.trim(),
                  // );
                  // _commentController.clear();
                  // _postController.getComments(widget.post.id);
                },
                child: const Text('Reply'),
              ),
            ],
          ),
        )
    );
  }
}
