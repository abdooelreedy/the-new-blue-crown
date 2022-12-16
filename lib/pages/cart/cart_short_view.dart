import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:theblue_crown/utils/dimensions.dart';
import 'package:theblue_crown/widgets/custom_small_text.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/home_controller.dart';
import '../../utils/app_constants.dart';
import '../../widgets/custom_big_text.dart';
import 'package:get/get.dart';
class CardShortView extends StatelessWidget {

   CardShortView({
    Key? key,
    required controller2,
  }) : super(key: key);

  final controller2 = HomeController();
  final String _cartTag = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (_cartController){
      //var cart = _cartController.getItems;
      return _cartController.getItems.length >= 0 ? ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius15),
          topRight: Radius.circular(Dimensions.radius15),
        ),
        child: Container(
          color: Colors.blue,
          child: Row(
            children: [
              Column(

                children: [
                  Padding(
                    padding: EdgeInsets.only(right: Dimensions.width25 / 2, left: Dimensions.width25 / 2, top: Dimensions.height10, bottom: Dimensions.height10 / 5),
                    child: CustomBigText(
                      text: "Cart".tr,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width25 / 2, right: Dimensions.width25 / 2,),
                    child: Row(
                      children: [
                        const Icon(
                            Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: Dimensions.width5,),
                        CustomSmallText(
                          text: _cartController.getItems.length.toString(),
                          size: Dimensions.font20,
                          color: Colors.white,
                        )
                      ],
                    ),
                    // CircleAvatar(
                    //   radius: Dimensions.radius20,
                    //   backgroundColor: Colors.white,
                    //   child: Text(
                    //     _cartController.getItems.length.toString(),
                    //     style: const TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.blue
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              ),
              SizedBox(width: Dimensions.width5 / 5,),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: GetBuilder<CartController>(builder: (_cartController) {
                          var _cartList = _cartController.getItems;
                          return Row(
                            children: List.generate(
                              _cartList.length,
                                  (index) => Padding(
                                padding: EdgeInsets.only(
                                  top: Dimensions.height10,
                                  bottom: Dimensions.height10 / 10 ,
                                  right: Dimensions.width5,
                                  left: Dimensions.width5,
                                ),
                                child: Hero(
                                  tag: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + _cartController.getItems[index].img! + _cartTag,
                                  child: Badge(badgeContent:
                                  Text(_cartList[index].quantity.toString(),
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                    badgeColor: Colors.white60,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: SizedBox(
                                        width: Dimensions.listViewImgSize / 3,
                                        height: Dimensions.listViewImgSize / 3,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                                          child: CachedNetworkImage(
                                            imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + _cartController.getItems[index].img!,
                                            height: Dimensions.listViewImgSize,
                                            width:Dimensions.listViewImgSize,
                                            fit: BoxFit.fitHeight,
                                            placeholder: (context, url) => Container(color: Colors.black12,),
                                            errorWidget: (context, url, error) => Container(
                                              color: Colors.black12,
                                              child: const Icon(Icons.error, color: Colors.red),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        ),
                      ),
                    ],
                  ),
              ),
              SizedBox(width: Dimensions.width10 / 2,),
              Column(
                children: [
                  GetBuilder<CartController>(
                    builder: (cartController){
                      return Padding(
                        padding: EdgeInsets.only(top: Dimensions.height15, right: Dimensions.width10, left: Dimensions.width10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomBigText(
                              color: cartController.totalAmountAfterDiscount < 300 ? Colors.red : Colors.greenAccent,
                              text: cartController.totalAmountAfterDiscount.toString(),
                              fontWeight: FontWeight.w800,
                              // alignment: Alignment.center,
                            ),
                            CustomSmallText(
                              text: 'Pound'.tr,
                              color: cartController.totalAmountAfterDiscount < 300 ? Colors.redAccent : Colors.greenAccent,
                              fontWeight: FontWeight.w800,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ) : Container();
    },
    );
  }
}