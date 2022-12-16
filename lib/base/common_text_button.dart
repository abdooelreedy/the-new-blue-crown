import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../widgets/custom_big_text.dart';

class CommonTextButton extends StatelessWidget {

  final String text;

  const CommonTextButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.height45/1.9, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20,),
      child: Center(
        child: CustomBigText(
          text: text,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: Colors.grey[400],
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(Dimensions.radius20),
      //   color: Colors.blue.shade200,
      // ),
    );
  }
}
