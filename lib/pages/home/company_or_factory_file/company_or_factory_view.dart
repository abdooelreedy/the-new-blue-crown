import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/el_momtaz_labsa_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/super_el_momtaz_labsa_controller.dart';
import 'package:theblue_crown/controllers/replies_controller.dart';
import 'package:theblue_crown/pages/home/company_or_factory_file/product_card.dart';
import 'package:theblue_crown/utils/dimensions.dart';
import 'package:theblue_crown/widgets/custom_small_text.dart';
import '../../../animations/slide_animation.dart';
import '../../../constance.dart';
import '../../../controllers/cart_controller.dart';
import '../../../controllers/controller_lists/category_lists/category_list_view_controller.dart';
import '../../../controllers/controller_lists/category_lists/category_of_texapon_list_view_controller.dart';
import '../../../controllers/controller_lists/product_grids/galaxy_texapon_controller.dart';
import '../../../controllers/controller_lists/product_grids/malaysia_texapon_controller.dart';
import '../../../controllers/controller_lists/product_grids/recommended_product_controller.dart';
import '../../../controllers/controller_lists/product_grids/renotex_texapon_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../../controllers/controller_lists/product_grids/popular_product_controller.dart';
import '../../../controllers/language_controller.dart';
import '../../../controllers/post_controller.dart';
import '../../../routes/route_helper.dart';
import '../../../utils/app_constants.dart';
import '../../../widgets/custom_big_text.dart';
import '../../cart/cart_page.dart';
import '../../cart/cart_short_view.dart';
import 'grid_view_of_Labsa_products.dart';
import 'grid_view_of_texapon_products.dart';
import 'grid_view_of_malaysia_texapon.dart';
import 'grid_view_of_food_products.dart';
import 'grid_view_of_recommended_product.dart';

List<String> name = [
  'ElMomtaz_Labsa',
  'Super_ElMomtaz_Labsa',
  // 'ElMomtaz_Labsa',
  // 'Super_ElMomtaz_Labsa',
];
List<String> categoryIconList = [
  "assets/images/a00e0b1db85dd13a098a0104f4d4cf83.jpg",
  "assets/images/8a4cf7f745404d0ceeea5814b5cc3688.jpg",
  // "assets/images/a00e0b1db85dd13a098a0104f4d4cf83.jpg",
  // "assets/images/8a4cf7f745404d0ceeea5814b5cc3688.jpg",
];

class CompanyOrFactoryView extends StatefulWidget {

  final int pageId ;

  const CompanyOrFactoryView({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  State<CompanyOrFactoryView> createState() => _CompanyOrFactoryViewState();
}

class _CompanyOrFactoryViewState extends State<CompanyOrFactoryView> with TickerProviderStateMixin {

  // DateTime timeBackPressed = DateTime.now();
  final controller2 = HomeController();
  // final _duration = const Duration(milliseconds: 50);
  // final _psudoDuration = const Duration(milliseconds: 150);
  final controller = ScrollController();
  // late double _height;
  int _selectedIndex = 0;

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller2.ChangeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller2.ChangeHomeState(HomeState.normal);
    }
  }

  // _navigate() async {
  //   //Animate screen container from bottom to top
  //   await _animateContainerFromBottomToTop();
  //
  //   await Navigation.push(
  //     context,
  //     customPageTransition: PageTransition(
  //       child: const VendorScreen(),
  //       type: PageTransitionType.fadeIn,
  //     ),
  //   );
  //
  //   await _animateContainerFromTopToBottom();
  // }

  _animateContainerFromBottomToTop() async {
    //Animate back to default value
    // _height = MediaQuery.of(context).padding.top + 50;
    setState(() {});

    //Wait till animation is finished
    // await Future.delayed(_duration);
  }

  _animateContainerFromTopToBottom() async {
    //Wait
    // await Future.delayed(_psudoDuration);

    //Animate from top to bottom
    // _height = MediaQuery.of(context).size.height;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //Default height
    // _height = 0;
    setState(() {});

    //Animate Container from Top to bottom
    Timer(const Duration(milliseconds: 50), () {
      _animateContainerFromTopToBottom();
    });
  }

  // List<String> ElMomtazLabsaImages = [
  //   'assets/products/elmomtaz_labsa_5KG.png',
  //   'assets/products/elmomtaz_labsa_31.5KG.png',
  //   'assets/products/elmomtaz_labsa_63KG.png',
  // ];
  // List<String> SuperElMomtazLabsaImages = [
  //   'assets/products/elmomtaz_labsa_5KG.png',
  //   'assets/products/super_elmomtaz_labsa_31.5KG.png',
  //   'assets/products/super_elmomtaz_labsa_63KG.png',
  // ];

