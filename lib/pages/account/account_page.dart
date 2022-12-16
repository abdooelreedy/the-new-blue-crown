import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:theblue_crown/base/custom_loader.dart';
import 'package:theblue_crown/controllers/auth_controller.dart';
import 'package:theblue_crown/controllers/cart_controller.dart';
import 'package:theblue_crown/controllers/location_controller.dart';
import 'package:theblue_crown/controllers/user_controller.dart';
import 'package:theblue_crown/pages/home/comment_page.dart';
import 'package:theblue_crown/routes/route_helper.dart';
import 'package:theblue_crown/utils/dimensions.dart';
import 'package:theblue_crown/widgets/account_widget.dart';
import 'package:theblue_crown/widgets/app_icon.dart';
import 'package:theblue_crown/widgets/custom_big_text.dart';
import 'package:get/get.dart';

import '../../base/custom_app_bar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> with SingleTickerProviderStateMixin{

  //Lottie section
  late final AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 2),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  bool inClicked = false;



  @override
  Widget build(BuildContext context) {

    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
      Get.find<LocationController>().getAddressList();
      print("User has logged in");
    }

    return WillPopScope(
      onWillPop: () async {
        Get.toNamed(RouteHelper.getInitial());
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: "Profile".tr,
        ),
        body: GetBuilder<UserController>(builder: (userController){
          return _userLoggedIn ?
          (userController.isLoading ?
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: Dimensions.height20),
            child: Column(
              children: [
                //profile icon
                AppIcon(
                  icon: Icons.person,
                  backgroundColor: Colors.blueAccent,
                  iconColor: Colors.white,
                  iconsize: Dimensions.height45 + Dimensions.height30,
                  size: Dimensions.height15 * 10,
                ),
                SizedBox(height: Dimensions.height30,),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        //name
                        AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.person,
                            backgroundColor: Colors.blueAccent,
                            iconColor: Colors.white,
                            iconsize: Dimensions.height10 * 5 / 2,
                            size: Dimensions.height10 * 5,
                          ),
                          bigText: CustomBigText(
                            text: userController.userInfoModel!.fName,
                          ),
                        ),
                        SizedBox(height: Dimensions.height30,),
                        //phone
                        AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.phone,
                            backgroundColor: Colors.yellow,
                            iconColor: Colors.white,
                            iconsize: Dimensions.height10 * 5 / 2,
                            size: Dimensions.height10 * 5,
                          ),
                          bigText: CustomBigText(
                            text: userController.userInfoModel!.phone,
                          ),
                        ),
                        SizedBox(height: Dimensions.height30,),
                        //email
                        AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.email,
                            backgroundColor: Colors.yellow,
                            iconColor: Colors.white,
                            iconsize: Dimensions.height10 * 5 / 2,
                            size: Dimensions.height10 * 5,
                          ),
                          bigText: CustomBigText(
                            text: userController.userInfoModel!.email,
                          ),
                        ),
                        SizedBox(height: Dimensions.height30,),
                        //address
                        GetBuilder<LocationController>(builder: (locationController){
                          if(_userLoggedIn && locationController.addressList.isEmpty){
                          return GestureDetector(
                            onTap: (){
                              Get.offNamed(RouteHelper.getAddAddressPage());
                            },
                            child: AccountWidget(
                              appIcon: AppIcon(
                                icon: Icons.location_on,
                                backgroundColor: Colors.yellow,
                                iconColor: Colors.white,
                                iconsize: Dimensions.height10 * 5 / 2,
                                size: Dimensions.height10 * 5,
                              ),
                              bigText: CustomBigText(
                                text: "Fill_In_Your_Address".tr,
                              ),
                            ),
                          );
                            }else{
                              return GestureDetector(
                                onTap: (){  Get.offNamed(RouteHelper.getAddAddressPage());  },
                                child: AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.location_on,
                                    backgroundColor: Colors.yellow,
                                    iconColor: Colors.white,
                                    iconsize: Dimensions.height10 * 5 / 2,
                                    size: Dimensions.height10 * 5,
                                  ),
                                  bigText: CustomBigText(
                                    text: "Your_Address".tr,
                                  ),
                                ),
                              );
                            }
                          }
                          ),
                        SizedBox(height: Dimensions.height30,),
                        //message
                        GestureDetector(
                          onTap: (){
                            // Get.to(() => CommentPage(productId: 22,));
                          },
                          child: AccountWidget(
                            appIcon: AppIcon(
                              icon: Icons.message_outlined,
                              backgroundColor: Colors.redAccent,
                              iconColor: Colors.white,
                              iconsize: Dimensions.height10 * 5 / 2,
                              size: Dimensions.height10 * 5,
                            ),
                            bigText: CustomBigText(
                              text: "Messages".tr,
                            ),
                          ),
                        ),
                        SizedBox(height: Dimensions.height30,),
                        GestureDetector(
                          onTap: (){
                            if(Get.find<AuthController>().userLoggedIn()){
                              Get.find<AuthController>().clearSharedData();
                              Get.find<CartController>().clear();
                              Get.find<CartController>().clearCartHistory();
                              Get.find<LocationController>().clearAddressList();
                              Get.offNamed(RouteHelper.getSignInPage());
                            }else{
                              print("you logged out");
                            }
                          },
                          child: AccountWidget(
                            appIcon: AppIcon(
                              icon: Icons.logout,
                              backgroundColor: Colors.redAccent,
                              iconColor: Colors.white,
                              iconsize: Dimensions.height10 * 5 / 2,
                              size: Dimensions.height10 * 5,
                            ),
                            bigText: CustomBigText(
                              text: "LogOut".tr,
                            ),
                          ),
                        ),
                        SizedBox(height: Dimensions.height30,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ) :
          const CustomLoader()) :
          Center(
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: Dimensions.height20 * 23,
                      margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                      ),
                      child: /*GestureDetector(
                        onTap: (){
                          if(inClicked == false){
                            inClicked = true;
                            _controller.forward();
                          }else{
                            inClicked = false;
                            _controller.reverse();
                          }
                        },
                        child:*/ Lottie.asset(
                            'assets/login.json',
                          //controller: _controller,
                        ),
                      //),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.getSignInPage());
                        },
                      child: Container(
                        width: double.maxFinite,
                        height: Dimensions.height20 * 5,
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                        ),
                        child: Center(
                          child: CustomBigText(
                            text: "Click_Here_To_Sign_In".tr,
                            color: Colors.white,
                            // alignment: Alignment.center,
                            size: Dimensions.font26,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
        }
        ),
      ),
    );
  }
}
