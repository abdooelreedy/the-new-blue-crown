import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/controllers/language_controller.dart';
import 'package:theblue_crown/utils/dimensions.dart';
import 'package:theblue_crown/widgets/custom_big_text.dart';
import 'package:theblue_crown/widgets/custom_small_text.dart';

import '../../widgets/app_icon.dart';

// import '../../../core/utils/ui_helper.dart';
// import 'package:foodie/core/utils/ui_helper.dart';

class ProductCardText extends StatelessWidget {
  ProductCardText({
    Key? key,
    required this.text,
    required this.value,
    this.fontWeight = FontWeight.w500,
    this.alignment = Alignment.topRight,
    this.overflow = TextOverflow.ellipsis,
    this.colors = Colors.blue,
  }) : super(key: key);

  final String text;
  final String value;
  final Alignment alignment;
  TextOverflow overflow;
  final FontWeight fontWeight;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      // color: Colors.green,
      child: Row(
        children: [
          GetBuilder<LocalizationController>(builder: (localizationController) {
            return Container(
              // color: Colors.yellow,
              width: localizationController.selectedIndex == 0 ? Dimensions.width20 * 1.4  : Dimensions.width30 * 1.2,
              child: CustomSmallText(
                text: text.tr,
                color: Colors.black,
                size: Dimensions.font16 / 2,

              ),
            );
          }),
          // SizedBox(height: Dimensions.width30),
          Container(
            // color: Colors.green,
            width: Dimensions.width30 * 2,
            child: CustomSmallText(
              text: value.tr,
              color: colors,
              size: Dimensions.font20 / 2,
              fontWeight: fontWeight,
              // overflow: overflow,
              // style: Theme.of(context).textTheme.headline6!.copyWith(
              //   color: Colors.blue,
              //   fontSize: 20,
              //   height: Dimensions.height10 / 5,
              // ),
            ),
          ),
        ],
      ),

    );
  }
}