  // String greeting = "???? ?????????? ???????? ???????? ??????????";
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer( Duration(seconds: 1), () {
  //     setState(() {
  //       greeting = "???????? ???????? ??????????";
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // TabController _tabController =
    // TabController(length: 3, vsync: this);

    return Scaffold(
          backgroundColor: Colors.blue,
          body: AnimatedBuilder(
            animation: controller2,
            builder: (context, snapshot) {
              return LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
                  return SlideAnimation(
                    begin: const Offset(0, 400),
                    // duration: _duration,
                    child: Container(
                      // AnimatedContainer(
                      //   // height: _height,
                      //   duration: _duration,
                      //   padding: const EdgeInsets.only(bottom: 0.000001),
                      //   curve: Curves.fastOutSlowIn,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child:
                      Stack(
                        children: [
                          SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [


                                //the header
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(Dimensions.height10 / 2),
                                      height: Dimensions.height45 * 1.8,
                                      width: double.maxFinite,
                                      //color: Colors.red,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: Dimensions.height45,
                                            height: Dimensions.height45,
                                            child: Lottie.asset('assets/search.json'),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius15),
                                              color: Colors.white,
                                            ),
                                          ),

                                          CustomBigText(
                                            text: widget.pageId == 0 ? "Labsa_Class".tr : "?????? ??????????????????",
                                          ),

                                          GestureDetector(
                                            onTap: (){  Get.toNamed(RouteHelper.getInitial());  },
                                            child: const Icon(Icons.arrow_forward),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.height10,),
                                    Container(
                                      //height: Dimensions.height10 / 3,
                                      width: double.maxFinite,
                                      color: Colors.white,
                                      padding: EdgeInsets.only(top: Dimensions.height10 / 2, right: Dimensions.height20, left: Dimensions.height20),
                                      child: CustomSmallText(
                                        text: "Companies_OR_Factories".tr,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),


                                //the body
                                SizedBox(
                                  // height: Dimensions.height45 * 14,
                                  height: Dimensions.screenHeight,
                                  child: SingleChildScrollView(
                                    physics: const NeverScrollableScrollPhysics(),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        // CategoryListView
                                        GetBuilder<CategoryListViewController>(builder: (categoryListView) {
                                          return GetBuilder<CategoryOfTexaponListViewController>(builder: (categoryOfTexaponListView) {
                                            return
                                              Container(
                                                color: Colors.white,
                                                height: Dimensions.height45 * 2.75,
                                                child: ListView.builder(
                                                  physics: const BouncingScrollPhysics(),
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
                                                  scrollDirection: Axis.horizontal,
                                                  // itemCount: name.length,
                                                  // itemCount: categoryIconList.length,
                                                  // itemCount: categoryListView.categoryListViewList.length,
                                                  itemCount: widget.pageId == 2 ?
                                                  categoryOfTexaponListView.categoryOfTexaponListViewList.length :
                                                  categoryListView.categoryListViewList.length,
                                                  itemBuilder: (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          _selectedIndex = index;
                                                        });
                                                      },
                                                      child: _selectedIndex == index ?
                                                      SelectedCategoryItem(
                                                        // name: name[index],
                                                        // name: categoryListView.categoryListViewList[index].name!,
                                                        name: widget.pageId == 2 ?
                                                        categoryOfTexaponListView.categoryOfTexaponListViewList[index].name!.tr :
                                                        categoryListView.categoryListViewList[index].name!.tr,
                                                        backgroundColor: Colors.white,
                                                        icon: ClipOval(
                                                          child: SizedBox(
                                                            width: Dimensions.listViewImgSize,
                                                            height: Dimensions.listViewImgSize,
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                              // child: Image.asset(categoryIconList[index]),
                                                              child: CachedNetworkImage(
                                                                // imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + categoryListView.categoryListViewList[index].img!,
                                                                imageUrl: widget.pageId == 2 ?
                                                                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + categoryOfTexaponListView.categoryOfTexaponListViewList[index].img! :
                                                                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + categoryListView.categoryListViewList[index].img!,
                                                                height: Dimensions.listViewImgSize,
                                                                width:Dimensions.listViewImgSize,
                                                                fit: BoxFit.cover,
                                                                placeholder: (context, url) => Container(color: Colors.black12,),
                                                                errorWidget: (context, url, error) => Container(
                                                                  color: Colors.black12,
                                                                  child: const Icon(Icons.error, color: Colors.red),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ) :
                                                      UnSelectedCategoryItem(
                                                        // name: name[index],
                                                        // name: categoryListView.categoryListViewList[index].name!,
                                                        name: widget.pageId == 2 ?
                                                        categoryOfTexaponListView.categoryOfTexaponListViewList[index].name!.tr :
                                                        categoryListView.categoryListViewList[index].name!.tr,
                                                        backgroundColor: Colors.white,
                                                        icon: ClipOval(
                                                          child: SizedBox(
                                                            width: Dimensions.listViewImgSize,
                                                            height: Dimensions.listViewImgSize,
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                              // child: Image.asset(categoryIconList[index]),
                                                              child: CachedNetworkImage(
                                                                // imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + categoryListView.categoryListViewList[index].img!,
                                                                imageUrl: widget.pageId == 2 ?
                                                                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + categoryOfTexaponListView.categoryOfTexaponListViewList[index].img! :
                                                                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + categoryListView.categoryListViewList[index].img!,
                                                                height: Dimensions.listViewImgSize,
                                                                width:Dimensions.listViewImgSize,
                                                                fit: BoxFit.cover,
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
                                                    );
                                                  },
                                                ),
                                              );
                                          },
                                          );
                                        }
                                        ),

                                        // length of products
                                        // GetBuilder<PopularProductController>(builder: (popularProduct){
                                        //   return GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
                                        //     return
                                        //       GetBuilder<SuperElMomtazLabsaController>(builder: (superElMomtazLabsa){
                                        //         return GetBuilder<ElMomtazLabsaController>(builder: (ElMomtazLabsa) {
                                        //
                                        //           // List products = [
                                        //           //   popularProduct.popularProductList.length.toString(),
                                        //           //   recommendedProduct.recommendedProductList.length.toString(),
                                        //           // ];
                                        //           List products = [
                                        //             ElMomtazLabsa.elMomtazLabsaList.length.toString(),
                                        //             superElMomtazLabsa.superElMomtazLabsaList.length.toString(),
                                        //             popularProduct.popularProductList.length.toString(),
                                        //             recommendedProduct.recommendedProductList.length.toString(),
                                        //           ];
                                        //
                                        //           return Container(
                                        //             color: Colors.white,
                                        //               height: Dimensions.height45,
                                        //               child: Padding(
                                        //                 padding: EdgeInsets.only(top: Dimensions.height10,
                                        //                     bottom: Dimensions.height10,
                                        //                     right: Dimensions.width10,
                                        //                     left: Dimensions.width10),
                                        //
                                        //                 child: CustomBigText(
                                        //                   text: "There_Is".tr + products[_selectedIndex] +
                                        //                       (products[_selectedIndex] == "1" ?
                                        //                       "Product".tr : "Products".tr
                                        //                       ),
                                        //                   size: Dimensions.font16,
                                        //                 ),
                                        //                 //color: Colors.red,
                                        //               )
                                        //           );
                                        //         }
                                        //         );
                                        //       }
                                        //       );
                                        //   }
                                        //   );
                                        // }
                                        // ),

                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),

                                        // The Grid View of Products
                                        SizedBox(
                                          height: Dimensions.screenHeight - Dimensions.height45 * 6,
                                          width: double.maxFinite,

                                          // child: indexOfGrid(widget.pageId, _selectedIndex),
                                          child: GetBuilder<ElMomtazLabsaController>(builder: (elMomtazLabsa) {
                                            return GetBuilder<SuperElMomtazLabsaController>(builder: (superElMomtazLabsa) {
                                              return GetBuilder<GalaxyTexaponController>(builder: (galaxyTexapon) {
                                                return GetBuilder<RenotexTexaponController>(builder: (renotexTexapon) {
                                                  return GetBuilder<MalaysiaTexaponController>(builder: (malaysiaTexapon) {
                                                    return GetBuilder<PopularProductController>(builder: (popularProduct) {
                                                      return GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {

                                                        List foodLengths = [
                                                          popularProduct.popularProductList.length,
                                                          recommendedProduct.recommendedProductList.length,
                                                        ];

                                                        List labsaLengths = [
                                                          elMomtazLabsa.elMomtazLabsaList.length,
                                                          superElMomtazLabsa.superElMomtazLabsaList.length,
                                                        ];

                                                        List texaponLengths = [
                                                          galaxyTexapon.galaxyTexaponList.length,
                                                          renotexTexapon.renotexTexaponList.length,
                                                          malaysiaTexapon.malaysiaTexaponList.length,
                                                        ];

                                                        return GridView.builder(
                                                          physics: const BouncingScrollPhysics(),
                                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            childAspectRatio: 1 / 1.35,
                                                            mainAxisSpacing: 8,
                                                            crossAxisSpacing: 8,
                                                          ),
                                                          padding: EdgeInsets.only(
                                                            left: Dimensions.width10,
                                                            right: Dimensions.width10,
                                                            top: Dimensions.height10,
                                                            bottom: Dimensions.cartBarHeight * 1.1,
                                                          ),
                                                          itemCount:
                                                          widget.pageId == 0 ?
                                                          labsaLengths[_selectedIndex] :
                                                          widget.pageId == 2 ? texaponLengths[_selectedIndex] : foodLengths[_selectedIndex],
                                                          itemBuilder: (context, index) {

                                                            List labsa = [
                                                              ElMomtazLabsa(index),
                                                              SuperElMomtazLabsa(index),
                                                            ];

                                                            List texapon = [
                                                              GalaxyTexapon(index),
                                                              RenotexTexapon(index),
                                                              MalaysiaTexapon(index)
                                                            ];

                                                            List food = [
                                                              PopularProduct(index),
                                                              RecommendedProduct(index),
                                                            ];

                                                            return
                                                              widget.pageId == 0 ?
                                                              labsa[_selectedIndex] :
                                                              widget.pageId == 2 ? texapon[_selectedIndex] : food[_selectedIndex];
                                                            // return indexOfGrid(widget.pageId, _selectedIndex);


                                                            // return labsaList(index, index, index);
                                                          },
                                                        );},);});});});});});}),
                                        ),],),),),],),),
                          //the short cart
                          customcartview (context, constraints, controller2),
                        ],),),);},);},),
    );
  }
}
// Widget indexOfGrid(index, s) {
//
//   List labsa = [
//     ElMomtazLabsa(index),
//     SuperElMomtazLabsa(index),
//   ];
//
//   List texapon = [
//     GalaxyTexapon(index),
//     RenotexTexapon(index),
//     MalaysiaTexapon(index)
//   ];
//
//   List food = [
//     PopularProduct(index),
//     RecommendedProduct(index),
//   ];
//
//   switch (index) {
//     case 0:
//       return labsa[s];
//     case 1:
//       return food[s];
//     case 2:
//       return texapon[s];
//     case 3:
//     default: return food[s];
//   }
// }
Widget ElMomtazLabsa (index) {
  return GetBuilder<ElMomtazLabsaController>(builder: (elMomtazLabsa) {

        var product = Get.find<ElMomtazLabsaController>().elMomtazLabsaList[index];
        var subController = elMomtazLabsa;
        var subControllersList = elMomtazLabsa.elMomtazLabsaList[index];
        var image = elMomtazLabsa.elMomtazLabsaList[index].img!;
        var productId = elMomtazLabsa.elMomtazLabsaList[index].id;
        var route =  RouteHelper.getDetailsScreen();

        return ProductCard(
          index: index,
          product: product,
          subController: subController,
          subControllersList: subControllersList,
          image: image,
          productId: productId,
          route: route,
        );
      },);
}
Widget SuperElMomtazLabsa (index) {
  return GetBuilder<SuperElMomtazLabsaController>(builder: (superElMomtazLabsa) {

        var product = Get.find<SuperElMomtazLabsaController>().superElMomtazLabsaList[index];
        var subController = superElMomtazLabsa;
        var subControllersList = superElMomtazLabsa.superElMomtazLabsaList[index];
        var image = superElMomtazLabsa.superElMomtazLabsaList[index].img!;
        var productId = superElMomtazLabsa.superElMomtazLabsaList[index].id;
        var route =  RouteHelper.getDetailsScreen();

        return ProductCard(
          index: index,
          product: product,
          subController: subController,
          subControllersList: subControllersList,
          image: image,
          productId: productId,
          route: route,
        );
      },);
}

