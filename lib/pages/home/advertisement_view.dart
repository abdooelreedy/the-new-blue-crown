import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:theblue_crown/controllers/controller_lists/grid_view_of_sections_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/popular_product_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/recommended_product_controller.dart';
import 'package:theblue_crown/models/cart_model.dart';
import 'package:theblue_crown/models/products_model.dart';
import 'package:theblue_crown/pages/cart/add_popular_to_cart.dart';
import 'package:theblue_crown/pages/home/company_or_factory_file/company_or_factory_view.dart';
import 'package:theblue_crown/pages/home/details/galaxy_texpon_details.dart';
import 'package:theblue_crown/pages/home/sub_sections/viscosity_enhancers.dart';
import 'package:theblue_crown/routes/route_helper.dart';
import 'package:theblue_crown/utils/dimensions.dart';
import 'package:theblue_crown/utils/app_constants.dart';
import 'package:theblue_crown/widgets/app_column.dart';
import 'package:theblue_crown/widgets/custom_big_text.dart';
import 'package:theblue_crown/widgets/custom_small_text.dart';
import 'package:theblue_crown/widgets/icon_and_text_widget.dart';
import '../../animations/fade_animation.dart';
import '../../animations/page_transition.dart';
import '../../animations/slide_animation.dart';
import '../../base/custom_loader.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/controller_lists/product_grids/el_momtaz_labsa_controller.dart';
import '../../controllers/controller_lists/product_grids/super_el_momtaz_labsa_controller.dart';
import '../../utils/navigation.dart';
import '../../widgets/app_clipper.dart';
import '../cart/add_to_cart.dart';
import 'clippedcontainer.dart';
import 'details_view3.dart';

List<String> name = [
  'Pop and Rec Products',
  'Popular Products',
  'Recommended Products',
];
List<String> categoryIconList = [
  "assets/images/a00e0b1db85dd13a098a0104f4d4cf83.jpg",
  "assets/images/8a4cf7f745404d0ceeea5814b5cc3688.jpg",
  "assets/images/a00e0b1db85dd13a098a0104f4d4cf83.jpg",
  // "assets/images/8a4cf7f745404d0ceeea5814b5cc3688.jpg",
];

class AdvertisementView extends StatefulWidget {
  const AdvertisementView ({Key? key,}) : super(key: key);

  @override
  _AdvertisementViewState createState() => _AdvertisementViewState();
}

class _AdvertisementViewState extends State<AdvertisementView> {

  int activeIndex = 2;
  PageController pageController = PageController(viewportFraction: 0.90);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  final numbers = 5;
  late double _height2;
  final _duration = const Duration(milliseconds: 750);
  final _psudoDuration = const Duration(milliseconds: 150);
  // final double advertisementHeight = 400;
  // final double sectionsHeight = Dimensions.height45 * 3.5 * 2.5;
  // late double bestSellingHeight = Dimensions.height45 * 3;
  // final double homeViewHeight = advertisementHeight + sectionsHeight + bestSellingHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

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

  _animateContainerFromBottomToTop() async {
    //Animate back to default value
    _height2 = MediaQuery.of(context).padding.top + 50;
    setState(() {});

    //Wait till animation is finished
    await Future.delayed(_duration);
  }

  _animateContainerFromTopToBottom() async {
    //Wait
    await Future.delayed(_psudoDuration);

    //Animate from top to bottom
    _height2 = MediaQuery.of(context).size.height;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //Default height
    _height2 = 0;
    setState(() {});

    //Animate Container from Top to bottom
    Timer(const Duration(milliseconds: 50), () {
      _animateContainerFromTopToBottom();
    });
  }

