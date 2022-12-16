import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/popular_product_controller.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/controller_lists/product_grids/recommended_product_controller.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_big_text.dart';

class AddPopularToCart extends StatefulWidget {

  final int pageId ;

  const AddPopularToCart({
    Key? key,
    required this.pageId
  }) : super(key: key);

  @override
  State<AddPopularToCart> createState() => _AddPopularToCartState();
}

class _AddPopularToCartState extends State<AddPopularToCart> {

  bool isAdded = true;

  @override
  Widget build(BuildContext context) {

    var product = Get.find<PopularProductController>().popularProductList[widget.pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

    return GetBuilder<PopularProductController>( builder: (popularProduct) {
      return isAdded && /*popularProduct.checkQuantity(10) == 0 ||*/ popularProduct.inCartItems.toString() == "0" ?
      ElevatedButton(
        onPressed: () {
          popularProduct.setQuantity(true);
          popularProduct.addItem(product);
          setState(() {isAdded = !isAdded;});
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(
              double.maxFinite,
              double.maxFinite
          ),
          primary: Colors.blue,
        ),
        child: CustomBigText(
          text: "Add To Cart".tr,
          color: Colors.white,
          size: Dimensions.font16,
        ),
      ) :
      //Remove And Add Container
      Container(
        width: double.maxFinite,
        height: Dimensions.height20 * 2,
        margin: EdgeInsets.only(
          top: Dimensions.height10 / 13,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Add Icon
            InkWell(
              onTap: (){
                popularProduct.setQuantity(true);
                popularProduct.addItem(product);
                setState(() {isAdded = !isAdded;});
              },
              child: Container(
                width: Dimensions.width30 * 1.5,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(Dimensions.radius15 / 2.5),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),

              ),
            ),
            //inCartItems
            CustomBigText(text: popularProduct.inCartItems.toString(),),
            //Remove Icon
            InkWell(
              onTap: (){
                popularProduct.setQuantity(false);
                popularProduct.addItem(product);
                // setState(() {isAdded = !isAdded;});
              },
              child: Container(
                width: Dimensions.width30 * 1.5,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(Dimensions.radius15 / 2.5),
                ),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    },
    );
  }
}