Widget GalaxyTexapon (int index) {
  return GetBuilder<GalaxyTexaponController>(builder: (galaxyTexapon) {

        var product = Get.find<GalaxyTexaponController>().galaxyTexaponList[index];
        var subController = galaxyTexapon;
        var subControllersList = galaxyTexapon.galaxyTexaponList[index];
        var image = galaxyTexapon.galaxyTexaponList[index].img!;
        var productId = galaxyTexapon.galaxyTexaponList[index].id;
        var route =  RouteHelper.getDetailsScreen();

        return ProductCard(
          index: index,
          product: product,
          subController: subController,
          subControllersList: subControllersList,
          image: image,
          productId: productId,
          route: route,
        );
      },);
}
Widget RenotexTexapon (int index) {
  return GetBuilder<RenotexTexaponController>(builder: (renotexTexapon) {

        var product = Get.find<RenotexTexaponController>().renotexTexaponList[index];
        var subController = renotexTexapon;
        var subControllersList = renotexTexapon.renotexTexaponList[index];
        var image = renotexTexapon.renotexTexaponList[index].img!;
        var productId = renotexTexapon.renotexTexaponList[index].id;
        var route =  RouteHelper.getDetailsScreen();

        return ProductCard(
          index: index,
          product: product,
          subController: subController,
          subControllersList: subControllersList,
          image: image,
          productId: productId,
          route: route,
        );
      },);
}
Widget MalaysiaTexapon (int index) {
  return GetBuilder<MalaysiaTexaponController>(builder: (malaysiaTexapon) {

        var product = Get.find<MalaysiaTexaponController>().malaysiaTexaponList[index];
        var subController = malaysiaTexapon;
        var subControllersList = malaysiaTexapon.malaysiaTexaponList[index];
        var image = malaysiaTexapon.malaysiaTexaponList[index].img!;
        var productId = malaysiaTexapon.malaysiaTexaponList[index].id;
        var route =  RouteHelper.getDetailsScreen();

        return ProductCard(
          index: index,
          product: product,
          subController: subController,
          subControllersList: subControllersList,
          image: image,
          productId: productId,
          route: route,
        );
      },);
}

