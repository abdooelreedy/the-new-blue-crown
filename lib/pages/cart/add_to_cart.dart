import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/controller_lists/product_grids/recommended_product_controller.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_big_text.dart';

class AddToCart extends StatefulWidget {

  final int pageId ;

  const AddToCart({
    Key? key,
    required this.pageId
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {

  bool isAdded = true;

  @override
  Widget build(BuildContext context) {

    var product = Get.find<RecommendedProductController>().recommendedProductList[widget.pageId];
    Get.find<RecommendedProductController>().initProduct(product, Get.find<CartController>());

      return GetBuilder<RecommendedProductController>( builder: (recommendedProduct) {
        return isAdded && recommendedProduct.checkQuantity(-1) == 0 || recommendedProduct.inCartItems.toString() == "0" ?
        ElevatedButton(
          onPressed: () {
            recommendedProduct.setQuantity(true);
            recommendedProduct.addItem(product);
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(
                double.maxFinite,
                double.maxFinite
            ),
            primary: Colors.blue,
          ),
          child: CustomBigText(
            text: "Add_To_Cart".tr,
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
                      recommendedProduct.setQuantity(true);
                      recommendedProduct.addItem(product);
                      // cartController.addItem(_cartList[widget.pageId].product!, 1);
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
                  // GetBuilder<CartController>(builder: (cartController) {
                  //   var _cartList = cartController.getItems;
                  //   return CustomBigText(text: _cartList[widget.pageId].quantity.toString(),);
                  // }),
                  CustomBigText(text: recommendedProduct.inCartItems.toString(),),

                  //Remove Icon
                  // GetBuilder<CartController>(builder: (cartController) {
                  //   var _cartList = cartController.getItems;
                  //   return
                      InkWell(
                          onTap: (){
                            recommendedProduct.decrease();
                            recommendedProduct.addItem(product);
                            // cartController.addItem(_cartList[widget.pageId].product!, -1);
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
                          )
                      ),
                  // }),
                ],
              ),
            );
      },
      );

  }
}