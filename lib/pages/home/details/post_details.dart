import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/post_controller.dart';
import '../../../models/post_model.dart';
import '../../../widgets/input_widget.dart';
import '../../../widgets/post_data.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({Key? key, required this.post});

  final PostModel post;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final TextEditingController _commentController = TextEditingController();
  // final PostController _postController = Get.put(PostController(postRepo: Get.find(), orderRepo: Get.find()));

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // _postController.getComments(widget.post.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.post.user!.fName!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PostData(
                post: widget.post,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 300,
                child: Obx(() {
                  return
                  //   _postController.isLoading.value
                  //     ?
                  //   Center(
                  //   child: CircularProgressIndicator(),
                  // ) :
                    ListView.builder(
                      itemCount: 5,//_postController.comments.value.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(''
                            // _postController
                            //     .comments.value[index].user!.fName,
                          ),
                          subtitle: Text(''
                            // _postController.comments.value[index].body!,
                          ),
                        );
                      });
                }),
              ),
              InputWidget(
                obscureText: false,
                hintText: 'Write a comment...',
                controller: _commentController,
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
                  // await _postController.createComment(
                  //   widget.post.id,
                  //   _commentController.text.trim(),
                  // );
                  _commentController.clear();
                  // _postController.getComments(widget.post.id);
                },
                child: const Text('Comment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}