  int selectedIndex = -1;
  final double advertisementHeight = Dimensions.height45 * 6.8    +    Dimensions.height20;
  final double sectionsHeight =      Dimensions.height30    +    Dimensions.height45 * 7;
  final double bestSellingHeight =   Dimensions.height30    +    Dimensions.height45 * 8;
  final double cartBarHeight =       Dimensions.cartBarHeight;

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      begin: const Offset(0, 400),
      duration: _duration,
      child: AnimatedContainer(
        height: advertisementHeight  + sectionsHeight + bestSellingHeight + cartBarHeight,
        duration: _duration,
        padding: const EdgeInsets.only(bottom: 20),
        curve: Curves.fastOutSlowIn,
        decoration: const BoxDecoration(color: Colors.white,),
        child: Column(
          children: [
            //slider section
          //   ClippedContainer(
          //     child: GetBuilder<PopularProductController>(builder:(popularProducts){
          //       return popularProducts.isLoaded ? Container(
          //         color: Colors.white,
          //         height: Dimensions.pageView,
          //         width: double.maxFinite,
          //         /*child: GestureDetector(
          //            onTap: (){
          //              Get.toNamed(RouteHelper.getPopularFood());
          //            },*/
          //         child: PageView.builder(
          //           controller: pageController,
          //           itemCount: popularProducts.popularProductList.length,
          //           itemBuilder: (context, position) {
          //             return _buildPageItem(position, popularProducts.popularProductList[position]);
          //             },
          //         ),
          //         //),
          //       ) : const CircularProgressIndicator(
          //         color: Colors.blue,
          //       );
          //     }
          //   ),
          // ),
            //Advertisement View
            ClippedContainer(
              // child: GetBuilder<ElMomtazLabsaController>(builder: (ElMomtazLabsa) {
              child: GetBuilder<PopularProductController>(builder:(popularProducts){
                return popularProducts.isLoaded ? Container(
                  color: Colors.white,
                  height: advertisementHeight,
                  width: double.maxFinite,
                  child: CarouselSlider.builder(
                    itemCount: popularProducts.popularProductList.length,
                    options: CarouselOptions(
                      height: Dimensions.height45 * 9,
                      // aspectRatio: 16/10,
                      viewportFraction: 0.85,
                      initialPage: activeIndex,
                      // enableInfiniteScroll: true,
                      // reverse: false,
                      autoPlay: true,
                      // autoPlayInterval: Duration(seconds: 3),
                      // autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.ease,
                      enlargeCenterPage: true,
                      // scrollDirection: Axis.horizontal,
                      onPageChanged: (index, other) => setState(() => activeIndex = index),
                    ),
                    itemBuilder: (context, position, realIndex) {
                      return _buildPageItem(position, popularProducts.popularProductList[position]);
                    },
                  ),
                ) :
                // const CircularProgressIndicator(color: Colors.blue,);
                Column(
                  children: [
                    Stack(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[400]!,
                          highlightColor: Colors.grey[100]!,
                          child: Center(
                            child: Container(
                              height: Dimensions.height45 * 5,
                              width: Dimensions.width30 * 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[500]!,
                          highlightColor: Colors.grey[100]!,
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: Dimensions.pageViewTextContainer,
                                margin: EdgeInsets.only(top: Dimensions.height45 * 3.5, left: Dimensions.width30 * 2, right: Dimensions.width30 * 2, bottom: Dimensions.height30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                                  color: Colors.blueGrey.withOpacity(0.4),
                                ),
                                child:Container(
                                  padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.width30 * 20, right: 15),
                                  // child: AppColumn(text: popularProduct.name!, color: Colors.white,),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height10,)
                  ],
                );
              }
              ),
            ),
            //dots
            GetBuilder<PopularProductController>(
              builder: (popularProducts) {
                return AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: popularProducts.popularProductList.length,
                  effect: WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue,
                    dotWidth: Dimensions.width30/2.5,
                    dotHeight: Dimensions.height45/4,
                    radius: Dimensions.radius20,
                    offset: activeIndex * 1,
                  ),
                );
                // return DotsIndicator(
                //   dotsCount: popularProducts.popularProductList.isEmpty ? 1 : popularProducts.popularProductList.length,
                //   position: _currPageValue,
                //   decorator: DotsDecorator(
                //     size: const Size.square(9.0),
                //     activeSize: const Size(18.0, 9.0),
                //     activeShape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5.0)),
                //   ),
                // );
              }
              ),

            //Sections
            Container(
            margin: EdgeInsets.only(right: Dimensions.width5 / 2, left: Dimensions.width5 / 2,),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.height20 * 2 + Dimensions.height10,
                  child: SizedBox(
                    width: Dimensions.width20 * 2 + Dimensions.width5 * 2,
                    height: Dimensions.height20 * 2 + Dimensions.height10 ,
                    // child: Lottie.asset('assets/checkSections.json',),
                    child: const Icon(Icons.widgets),
                  ),
                ),
                SizedBox(width: Dimensions.width5,),
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.height15),
                  child: CustomBigText(
                    text: "Sections".tr,
                    // alignment: Alignment.center,//Recommended
                  ),
                ),
              ],
            ),
          ),
            FadeAnimation(
            intervalStart: 0.04,
            duration: const Duration(milliseconds: 1250),
            child: SlideAnimation(
              begin: const Offset(0, 220),
              intervalStart: 0.7,
              duration: const Duration(milliseconds: 1250),
              child: Container(
                height: sectionsHeight,
                width: double.maxFinite,
                color: Colors.white,
                // child: GetBuilder<GridViewOfCategoryController>(builder: (gridProduct) {
                child: GetBuilder<GridViewOfSectionsController>(builder: (gridViewOfSections) {
                  return gridViewOfSections.isLoaded ? GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 1.25,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    padding: const EdgeInsets.all(4),
                    // controller: controller,
                    // itemCount: gridProduct.recommendedProductList.length,
                    itemCount: gridViewOfSections.gridViewOfSectionsList.length,
                    // itemCount: name.length,
                    itemBuilder: (context, index) {
                      // final item = numbers[index];
                      return Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(0.001),
                        child: GestureDetector(
                          onTap: (){
                            // Get.toNamed(RouteHelper.getPopularFood(index, "home"));
                            index == 1 ?
                            // Get.to(ViscosityEnhancers(pageId: index,))
                            Get.to(GalaxyTexponDetails(pageId: index, page: "home"))
                                : Get.toNamed(RouteHelper.getCompanyOrFactoryView(index));
                            // Get.toNamed(RouteHelper.getElMomtazLabsaFood(index, "home"));
                            // Get.to(const DetailsView3());
                          },
                          child: Column(
                            children: [
                              Container(
                                width: double.maxFinite,
                                height: Dimensions.height45 * 3,
                                color: Colors.white,
                                // child: Image.asset(categoryIconList[index]),
                                child: CachedNetworkImage(
                                  // imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + gridProduct.recommendedProductList[index].img!,
                                  imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + gridViewOfSections.gridViewOfSectionsList[index].img!,
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => Container(color: Colors.black12,),
                                  errorWidget: (context, url, error) => Container(
                                    color: Colors.black12,
                                    child: const Icon(Icons.error, color: Colors.red),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: Dimensions.height10 * 3,
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    // gridProduct.recommendedProductList[index].name!.tr,
                                    gridViewOfSections.gridViewOfSectionsList[index].name!.tr,
                                    // name[index],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ) :
                  // const CustomLoader();
                  Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[100]!,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1 / 1.25,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      padding: const EdgeInsets.all(4),
                      // controller: controller,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.grey,
                            // color: Colors.blueGrey.withOpacity(0.5),
                          ),
                        );
                      },
                    ),
                  );
                  },
                ),
              ),
            ),
          ),
            //The Best Selling
            Container(
              margin: EdgeInsets.only(right: Dimensions.width5 / 2, left: Dimensions.width5 / 2),
              padding: EdgeInsets.only(right: Dimensions.width10, left: Dimensions.width10,),
              // color: Colors.red,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: Dimensions.width20 * 2 + Dimensions.width5 * 2,
                      height: Dimensions.height20  + Dimensions.height10 ,
                      // child: Lottie.asset('assets/checkSections.json',),
                      child: const Icon(
                        Icons.local_offer_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.width5,),
                  SizedBox(
                    height: Dimensions.height20 + Dimensions.height10,
                    child: Center(
                      child: CustomBigText(
                        text: "The_Best_Selling".tr,
                        // alignment: Alignment.center,//Recommended
                      ),
                    ),
                  ),
                ],
              ),
            ),
          //recommended products
          //list of most public selling
          // GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          //     return recommendedProduct.isLoaded ? ListView.builder(
          //       physics: const NeverScrollableScrollPhysics(),
          //       shrinkWrap: true,
          //       itemCount: recommendedProduct.recommendedProductList.length,
          //       // scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index){
          //         return GestureDetector(
          //           onTap: (){
          //             Get.toNamed(RouteHelper.getRecommendedFood(index, "home"));
          //           },
          //           child: Container(
          //             margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height10),
          //             child: Row(
          //               children: [
          //                 //image section
          //                 Hero(
          //                   tag: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + recommendedProduct.recommendedProductList[index].img!,
          //                   child: Container(
          //                     width: Dimensions.listViewImgSize,
          //                     height: Dimensions.listViewImgSize,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(Dimensions.radius20),
          //                       color: Colors.white38,
          //                       image: DecorationImage(
          //                           fit: BoxFit.cover,
          //                           image: NetworkImage(
          //                               AppConstants.BASE_URL + AppConstants.UPLOAD_URL + recommendedProduct.recommendedProductList[index].img!
          //                           )
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 //text container
          //                 Expanded(
          //                   child: Container(
          //                     height: Dimensions.listViewTextContSize,
          //                     //width: 195,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.only(
          //                         topRight: Radius.circular(Dimensions.radius20),
          //                         bottomRight: Radius.circular(Dimensions.radius20),
          //                       ),
          //                       color: Colors.white,
          //                     ),
          //                     child: Padding(
          //                       padding: EdgeInsets.only(left: Dimensions.width5,right: Dimensions.width5),
          //                       child: Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         children: [
          //                           CustomBigText(
          //                             text: recommendedProduct.recommendedProductList[index].name!,
          //                           ),
          //                           SizedBox(height: Dimensions.height10,),
          //                           const CustomSmallText(
          //                             text: "تكسابون درجة اولى",
          //                           ),
          //                           SizedBox(height: Dimensions.height10,),
          //                           Row(
          //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                             crossAxisAlignment: CrossAxisAlignment.start,
          //                             children: const [
          //                               IconAndTextWidget(
          //                                 icon: Icons.circle_sharp,
          //                                 text: "Normal",
          //                                 iconColor: Colors.blue,
          //                               ),
          //                               IconAndTextWidget(
          //                                 icon: Icons.location_on,
          //                                 text: "1.7Km",
          //                                 iconColor: Colors.red,
          //                               ),
          //                               IconAndTextWidget(
          //                                 icon: Icons.access_time_rounded,
          //                                 text: "32min",
          //                                 iconColor: Colors.purple,
          //                               ),
          //                             ],
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         );
          //         },
          //     ) : const CircularProgressIndicator(
          //       color: Colors.blue,
          //     );
          //     },
          // ),

                  // GetBuilder<GridViewOfCategoryController>(builder: (gridProduct) {
            GetBuilder<CartController>(builder: (cartController) {
              return GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
                return recommendedProduct.isLoaded ?
                SizedBox(
                  height: Dimensions.height45 * 7,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.all(Dimensions.height10),
                    itemCount: recommendedProduct.recommendedProductList.length,
                    separatorBuilder: (BuildContext context, int index) {return const SizedBox(width: 0);},
                    itemBuilder: (context, index){

                      var product = Get.find<RecommendedProductController>().recommendedProductList[index];
                      Get.find<RecommendedProductController>().initProduct(product, Get.find<CartController>());

                      return Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10,
                            bottom: Dimensions.height10 / 10
                        ),
                        height: Dimensions.height45 * 3,
                        width: Dimensions.width30 * 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                          // color: Colors.blueGrey.withOpacity(0.5),
                          border: Border.all(width: 2, color: Colors.blueGrey.withOpacity(0.2),),
                          color: Colors.grey.shade200,
                          boxShadow: [
                            //darker shadow at bottom left
                            BoxShadow(
                                color: Colors.grey.shade700.withOpacity(0.7),
                                offset: const Offset(-3, 3),
                                blurRadius: 3,
                                spreadRadius: 1
                            ),

                            //Lighter shadow at top right
                            // BoxShadow(
                            //     color: Colors.grey.shade300.withOpacity(0.7),
                            //     offset: const Offset(3, -3),
                            //     blurRadius: 3,
                            //     spreadRadius: 1
                            // ),
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // the image
                            GestureDetector(
                              onTap: (){  Get.toNamed(RouteHelper.getRecommendedFood(index, "home"));  },
                              child: SizedBox(
                                width: Dimensions.screenWidth,
                                height: Dimensions.listViewImgSize / 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  child: CachedNetworkImage(
                                    imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + recommendedProduct.recommendedProductList[index].img!,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Container(color: Colors.black12,),
                                    errorWidget: (context, url, error) => Container(
                                      color: Colors.black12,
                                      child: const Icon(Icons.error, color: Colors.red),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: Dimensions.height10 / 2,),
                            //the name's product
                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RouteHelper.getRecommendedFood(index, "home"));
                                  // Get.toNamed(RouteHelper.getPopularFood(index, "home"));
                                  },
                                child: CustomBigText(text: recommendedProduct.recommendedProductList[index].name!.tr,)),
                            SizedBox(height: Dimensions.height10,),
                            //the description's product
                            GestureDetector(
                              onTap: (){  Get.toNamed(RouteHelper.getRecommendedFood(index, "home"));  },
                              child: Container(
                                // color: Colors.white,
                                height: Dimensions.height45,
                                width: double.maxFinite,
                                child: Padding(
                                  padding: EdgeInsets.only(top: Dimensions.height10),
                                  child: CustomSmallText(
                                    text: "",
                                    // alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(height: Dimensions.height10 / 2,),
                            Container(
                              width: double.maxFinite,
                              height: Dimensions.height45,
                              padding: EdgeInsets.only(right: Dimensions.width5, left: Dimensions.width5, bottom: Dimensions.height10 / 2),
                              child: cartController.existInCart(product) && recommendedProduct.checkQuantity(-1) == 0 || recommendedProduct.inCartItems.toString() == "0" ?
                              //Add To Cart
                              ElevatedButton(
                                onPressed: () {
                                  recommendedProduct.increase(product);
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
                                        recommendedProduct.increase(product);
                                        recommendedProduct.addItem(product);
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
                                    CustomBigText(text: recommendedProduct.inCartItems.toString(),),

                                    //Remove Icon
                                    InkWell(
                                        onTap: (){
                                          recommendedProduct.decrease();
                                          recommendedProduct.addItem(product);
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
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ) :
                // const CircularProgressIndicator(color: Colors.blue,);
                Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.grey[100]!,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          height: Dimensions.height45 * 5.5,
                          width: Dimensions.width30 * 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: Dimensions.width30,),
                        Container(
                          height: Dimensions.height45 * 5.5,
                          width: Dimensions.width30 * 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              );}),

        ],
      ),
    ),
    );

  }
  
  Widget _buildPageItem(int index, ProductModel popularProduct) {
    // Matrix4 matrix = Matrix4.identity();
    // if(index == _currPageValue.floor()) {
    //   var currScale = 1-(_currPageValue - index) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    //
    // }else if (index == _currPageValue.floor() +1 ){
    //   var currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    //
    // }else if (index == _currPageValue.floor() -1 ){
    //   var currScale = 1-(_currPageValue - index) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    //
    // }else{
    //   var currScale = 0.8;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    //
    // }

    return Hero(
      tag: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + popularProduct.img!,
      // child: Transform(
      //   transform: matrix,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {  Get.toNamed(RouteHelper.getPopularFood(index, "home"));  },
              child: SizedBox(
                height: Dimensions.pageViewContainer,
                // margin: EdgeInsets.only(left: Dimensions.width5, right: Dimensions.width5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  child: CachedNetworkImage(
                    imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + popularProduct.img!,
                    height: Dimensions.pageViewContainer,
                    width:Dimensions.screenWidth ,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(left: Dimensions.width25, right: Dimensions.width25, bottom: Dimensions.height10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: Colors.blueGrey.withOpacity(0.4),
                ),
                    child:Container(
                      padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
                      child: Column(
                        children: [
                          AppColumn(text: popularProduct.name!.tr, color: Colors.white,),
                          // SizedBox(
                          //   width: double.maxFinite,
                          //   height: Dimensions.height45,
                          //   child: AddPopularToCart(pageId: index),
                          // ),
                        ],
                      ),
                    ),
                ),
            ),
          ],
        ),
      // ),
    );
  }
}


