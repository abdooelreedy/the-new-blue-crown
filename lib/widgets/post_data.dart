import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/post_controller.dart';
import '../models/post_model.dart';
import '../pages/home/details/post_details.dart';

class PostData extends StatefulWidget {
  const PostData({
    Key? key,
    required this.post,
  });
  final PostModel post;
  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {

  // final PostController _postController = Get.put(PostController(postRepo: Get.find(), orderRepo: Get.find()));
  bool likedPost = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(    color: Colors.grey[200],     borderRadius: BorderRadius.circular(10),     ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(  widget.post.user!.fName!,  ),
          Text(  widget.post.user!.email!,  ),
          const SizedBox(  height: 10,  ),
          Text(  widget.post.content!,  ),
          Row(
            children: [
              IconButton(
                onPressed: () async {
                  // await _postController.likeAndDislike(widget.post.id);
                  // _postController.getAllPosts();
                },
                icon: Icon(
                  Icons.thumb_up,
                  color: widget.post.liked! ? Colors.blue : Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.to(
                        () => PostDetails(
                      post: widget.post,
                    ),
                  );
                },
                icon: Icon(Icons.message),
              ),
            ],
          ),
        ],
      ),
    );
  }
}