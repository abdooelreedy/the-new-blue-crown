import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:theblue_crown/controllers/language_controller.dart';
import 'package:theblue_crown/drawer/drawer_items1.dart';
import 'package:theblue_crown/widgets/custom_small_text.dart';

import '../controllers/auth_controller.dart';
import '../controllers/user_controller.dart';
import '../utils/dimensions.dart';
import '../widgets/app_icon.dart';
import 'drawer_item.dart';
import 'drawer_items2.dart';

class DrawerWidget extends StatelessWidget {

  final ValueChanged<DrawerItem> onSelectedItem;

  const DrawerWidget({Key? key, required this.onSelectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        buildDrawerItems(context),
      ],
    ),
  );

  Widget buildDrawerItems(BuildContext context) {

    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();

    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1.1,
          // height: Dimensions.screenHeight,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: const AssetImage('assets/images/a00e0b1db85dd13a098a0104f4d4cf83.jpg'),
          //     fit: BoxFit.cover,
          //     colorFilter: ColorFilter.mode(
          //         Colors.black.withOpacity(0.5),
          //         BlendMode.darken,
          //     ),
          //   ),
          // ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.0),
              ),
            ),
          ),
        ),
        GetBuilder<LocalizationController>(builder: (localizationController) {
          return Column(
            children: [
              GetBuilder<UserController>(builder: (userController){
                return _userLoggedIn ? (
                    userController.isLoading ? Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.width25, vertical: 0),
                          // color: Colors.green,
                          // alignment: Alignment.topRight,
                          child: AppIcon(
                            icon: Icons.person,
                            backgroundColor: Colors.transparent,
                            iconColor: Colors.white,
                            iconsize: Dimensions.height30,
                            size: Dimensions.height45,
                          ),
                        ),
                        SizedBox(width: Dimensions.width10,),
                        Padding(
                          padding: EdgeInsets.only(top: Dimensions.height30),
                          child: CustomSmallText(
                            text: userController.userInfoModel!.fName,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ) : Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.width25, vertical: 0),
                          // color: Colors.red,
                          // alignment: Alignment.topRight,
                          child: AppIcon(
                            icon: Icons.person,
                            backgroundColor: Colors.transparent,
                            iconColor: Colors.white,
                            iconsize: Dimensions.height30,
                            size: Dimensions.height45,
                          ),
                        ),
                        Container()
                      ],
                    )
                ) : Container();
              }
              ),
              SizedBox(height: 100,),

              localizationController.selectedIndex == 0 ?
              Column(
                children: DrawerItems1.all.map((item) => ListTile(
                  horizontalTitleGap: Dimensions.width5 / 5,
                  contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.width25, vertical: 0),
                  leading: Icon(item.icon, color: Colors.white,),
                  title: Text(
                    item.title,
                    style: TextStyle(color: Colors.white, fontSize:Dimensions.font16),
                  ),
                  onTap: () => onSelectedItem(item),
                )).toList(),
              ) :
              Column(
                children: DrawerItems2.all.map((item) => ListTile(
                  horizontalTitleGap: Dimensions.width5 / 5,
                  contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.width25, vertical: 0),
                  leading: Icon(item.icon, color: Colors.white,),
                  title: Text(
                    item.title,
                    style: TextStyle(color: Colors.white, fontSize:Dimensions.font16),
                  ),
                  onTap: () => onSelectedItem(item),
                )).toList(),
              ),
            ],
          );
        }),
      ],
    );
  }
}
