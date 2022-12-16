import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/constance.dart';
import 'package:theblue_crown/controllers/home_controller.dart';
import 'package:theblue_crown/controllers/language_controller.dart';
import 'package:theblue_crown/pages/account/account_page.dart';
import 'package:theblue_crown/pages/auth/sign_in_page.dart';
import 'package:theblue_crown/pages/auth/sign_up_page.dart';
import 'package:theblue_crown/pages/cart/cart_page.dart';
import 'package:theblue_crown/pages/cart/cart_short_view.dart';
import 'package:theblue_crown/pages/home/test.dart';
import 'package:theblue_crown/pages/home/test2.dart';
import 'package:theblue_crown/pages/home/wallet_view.dart';
import 'package:theblue_crown/pages/order/order_page.dart';
import 'package:theblue_crown/utils/dimensions.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/location_controller.dart';
import '../../drawer/drawer_item.dart';
import '../../drawer/drawer_items1.dart';
import '../../drawer/drawer_items2.dart';
import '../../drawer/drawer_widget.dart';
import '../../routes/route_helper.dart';
import '../../widgets/account_widget.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/custom_big_text.dart';
import '../../widgets/custom_small_text.dart';
import '../account/account_page.dart';
import '../address/add_address_page.dart';
import '../cart/cart_history.dart';
import '../cart/cart_page.dart';
import '../language/language_view.dart';
import '../settings/settings.dart';
import '../sign_in_with_facebook.dart';
import 'advertisement_view.dart';
import 'company_or_factory_file/company_or_factory_view.dart';
import 'home_page.dart';
import 'offers_view.dart';

const Color backgroundColor =  Colors.blue;

class HomeView extends StatefulWidget {

  // final VoidCallback openDrawer;