Widget PopularProduct (index) {
  return GetBuilder<PopularProductController>(builder: (popularProduct) {

        var product = Get.find<PopularProductController>().popularProductList[index];
        var subController = popularProduct;
        var subControllersList = popularProduct.popularProductList[index];
        var image = popularProduct.popularProductList[index].img!;
        var productId = popularProduct.popularProductList[index].id;
        var route = RouteHelper.getPopularFood(index, "home");

        return ProductCard(
          index: index,
          product: product,
          subController: subController,
          subControllersList: subControllersList,
          image: image,
          productId: productId,
          route: route,
        );
      },);
}
Widget RecommendedProduct (index) {
  return GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {

        var product = Get.find<RecommendedProductController>().recommendedProductList[index];
        var subController = recommendedProduct;
        var subControllersList = recommendedProduct.recommendedProductList[index];
        var image = recommendedProduct.recommendedProductList[index].img!;
        var productId = recommendedProduct.recommendedProductList[index].id;
        var route = RouteHelper.getRecommendedFood(index, "home");

        return ProductCard(
          index: index,
          product: product,
          subController: subController,
          subControllersList: subControllersList,
          image: image,
          productId: productId,
          route: route,
        );
      },);
}



// Widget indexOfGrid(index, s) {
//   switch (index) {
//     case 0:
//       return GridViewOfLabsaProducts(pageId: s,);
//     case 1:
//       return GridViewOfFoodProducts(pageId: s,);
//     case 2:
//       return GridViewOfTexaponProducts(pageId: s,);
//     case 3:
//     default: return GridViewOfFoodProducts(pageId: s,);
//   }
// }

