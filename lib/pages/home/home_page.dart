import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constance.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/language_controller.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_big_text.dart';
import '../../widgets/custom_small_text.dart';
import 'advertisement_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller2 = HomeController();

  late double yOffset;
  late double xOffset;
  late double scaleFactor;
  late bool isDrawerOpen;

  void openLeftDrawer() =>
      setState(() {
        xOffset = 260;
        yOffset = 100;
        scaleFactor = 0.6;
        isDrawerOpen = true;
      });

  void openRightDrawer() =>
      setState(() {
        xOffset = -220;
        yOffset = 60;
        scaleFactor = 0.8;
        isDrawerOpen = true;
      });

  @override
  Widget build(BuildContext context) {
    // var controller2;
    return GetBuilder<LocalizationController>(builder: (localizationController) {
      return Container(
        margin: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height10),
        padding: EdgeInsets.only(left: Dimensions.width5 / 20, right: Dimensions.width5 / 20),
        //color: Colors.red,
        child: Stack(
          children: <Widget>[
            //showing the header
            AnimatedPositioned(
              duration: panelTransition,
              top: controller2.homeState == HomeState.normal ? 0 : -headerHeight,
              right: 5,
              left: 5,
              height: headerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Center(
                  //   child: Container(
                  //     width: Dimensions.height45,
                  //     height: Dimensions.height45,
                  //     child: Lottie.asset('assets/search.json'),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(Dimensions.radius15),
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  InkWell(
                    child: SizedBox(
                      height: Dimensions.height30 + 2,
                      width: Dimensions.width30 + 2,
                      // child: Lottie.asset('assets/search.json'),
                      child: const Icon(Icons.menu),
                    ),
                    onTap: () {
                      localizationController.selectedIndex == 1 ?
                      openLeftDrawer() : openRightDrawer();
                      // setState(() {
                      //   if(isCollapsed){
                      //     _controller!.forward();
                      //   } else {
                      //     _controller!.reverse();
                      //   }
                      //   isCollapsed = !isCollapsed;
                      // },
                      // );
                    },
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     const SizedBox(height: 5,),
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         Get.updateLocale(const Locale('en', 'US'),);
                  //       },
                  //       child: Text('button_1'.tr),
                  //     ),
                  //     const SizedBox(width: 2,),
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         Get.updateLocale(const Locale('ar', 'EG'),);
                  //       },
                  //       child: Text('button_2'.tr),
                  //     ),
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        CustomBigText(
                          text: "Country".tr,
                          color: primaryColor,
                        ),
                        Row(
                          children: [
                            CustomSmallText(text: "City".tr),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //const Icon(Icons.search_rounded, color: Colors.black87,),
                  //const Text(
                  //    "الصفحة الرئيسية", style: TextStyle(fontSize: 24, color: Colors.black87) ),
                  InkWell(
                    child: SizedBox(
                      height: Dimensions.height30 + 2,
                      width: Dimensions.width30 + 2,
                      // child: Lottie.asset('assets/menu.json'),
                      child: const Icon(Icons.search),
                    ),
                    onTap: () {
                      openRightDrawer();
                      // setState(() {
                      //   // if(isCollapsed){
                      //   //   _controller!.forward();
                      //   // } else {
                      //   //   _controller!.reverse();
                      //   // }
                      //   // isCollapsed = !isCollapsed;
                      // },
                      // );
                    },
                  ),
                ],
              ),
            ),
            //showing the body
            AnimatedPositioned(
              duration: panelTransition,
              top: controller2.homeState == HomeState.normal
                  ? headerHeight / 1.1
                  : -(Dimensions.screenHeight - cartBarHeight * 2 -
                  headerHeight),
              right: 0,
              left: 0,
              height: Dimensions.screenHeight - headerHeight -
                  cartBarHeight / 1.5,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width5 * 0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                ),
                height: Dimensions.height45 * 15,
                child: const SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: AdvertisementView(),
                ),
                //             child: GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
                // return ListView.separated(
                //               separatorBuilder: (BuildContext context, int index) {return const SizedBox(width: 0);},
                //               itemCount: 1,
                //               itemBuilder: (context, index) {
                //                 return AdvertisementView(pageId: index,);
                //               },
                //             );}
                //           ),
              ),
            )
          ],
        ),
      );
    });
  }
}