  const HomeView({
    Key? key,
    // required this.openDrawer
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {

  final controller2 = HomeController();
  bool isCollapsed = true;
  double? screenWidth;
  double? screenHeight;
  final Duration duration = const Duration(milliseconds: 200);

  // AnimationController? _controller;
  // late Animation<double> _scaleAnimation, _smallScaleAnimation, _verySmallScaleAnimation;
  // late Animation<double> _menuScaleAnimation;
  // late Animation<Offset> _slideAnimation;
  late double _height;
  // final _duration = const Duration(milliseconds: 750);
  final _psudoDuration = const Duration(milliseconds: 150);


  // _navigate() async {
  //   //Animate screen container from bottom to top
  //   await _animateContainerFromBottomToTop();
  //
  //   await Navigation.push(
  //     context,
  //     customPageTransition: PageTransition(
  //       child: const CompanyOrFactoryView(),
  //       type: PageTransitionType.fadeIn,
  //     ),
  //   );
  //
  //   await _animateContainerFromTopToBottom();
  // }

  // void _onVerticalGesture(DragUpdateDetails details) {
  //   if (details.primaryDelta! < -0.7) {
  //     controller2.ChangeHomeState(HomeState.cart);
  //   } else if (details.primaryDelta! > 12) {
  //     controller2.ChangeHomeState(HomeState.normal);
  //   }
  // }

  // Future<void> _loadResource() async {
  //   await Get.find<PopularProductController>().getPopularProductList();
  //   await Get.find<RecommendedProductController>().getRecommendedProductList();
  // }

  // _animateContainerFromBottomToTop() async {
  //   //Animate back to default value
  //   _height = MediaQuery
  //       .of(context)
  //       .padding
  //       .top + 50;
  //   setState(() {});
  //
  //   //Wait till animation is finished
  //   await Future.delayed(_duration);
  // }

  _animateContainerFromTopToBottom() async {
    //Wait
    await Future.delayed(_psudoDuration);

    //Animate from top to bottom
    _height = MediaQuery
        .of(context)
        .size
        .height;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //Default height
    _height = 0;
    setState(() {});

    //Animate Container from Top to bottom
    Timer(const Duration(milliseconds: 50), () {
      _animateContainerFromTopToBottom();
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(vsync: this, duration: duration);
  //   _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller!);
  //   _smallScaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller!);
  //   _verySmallScaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller!);
  //   _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller!);
  //   _slideAnimation = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0)).animate(_controller!);
  // }

  @override
  void dispose() {
    // _controller!.dispose();
    super.dispose();
  }

  DateTime timeBackPressed = DateTime.now();


  late double yOffset;
  late double xOffset;
  late double scaleFactor;
  // late double yOffset2;
  // late double xOffset2;
  // late double scaleFactor2;
  // late bool isCartOpen;
  late bool isDrawerOpen;
  bool isDragging = false;
  DrawerItem item1 = DrawerItems1.home;
  DrawerItem item2 = DrawerItems2.home;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    closeDrawer();
    // closeCart();
  }

  void closeDrawer() =>
      setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  void openLeftDrawer() =>
      setState(() {
        xOffset = -220;
        yOffset = 60;
        scaleFactor = 0.8;
        isDrawerOpen = true;
      });

  void openRightDrawer() =>
      setState(() {
        xOffset = 300;
        yOffset = 60;
        scaleFactor = 0.8;
        isDrawerOpen = true;
      });

  // void closeCart () => setState(() {
  //   yOffset2 = 720;
  //   xOffset2 = 0;
  //   scaleFactor2 = 1;
  //   isCartOpen = false;
  // });
  //
  // void openCart () => setState(() {
  //   yOffset2 = 60;
  //   xOffset2= 0;
  //   scaleFactor2 = 1;
  //   isCartOpen = true;
  // });

  DateTime pre_backpress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // height: Dimensions.screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: const AssetImage('assets/images/a00e0b1db85dd13a098a0104f4d4cf83.jpg'),
                image: const AssetImage('assets/images/background of drawer.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            //resizeToAvoidBottomInset : false,
            //body: SingleChildScrollView(
            // backgroundColor: Colors.blue,
            body: AnimatedBuilder(
                animation: controller2,
                builder: (context, snapshot) {
                  return LayoutBuilder(
                      builder: (context, BoxConstraints constraints) {
                        return
                          // Stack(
                          // children: [
                          Stack(
                            children: [
                              // menu(context),
                              buildDrawer(),
                              buildPage1(),
                              buildPage2(),
                              buildPage3(),
                              customcartview (context, constraints, controller2),
                            ],
                          );
                        // customcartview (context, constraints, controller2),
                        // buildCart(),
                        // ],
                        // );
                        //   Stack(
                        //   children: <Widget>[
                        //     menu(context),
                        //     dashboard(context),
                        //     dashboard2(context),
                        //     dashboard3(context, constraints),
                        //     customcartview (context, constraints, controller2),
                        //   ],
                        // );
                      }
                  );
                }
            ),
          ),
    ]);
  }

  Widget buildDrawer() =>
      GetBuilder<LocalizationController>(builder: (localizationController) {
  return SafeArea(
        child: localizationController.selectedIndex == 0 ? DrawerWidget(
          onSelectedItem: (item) {
            setState(() => this.item1 = item);
            closeDrawer();
          },
        ) : DrawerWidget(
          onSelectedItem: (item) {
            setState(() => this.item2 = item);
            closeDrawer();
          },
        ),
      ); });

  /*
  Widget menu (context) {

    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
      //print("User has logged in");
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[

        //select image
        GetBuilder<ImageController>(builder:(imageController) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => imageController.pickImage(),
                  child: SizedBox(
                    width: Dimensions.width30 * 4,
                    child: const Center(
                      child: CustomSmallText(
                        text: 'Select An Image',
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  // width: double.infinity,
                  width: Dimensions.width30 * 5,
                  height: Dimensions.height45 * 2.5,
                  color: Colors.grey[300],
                  child: Get.find<ImageController>().pickedFile != null
                      ? Image.file(File(Get.find<ImageController>().pickedFile!.path),
                    // width: Dimensions.width30 * 3.5,
                    // height: Dimensions.height45 * 2.5,
                    fit: BoxFit.fill,
                  )
                      : const Center(child: Text('Please select an image')),
                )
              ]
          );
        }
        ),
        SizedBox(height: Dimensions.height10 / 2),

        //upload image to server
        GetBuilder<ImageController>(builder:(_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: Dimensions.width30 * 4,
                child: GestureDetector(
                  // child: const Text('Server upload'),
                  //onPressed: _openImagePicker,
                  child: const Center(
                    child: CustomSmallText(
                      text: 'Server upload',
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  onTap:()=> Get.find<ImageController>().upload(),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: Dimensions.width30 * 5,
                height: Dimensions.height45 * 2.5,
                color: Colors.grey[300],
                child: Get.find<ImageController>().imagePath != null
                    ? Image.network(
                  "http://mvs.bslmeiyu.com"
                      // "http://10.0.2.2:8000"
                      +Get.find<ImageController>().imagePath!,
                  // width: 100, height: 100,
                  fit: BoxFit.fill,
                )
                    : const Center(child: Text('No image from server')),
              ),
            ],
          );
        }
        ),
      ],
    );
  }
*/
  Widget buildPage1() {
    return GetBuilder<LocalizationController>(builder: (localizationController){
      return Padding(
        padding: EdgeInsets.only(top: Dimensions.height45),
        child: SizedBox(
          height: Dimensions.height45 * 16,
          width: Dimensions.width30 * 7.5,
          child: AnimatedContainer(
            transform: Matrix4.translationValues(
                localizationController.selectedIndex == 1 ?
                xOffset :
                xOffset / 1.15,
                yOffset, 0)..scale(scaleFactor),
            duration: const Duration(milliseconds: 250),
            child: AbsorbPointer(
              absorbing: isDrawerOpen,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isDrawerOpen ? Dimensions.radius20 : 0),
                child: Container(color: isDrawerOpen ? Colors.white10 : Theme.of(context).scaffoldBackgroundColor,),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget buildPage2() {
    return GetBuilder<LocalizationController>(builder: (localizationController){
      return Padding(
        padding: EdgeInsets.only(top: Dimensions.height20),
          child: SizedBox(
            height: Dimensions.height45 * 17.4,
            width: Dimensions.width30 * 10.5,
            child: AnimatedContainer(
              transform: Matrix4.translationValues(
                  localizationController.selectedIndex == 1 ?
                  xOffset :
                  xOffset / 1.08,
                  yOffset, 0)..scale(scaleFactor),
              duration: const Duration(milliseconds: 250),
              child: AbsorbPointer(absorbing: isDrawerOpen,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(isDrawerOpen ? Dimensions.radius20 : 0),
                  child: Container(color: isDrawerOpen ? Colors.white38 : Theme.of(context).scaffoldBackgroundColor,),
                ),
              ),
            ),
          ),
        );
    });
  }

  Widget buildPage3() {
    return GetBuilder<LocalizationController>(builder: (localizationController){
      return WillPopScope(
          onWillPop: () async {
            if(HomeState.cart == true) {
              controller2.ChangeHomeState(HomeState.normal);
              return false;
            } else if (isDrawerOpen){
              closeDrawer();
              return false;
            } else if (item1 != DrawerItems1.home || item2 != DrawerItems2.home) {
              Navigator.pushReplacementNamed(context, "/initial");
              return false;
            }
            else {
              final timeGap = DateTime.now().difference(pre_backpress);
              final cantExit = timeGap >= const Duration(seconds: 2);
              pre_backpress = DateTime.now();
              if(cantExit){
                //show snackbar
                final snack = SnackBar(content: Text('Press_Back_Button_Again_To_Exit'.tr),duration: const Duration(seconds: 1),);
                ScaffoldMessenger.of(context).showSnackBar(snack);
                return false; // false will do nothing when back press
              }else{
                exit(0);
                return true;   // true will exit the app
              }
            }
          },
          child: GestureDetector(
            onTap: closeDrawer,
            onHorizontalDragStart: (details) => isDragging = true,

            onHorizontalDragUpdate: (details) {
              if (!isDragging) return;
              const delta = 1;

              // if (details.delta.dx < delta) {
              //   openRightDrawer();
              // } else if (details.delta.dx > -delta) {
              //   closeDrawer();
              // }

              localizationController.selectedIndex == 0 ?
              details.delta.dx > delta ? openRightDrawer() : closeDrawer() :
              details.delta.dx < delta ? openLeftDrawer() : closeDrawer();

              isDragging = false;
            },


            child: Container(
              // color: isDrawerOpen ? Colors.white10 : Theme.of(context).scaffoldBackgroundColor,
              // color: Colors.blue,
              // child: getDrawerPage(),
              child: AnimatedContainer(
                transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
                duration: const Duration(milliseconds: 250),
                child: AbsorbPointer(
                  absorbing: isDrawerOpen,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(isDrawerOpen ? Dimensions.radius20 : 0),
                    child: Container(
                      color: isDrawerOpen ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                      // color: Colors.white,
                      // child: getDrawerPage(),
                      child: localizationController.selectedIndex == 0 ? getDrawerPage1() : getDrawerPage2(),
                    ),
                  ),
                ),
              ),
            ),
          )
      );
    });
  }

  Widget getDrawerPage1() {
    switch (item1) {
      case DrawerItems1.orderPage:
        return const OrderPage();
      case DrawerItems1.orderHistory:
        return const CartHistory();
      case DrawerItems1.wallet:
        return const WalletView();
      case DrawerItems1.notifications:
        return  Test2();
      case DrawerItems1.complaints_and_suggestions:
        return const AccountPage();
      case DrawerItems1.profile:
        return const AccountPage();
      case DrawerItems1.settings:
        // return const SettingsView();
        return const LanguageView();
      case DrawerItems1.offers:
        return OffersView();
      case DrawerItems1.logout:
        return SignInPage();
        // return GestureDetector(
        //   onTap: (){
        //     if(Get.find<AuthController>().userLoggedIn()){
        //       Get.find<AuthController>().clearSharedData();
        //       Get.find<CartController>().clear();
        //       Get.find<CartController>().clearCartHistory();
        //       Get.find<LocationController>().clearAddressList();
        //       Get.offNamed(RouteHelper.getSignInPage());
        //     }else{
        //       print("you logged out");
        //     }
        //   },
        //   child: AccountWidget(
        //     appIcon: AppIcon(
        //       icon: Icons.logout,
        //       backgroundColor: Colors.redAccent,
        //       iconColor: Colors.white,
        //       iconsize: Dimensions.height10 * 5 / 2,
        //       size: Dimensions.height10 * 5,
        //     ),
        //     bigText: CustomBigText(
        //       text: "Logout".tr,
        //     ),
        //   ),
        // );
      case DrawerItems1.home:
      default:
        return const HomePage();
    }
  }

  Widget getDrawerPage2() {
    switch (item2) {
      case DrawerItems2.orderPage:
        return const OrderPage();
      case DrawerItems2.orderHistory:
        return const CartHistory();
      case DrawerItems2.wallet:
        return const WalletView();
      case DrawerItems2.notifications:
        return Test();
      case DrawerItems2.complaints_and_suggestions:
        return  Test2();
      case DrawerItems2.profile:
        return const AccountPage();
      case DrawerItems2.settings:
      // return const SettingsView();
        return const LanguageView();
      case DrawerItems2.offers:
        return OffersView();
      case DrawerItems2.logout:
        return SignInPage();
    // return GestureDetector(
    //   onTap: (){
    //     if(Get.find<AuthController>().userLoggedIn()){
    //       Get.find<AuthController>().clearSharedData();
    //       Get.find<CartController>().clear();
    //       Get.find<CartController>().clearCartHistory();
    //       Get.find<LocationController>().clearAddressList();
    //       Get.offNamed(RouteHelper.getSignInPage());
    //     }else{
    //       print("you logged out");
    //     }
    //   },
    //   child: AccountWidget(
    //     appIcon: AppIcon(
    //       icon: Icons.logout,
    //       backgroundColor: Colors.redAccent,
    //       iconColor: Colors.white,
    //       iconsize: Dimensions.height10 * 5 / 2,
    //       size: Dimensions.height10 * 5,
    //     ),
    //     bigText: CustomBigText(
    //       text: "Logout".tr,
    //     ),
    //   ),
    // );
      case DrawerItems2.home:
      default:
      return const HomePage();
    }
  }

  /*
  Widget dashboard (context) {
    return AnimatedPositioned(
      top: -45,
      bottom: -20,
      left: isCollapsed ? 0.0 : -0.50 * screenWidth!,
      right: isCollapsed ? 0.0 : 0.50 * screenWidth!,
      duration: duration,
      child: ScaleTransition(
        scale: _verySmallScaleAnimation,
        child: RefreshIndicator(
        child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          elevation: 8,
          color: Colors.grey[500],
          child: Container(
            color: Colors.grey[500],
            margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
          ),
        ),
          onRefresh: _loadResource,
        ),
      ),
    );
  }
  Widget dashboard2 (context) {
    return AnimatedPositioned(
      top: -35,
      bottom: -10,
      left: isCollapsed ? 0.0 : -0.60 * screenWidth!,
      right: isCollapsed ? 0.0 : 0.60 * screenWidth!,
      duration: duration,
      child: ScaleTransition(
        scale: _smallScaleAnimation,
        child: RefreshIndicator(
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            elevation: 8,
            color: Colors.grey[400],
            child: Container(
              color: Colors.grey[400],
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
            ),
          ),
          onRefresh: _loadResource,
        ),
      ),
    );
  }
  */
  /*
  Widget dashboard3 (context, BoxConstraints constraints) {

    List<int> list = [0, 1, 2, 3];
    list[0];

    return AnimatedPositioned(
      top: -20,
      bottom: 1,
      left: isCollapsed ? 0 : -0.7 * screenWidth!,
      right: isCollapsed ? 0 : 0.7 * screenWidth!,
      duration: duration,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: RefreshIndicator(
          child: Material(
            borderRadius: isCollapsed ? const BorderRadius.all(Radius.circular(0)) : const BorderRadius.all(Radius.circular(20)),
            elevation: 8,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45 / 0.7, bottom: Dimensions.height30 * 2),
              padding: EdgeInsets.only(left: Dimensions.width5 / 20, right: Dimensions.width5 / 20),
              //color: Colors.red,
              child: Stack(
                children: <Widget>[
                  //showing the header
                  AnimatedPositioned(
                    duration: panelTransition,
                    top: controller2.homeState == HomeState.normal
                        ? 0
                        : -headerHeight,
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
                              child: Lottie.asset('assets/search.json'),
                            ),
                            onTap: () {
                              setState(() {
                                if(isCollapsed){
                                  _controller!.forward();
                                } else {
                                  _controller!.reverse();
                                }
                                isCollapsed = !isCollapsed;
                              },
                              );
                            },
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10,),
                            ElevatedButton(
                              onPressed: () {
                                Get.updateLocale( const Locale('en', 'US'),);
                              },
                              child: Text('button_1'.tr),
                            ),
                            const SizedBox(width: 2,),
                            ElevatedButton(
                              onPressed: () {
                                Get.updateLocale( const Locale('ar', 'EG'),);
                              },
                              child: Text('button_2'.tr),
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 20),
                        //   child: Column(
                        //     children: [
                        //       CustomBigText(
                        //         text: "Country",
                        //         color: primaryColor,
                        //       ),
                        //       Row(
                        //         children: const [
                        //           CustomSmallText(text: "City"),
                        //           Icon(Icons.arrow_drop_down),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //const Icon(Icons.search_rounded, color: Colors.black87,),
                        //const Text(
                        //    "الصفحة الرئيسية", style: TextStyle(fontSize: 24, color: Colors.black87) ),
                        InkWell(
                          child: SizedBox(
                            height: Dimensions.height30 + 2,
                              width: Dimensions.width30 + 2,
                              child: Lottie.asset('assets/menu.json'),
                          ),
                          onTap: () {
                            setState(() {
                              if(isCollapsed){
                                _controller!.forward();
                              } else {
                                _controller!.reverse();
                              }
                              isCollapsed = !isCollapsed;
                            },
                            );
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
                        : -(constraints.maxHeight - cartBarHeight * 2 - headerHeight),
                    right: 0,
                    left: 0,
                    height: constraints.maxHeight - headerHeight - cartBarHeight / 1.5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width5*0),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )
                      ),
                      height: Dimensions.height45 * 15,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: AdvertisementView(
                          // pageId: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          onRefresh: _loadResource,
        ),
      ),
    );
  }
  */
  // Widget buildCart() {
  //   return WillPopScope(
  //     onWillPop: () async {
  //       if(isCartOpen) {
  //         closeCart();
  //         return false;
  //       }else {
  //         return true;
  //       }
  //     },
  //     child: GestureDetector(
  //       onTap: openCart,
  //       // onTap: () => showModalBottomSheet(
  //       //   shape: const RoundedRectangleBorder(
  //       //       borderRadius: BorderRadius.vertical(top: Radius.circular(20))
  //       //   ),
  //       //   isScrollControlled: true,
  //       //   context: context,
  //       //   builder:  (context) => buildSheet(),
  //       // ),
  //       onVerticalDragStart: (details) => isDragging = true,
  //       onVerticalDragUpdate: (details) {
  //
  //         if(!isDragging) return;
  //
  //         const delta = 1;
  //         if(details.delta.dy < delta) {
  //           openCart();
  //           // showModalBottomSheet(
  //           //     shape: const RoundedRectangleBorder(
  //           //       borderRadius: BorderRadius.vertical(top: Radius.circular(20))
  //           //     ),
  //           //     isScrollControlled: true,
  //           //     context: context,
  //           //     builder:  (context) => buildSheet(),
  //           // );
  //         }else if (details.delta.dy > -delta){
  //           closeCart();
  //         }
  //
  //         isDragging = false;
  //
  //       },
  //       child: Padding(
  //         padding: EdgeInsets.only(/*isCartOpen ? top: Dimensions.height45 :*/ top: Dimensions.screenHeight - Dimensions.bottomHeightBar),
  //         child: Container(
  //           height: Dimensions.height45 * 2,
  //           width: double.maxFinite,
  //           child: isCartOpen ? const CartPage() : CardShortView(),
  //           // child: CardShortView(),
  //         ),
  //       ),
  //           ),
  //           // ),
  //         // ),
  //       // ),
  //     // )
  //   );
  //   // return Padding(
  //   //     padding: EdgeInsets.only(top: Dimensions.screenHeight - Dimensions.bottomHeightBar / 2),
  //   //   child: Container(
  //   //     // duration: const Duration(milliseconds: 200),
  //   //     // transform: Matrix4.translationValues(xOffset2, yOffset2, 0)..scale(scaleFactor2),
  //   //     height: 100,
  //   //     width: double.maxFinite,
  //   //     color: Colors.red,
  //   //     child: isCartOpen ? const CartPage() : CardShortView(),
  //   //   ),
  //   // );
  // }

  Widget customcartview (context, BoxConstraints constraints, HomeController controller2){
    return WillPopScope(
      onWillPop: () async {
        if(HomeState.cart == true) {
          controller2.ChangeHomeState(HomeState.normal);
          return false;
        }else {
          return true;
        }
      },
      child: AnimatedPositioned(
        duration: panelTransition,
        bottom: 0,
        right: 0,
        left: 0,
        height: controller2.homeState == HomeState.normal ? Dimensions.cartBarHeight : (constraints.maxHeight - Dimensions.cartBarHeight),
        child: GestureDetector(
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) => buildSheet(),
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimensions.radius20),
              ),
            ),
          ),
          // onVerticalDragUpdate: _onVerticalGesture,
          onVerticalDragStart: (details) => isDragging = true,
          onVerticalDragUpdate: (details) {

            if(!isDragging) return;

            const delta = 1;
            if(details.delta.dy < delta) {
              showModalBottomSheet(
                context: context,
                builder: (context) => buildSheet(),
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Dimensions.radius20),
                  ),
                ),
              );
            } else if (details.delta.dy > -delta){
              controller2.ChangeHomeState(HomeState.normal);
            }

            isDragging = false;

          },
          child: Container(
            // padding: const EdgeInsets.all(0.01),
            child: controller2.homeState == HomeState.normal
                ? CardShortView(controller2: controller2)
                : const CartPage(),
          ),
        ),
      ),
    );
  }
  Widget buildSheet() => SizedBox(
    height: Dimensions.height45 * 17,
    // color: Colors.transparent,
    child: const CartPage(),
  );
}