class SelectedCategoryItem extends StatelessWidget {
  const SelectedCategoryItem(
      {Key? key,
        required this.icon,
        required this.name,
        required this.backgroundColor
      })
      : super(key: key);

  final Widget icon;
  final String name;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: Dimensions.radius20 * 2.15,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: Dimensions.radius20 * 1.95,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: Dimensions.radius20 * 1.8,
                backgroundColor: backgroundColor,
                child: icon,
              ),
            ),
          ),
          SizedBox(height: Dimensions.height10,),
          Text(
            name,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: Dimensions.font12,
                color: Colors.blue
            ),
          ),
        ],
      ),
    );
  }
}

class UnSelectedCategoryItem extends StatelessWidget {
  const UnSelectedCategoryItem(
      {Key? key,
        required this.icon,
        required this.name,
        required this.backgroundColor})
      : super(key: key);

  final Widget icon;
  final String name;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: Dimensions.radius20 * 2.15,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: Dimensions.radius20 * 1.95,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: Dimensions.radius20 * 1.8,
                backgroundColor: backgroundColor,
                child: icon,
              ),
            ),
          ),
          SizedBox(height: Dimensions.height10,),
          Text(
            name,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: Dimensions.font12,
                color: Colors.black
            ),
          ),
        ],
      ),
    );
  }
}


Widget customcartview (context, BoxConstraints constraints, HomeController controller2){

  bool isDragging = false;

  return AnimatedPositioned(
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
    );
}

Widget buildSheet() => SizedBox(
  height: Dimensions.height45 * 17,
  // color: Colors.transparent,
  child: const CartPage(),
);