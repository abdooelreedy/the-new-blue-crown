import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:theblue_crown/base/common_text_button.dart';
import 'package:theblue_crown/base/no_data_page.dart';
import 'package:theblue_crown/base/show_custom_snackbar.dart';
import 'package:theblue_crown/controllers/auth_controller.dart';
import 'package:theblue_crown/controllers/cart_controller.dart';
import 'package:theblue_crown/controllers/location_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/popular_product_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/recommended_product_controller.dart';
import 'package:theblue_crown/controllers/order_controller.dart';
import 'package:theblue_crown/controllers/user_controller.dart';
import 'package:theblue_crown/models/place_order_model.dart';
import 'package:theblue_crown/pages/order/delivery_options.dart';
import 'package:theblue_crown/routes/route_helper.dart';
import 'package:theblue_crown/utils/dimensions.dart';
import 'package:theblue_crown/utils/app_constants.dart';
import 'package:theblue_crown/widgets/app_icon.dart';
import 'package:theblue_crown/widgets/app_text_field.dart';
import 'package:theblue_crown/widgets/custom_big_text.dart';
import 'package:theblue_crown/widgets/custom_small_text.dart';
import 'package:theblue_crown/pages/order/payment_option_button.dart';

import '../../controllers/language_controller.dart';
import '../../widgets/app_column.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextEditingController _noteController = TextEditingController();

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Dimensions.radius20),
        topRight: Radius.circular(Dimensions.radius20),
      ),
      child: WillPopScope(
        onWillPop: () async {
          // Get.toNamed(RouteHelper.getInitial());
          return true;
        },
        child: Scaffold(
              backgroundColor: Colors.grey[300],
          //backgroundColor: Colors.blue,
              body: Stack(
                  children: [
                    //header
                    Positioned(
                      top: Dimensions.height20 * 1.2,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppIcon(
                            icon: Icons.arrow_back_ios_outlined,
                            iconColor: Colors.grey.shade600,
                            backgroundColor: Colors.white,
                            iconsize: Dimensions.iconSize24,
                          ),
                          SizedBox(width: Dimensions.width20 * 5,),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RouteHelper.getInitial());
                            },
                            child: Container(
                              height: Dimensions.height45,
                              width: Dimensions.width20 * 2 + 5,
                              // child: Lottie.asset('assets/home.json'),
                              child: Icon(
                                  Icons.home_outlined,
                                size: Dimensions.iconSize24 * 1.5,
                                color: Colors.grey.shade600,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: Colors.grey.shade200,
                                boxShadow: [
                                  //darker shadow at bottom right
                                  BoxShadow(
                                    color: Colors.grey.shade700.withOpacity(0.7),
                                    offset: Offset(4, 4),
                                    blurRadius: 10,
                                    spreadRadius: 0.1
                                  ),

                                  //Lighter shadow at top right
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(-4, -4),
                                      blurRadius: 15,
                                      spreadRadius: 1
                                  ),
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.grey.shade200,
                                    Colors.grey.shade400
                                  ],
                                  stops: [
                                    0.1,
                                    0.9
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.grey.shade200,
                              boxShadow: [
                                //darker shadow at bottom right
                                BoxShadow(
                                    color: Colors.grey.shade700.withOpacity(0.7),
                                    offset: Offset(4, 4),
                                    blurRadius: 10,
                                    spreadRadius: 0.1
                                ),

                                //Lighter shadow at top right
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: Offset(-4, -4),
                                    blurRadius: 15,
                                    spreadRadius: 1
                                ),
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.grey.shade200,
                                  Colors.grey.shade400
                                ],
                                stops: [
                                  0.1,
                                  0.9
                                ],
                              ),
                            ),
                            height: Dimensions.height45,
                            width: Dimensions.width20 * 2 + 5,
                            // child: Lottie.asset('assets/cart.json'),
                            child: Icon(Icons.shopping_cart_outlined, color: Colors.grey.shade600,),
                          ),
                        ],
                      ),
                    ),
                    //body
                    GetBuilder<CartController>(builder: (_cartController){
                    return _cartController.getItems.length > 0 ?
                    Positioned(
                      top: Dimensions.height20 * 5,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: 0,
                      child: Container(
                        margin: EdgeInsets.only(top: Dimensions.height15),
                        // color: Colors.redAccent,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GetBuilder<LocalizationController>(builder: (localizationController) {
                            return GetBuilder<CartController>(builder: (cartController){
                              var _cartList = cartController.getItems;
                              return ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: _cartList.length,
                                  itemBuilder: (_, index){
                                    return Column(
                                      children: [
                                        Container(
                                          height: Dimensions.height45 * 3,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                                            border: Border.all(width: 2, color: Colors.blueGrey.withOpacity(0.2),),
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: (){
                                                  var popularIndex = Get.find<PopularProductController>()
                                                      .popularProductList
                                                      .indexOf(_cartList[index].product!);
                                                  if(popularIndex >= 0){
                                                    Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cartpage"));
                                                  }else{
                                                    var recommendedIndex = Get.find<RecommendedProductController>()
                                                        .recommendedProductList
                                                        .indexOf(_cartList[index].product!);
                                                    if(recommendedIndex < 0){
                                                      Get.snackbar(
                                                        "History product", "Product review is not available for history products",
                                                        backgroundColor: Colors.grey.shade200,
                                                        colorText: Colors.red,
                                                      );
                                                    }else{
                                                      Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cartpage"));
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  width: Dimensions.height20 * 5,
                                                  // height: Dimensions.height20 * 5,
                                                  height: double.maxFinite,
                                                  // color: Colors.yellow,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                    child: CachedNetworkImage(
                                                      imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + cartController.getItems[index].img!,
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
                                              SizedBox(width: Dimensions.width10,),
                                              Expanded(
                                                child: Container(
                                                  // color: Colors.pink,
                                                  // height: Dimensions.height20 * 5,
                                                  height: double.maxFinite,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(top: Dimensions.height10 / 2),
                                                        child: CustomBigText(
                                                          text: cartController.getItems[index].name!.tr,
                                                          color: Colors.black54,
                                                        ),
                                                      ),
                                                      SizedBox(height: Dimensions.width10,),
                                                      Row(
                                                        children: [
                                                          CustomBigText(
                                                            text:
                                                            // cartController.getItems[index].price.toString(),
                                                            _cartList[index].quantity! <= _cartList[index].quantity2! ?
                                                            cartController.getItems[index].price.toString() : _cartList[index].quantity! >= _cartList[index].quantity2! && _cartList[index].quantity! <= _cartList[index].quantity3! ?
                                                            cartController.getItems[index].price2.toString() : _cartList[index].quantity! >= _cartList[index].quantity3! && _cartList[index].quantity! <= _cartList[index].quantity4! ?
                                                            cartController.getItems[index].price3.toString() : cartController.getItems[index].price4.toString(),

                                                            color: Colors.redAccent,
                                                          ),
                                                          CustomBigText(text: " * "),
                                                          CustomBigText(text: _cartList[index].quantity.toString(),),
                                                          CustomBigText(text: " = "),
                                                          CustomBigText(text:
                                                          // cartController.getItems[index].price.toString(),
                                                            (_cartList[index].quantity! <= _cartList[index].quantity2! ?
                                                            cartController.getItems[index].price! * _cartList[index].quantity! : _cartList[index].quantity! >= _cartList[index].quantity2! && _cartList[index].quantity! <= _cartList[index].quantity3! ?
                                                            cartController.getItems[index].price2! * _cartList[index].quantity! : _cartList[index].quantity! >= _cartList[index].quantity3! && _cartList[index].quantity! <= _cartList[index].quantity4! ?
                                                            cartController.getItems[index].price3! * _cartList[index].quantity! : cartController.getItems[index].price4! * _cartList[index].quantity!).toString() + " " + "Pound".tr,
                                                            color: Colors.redAccent,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: Dimensions.width10,),
                                                      Row(
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets.only(bottom: Dimensions.height10 / 2),
                                                            child: Container(
                                                              width: Dimensions.width30 * 5,
                                                              height: Dimensions.height30 * 1.2,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                                                                // color: Colors.red
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  //Add Icon
                                                                  InkWell(
                                                                    onTap: (){
                                                                      _cartList[index].quantity! <= _cartList[index].product!.max_quantity! - 1 ?
                                                                      cartController.addItem(_cartList[index].product!, 1) :
                                                                      cartController.addItem(_cartList[index].product!, 0);
                                                                    },
                                                                    child: Container(
                                                                      width: Dimensions.width30 * 1.4,
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
                                                                  CustomBigText(text: _cartList[index].quantity.toString(),),


                                                                  //Remove Icon
                                                                  InkWell(
                                                                    onTap: (){
                                                                      cartController.addItem(_cartList[index].product!, -1);
                                                                    },
                                                                    child: Container(
                                                                      width: Dimensions.width30 * 1.4,
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
                                                            ),),
                                                          SizedBox(width: Dimensions.width10),
                                                          GestureDetector(
                                                            onTap: (){
                                                              cartController.removeItem(_cartList[index].product!, 0);
                                                            },
                                                            child: Container(
                                                              // color: Colors.red,
                                                              width: localizationController.selectedIndex == 0 ? Dimensions.width30 * 3 : Dimensions.width30 * 2.25,
                                                              height: Dimensions.height30 * 1.3,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                                                                border: Border.all(width: 2, color: Colors.blueGrey.withOpacity(0.2),),
                                                              ),
                                                              child: Row(
                                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Icon(
                                                                      Icons.delete_outline,
                                                                      color: Colors.blue[700],
                                                                    ),
                                                                  SizedBox(width: Dimensions.width10 / 5),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: Dimensions.height10 / 2),
                                                                    child: CustomSmallText(text: "remove".tr, color: Colors.blue[700]!, size: Dimensions.font16,),),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          // SizedBox(width: Dimensions.width10 / 3,),

                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: Dimensions.height10,)
                                      ],
                                    );
                                  }
                              );
                            },
                            );
                          },
                          ),
                        ),
                      ),
                    ) :
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: NoDataPage(
                            text: "The_Cart_Is_Empty".tr,
                            imgPath: 'assets/images/cart_empty.svg',
                          ),
                        );
                    }
                    ),
                  ],
                ),
              bottomNavigationBar: GetBuilder<OrderController>(builder: (orderController){
                _noteController.text = orderController.foodNote;
                return GetBuilder<CartController>(builder: (cartController){
                      return Container(
                        height: Dimensions.bottomHeightBar + Dimensions.height45 * 3.5,
                        padding: EdgeInsets.only(
                          top: Dimensions.height10,
                          bottom: Dimensions.height10,
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(Dimensions.radius20 * 2),
                          //   topRight: Radius.circular(Dimensions.radius20 * 2),
                          // ),
                        ),
                        child: cartController.getItems.length > 0 ?
                        Column(
                          children: [

                            //payment options
                            InkWell(
                              onTap: () => showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (_){
                                  return Column(
                                    children: [
                                      Expanded(
                                          child: SingleChildScrollView(

                                            child: Container(
                                              height: MediaQuery.of(context).size.height * 0.65,
                                              width: double.maxFinite,
                                              color: Colors.white,
                                              // decoration: BoxDecoration(
                                              //   color: Colors.white,
                                              //   borderRadius: BorderRadius.only(
                                              //     topLeft: Radius.circular(Dimensions.radius20),
                                              //     topRight: Radius.circular(Dimensions.radius20),
                                              //   ),
                                              // ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: Dimensions.height45 * 12,
                                                    padding: EdgeInsets.only(
                                                      left: Dimensions.width20,
                                                      right: Dimensions.width20,
                                                      top: Dimensions.height20,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        PaymentOptionButton(
                                                          icon: Icons.money,
                                                          title: 'Cash_On_Delivery'.tr,
                                                          subTitle: 'You_Pay_After_Getting_The_Delivery'.tr,
                                                          index: 0,
                                                        ),
                                                        SizedBox(height: Dimensions.height10,),
                                                        PaymentOptionButton(
                                                          icon: Icons.paypal_outlined,
                                                          title: 'Digital_Payment'.tr,
                                                          subTitle: 'Safer_and_faster_Way_Of_Payment'.tr,
                                                          index: 1,
                                                        ),
                                                        SizedBox(height: Dimensions.height20,),
                                                        Text(
                                                          'Delivery_Options'.tr,
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                        SizedBox(height: Dimensions.height10 / 2,),
                                                        DeliveryOptions(
                                                          value: "delivery",
                                                          title: "Home_Delivery".tr,
                                                          amount: double.parse(Get.find<CartController>().totalAmount.toString()),
                                                          isFree: false,
                                                        ),
                                                        SizedBox(height: Dimensions.height10,),
                                                        DeliveryOptions(
                                                          value: "take_away",
                                                          title: "Take_Away".tr,
                                                          amount: 10.0,
                                                          isFree: true,
                                                        ),
                                                        SizedBox(height: Dimensions.height20,),
                                                        Text(
                                                          'Additional_Notes'.tr,
                                                          style: TextStyle(
                                                              fontSize: Dimensions.font20,
                                                              fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                        AppTextField(
                                                          textController: _noteController,
                                                          hintText: 'Type_Your_Note'.tr,
                                                          icon: Icons.note,
                                                          // maxLines: true,
                                                        ),
                                                      ],
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            physics: const BouncingScrollPhysics(),
                                          ),
                                      ),
                                    ],
                                  );
                                },
                              ).whenComplete(() => orderController.setFoodNote(_noteController.text.trim())),
                              child: SizedBox(
                                // height: 50,
                                width: double.maxFinite,
                                child: CommonTextButton(
                                  text: "Payment_Options".tr,
                                ),
                              ),
                            ),
                            SizedBox(height: Dimensions.height10 / 10,),
                            Container(
                              padding: EdgeInsets.only(
                                top: Dimensions.height10 / 2,
                                bottom: Dimensions.height10 / 2,
                                left: Dimensions.width20,
                                right: Dimensions.width20,
                              ),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(Dimensions.radius20),
                              //   color: Colors.white,
                              // ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomBigText(
                                    text: 'Total'.tr + ' : ',
                                    color: Colors.white,
                                    // alignment: Alignment.center,
                                  ),
                                  CustomBigText(
                                    text: cartController.totalAmount.toString() + " "  + "Pound".tr,
                                    color: Colors.white,
                                    // alignment: Alignment.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: Dimensions.height10 / 10,),
                            Container(
                              padding: EdgeInsets.only(
                                top: Dimensions.height10 / 2,
                                bottom: Dimensions.height10 / 2,
                                left: Dimensions.width20,
                                right: Dimensions.width20,
                              ),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(Dimensions.radius20),
                              //   color: Colors.white,
                              // ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomBigText(
                                    text: 'Discount'.tr + ' : ',
                                    color: Colors.white,
                                    // alignment: Alignment.center,
                                  ),
                                  CustomBigText(
                                    text: cartController.totalDiscount.toString() + " "  + "Pound".tr,
                                    color: Colors.white,
                                    // alignment: Alignment.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: Dimensions.height10 / 10,),
                            Container(
                              padding: EdgeInsets.only(
                                top: Dimensions.height10 / 2,
                                bottom: Dimensions.height10 / 2,
                                left: Dimensions.width20,
                                right: Dimensions.width20,
                              ),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(Dimensions.radius20),
                              //   color: Colors.white,
                              // ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomBigText(
                                    text: 'Total_After_Discount'.tr + ' : ',
                                    color: Colors.white,
                                    // alignment: Alignment.center,
                                  ),
                                  CustomBigText(
                                    text: cartController.totalAmountAfterDiscount.toString() + " " + "Pound".tr,
                                    color: Colors.white,
                                    // alignment: Alignment.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: Dimensions.height10 / 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Container(
                                //   padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20,),
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(Dimensions.radius20),
                                //     color: Colors.white,
                                //   ),
                                //   child: Row(
                                //     children: [
                                //       SizedBox(width: Dimensions.width10 / 2,),
                                //       CustomBigText(
                                //         text: "\$ " + cartController.totalAmount.toString(),
                                //         // alignment: Alignment.center,
                                //       ),
                                //       SizedBox(width: Dimensions.width10 / 2,),
                                //     ],
                                //   ),
                                // ),
                                GestureDetector(
                                  onTap: (){
                                    //popularProduct.addItem(product);
                                    if(Get.find<AuthController>().userLoggedIn()){
                                      // Get.find<AuthController>().updateToken();
                                      // print("logged in?");
                                      // cartController.addToHistory();
                                      if(Get.find<LocationController>().addressList.isEmpty){
                                        Get.toNamed(RouteHelper.getAddAddressPage());
                                      }
                                      else{
                                        // Get.offNamed(RouteHelper.getInitial());
                                        // Get.offNamed(RouteHelper.getPaymentPage("100127", Get.find<UserController>().userModel!.id!));
                                        var location = Get.find<LocationController>().getUserAddress();
                                        var cart = Get.find<CartController>().getItems;
                                        var totalAmountInCart = Get.find<CartController>().totalAmount;
                                        var user = Get.find<UserController>().userInfoModel;
                                        PlaceOrderBody placeOrder =  PlaceOrderBody(
                                          cart: cart,
                                          totalAmountInCart: totalAmountInCart,
                                          orderAmount: 100.0,
                                          orderNote: orderController.foodNote,
                                          address: location.address,
                                          latitude: location.latitude,
                                          longitude: location.longitude,
                                          contactPersonNumber: user!.phone,
                                          contactPersonName: user.fName,
                                          scheduleAt: '',
                                          distance: 10.0,
                                          paymentMethod: orderController.paymentIndex == 0 ?
                                          'cash_on_delivery' :
                                          'digital_payment',
                                          orderType: orderController.orderType,
                                        );
                                        // print("----------- My Type is ----------" + placeOrder.toJson()['order_type']);
                                        // print("----------- My payment method is ----------" + placeOrder.toJson()['payment_method']);
                                        // return;
                                        Get.find<OrderController>().placeOrder(
                                          placeOrder,
                                          _callback,
                                        );
                                      }
                                    }else{
                                      // Get.toNamed(RouteHelper.getSignInPage());
                                    }
                                    cartController.addToHistory();
                                  },
                                  child: Container(
                                    // alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                      top: Dimensions.height45 / 1.9,
                                      bottom: Dimensions.height20,
                                      left: Dimensions.width20 * 6.5,
                                      right: Dimensions.width20 * 6.5,
                                    ),
                                    child: CustomBigText(
                                      text: "Check_Out".tr,
                                      color: Colors.white,
                                    ),
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(Dimensions.radius20),
                                    //   color: Colors.blue,
                                    // ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                                      color: Colors.blue.shade200,
                                      boxShadow: [
                                        //darker shadow at bottom right
                                        BoxShadow(
                                            color: Colors.blue.shade700.withOpacity(0.7),
                                            offset: Offset(4, 4),
                                            blurRadius: 10,
                                            spreadRadius: 0.1
                                        ),

                                        //Lighter shadow at top right
                                        BoxShadow(
                                          color: Colors.blue.shade200,
                                          // offset: Offset(-4, -4),
                                          blurRadius: 1,
                                          // spreadRadius: 0.5
                                        ),
                                      ],
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.blue.shade200,
                                          Colors.blue.shade400
                                        ],
                                        stops: [
                                          0.1,
                                          0.9
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ) :
                        Container(),
                      );
                    }
                );
              }),
            ),
      ),
    );
  }

  void _callback(bool isSuccess, String message, String orderID){
    if(isSuccess){
      // it should be a Confirmation for order .. It goes to the confirmation page
      Get.find<CartController>().clear();
      Get.find<CartController>().removeCartSharedPreference();
      Get.find<CartController>().addToHistory();
      if(Get.find<OrderController>().paymentIndex == 0){
        Get.offNamed(RouteHelper.getOrderSuccessPage(orderID, "success"));
      }else{
        Get.offNamed(RouteHelper.getPaymentPage(orderID, Get.find<UserController>().userInfoModel!.id));
      }
    }else{
      showCustomSnackBar(message);
    }
  }
}
