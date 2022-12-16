import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../animations/fade_animation.dart';
import '../../../animations/slide_animation.dart';
import '../../../constance.dart';
import '../../../controllers/controller_lists/grid_view_of_sections_controller.dart';
import '../../../controllers/controller_lists/sub_section_grids/viscosity_enhancers_sub_section_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../../routes/route_helper.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/app_clipper.dart';
import '../../../widgets/custom_big_text.dart';
import '../../../widgets/custom_small_text.dart';
import '../../cart/cart_page.dart';
import '../../cart/cart_short_view.dart';
import '../company_or_factory_file/company_or_factory_view.dart';
import '../company_or_factory_file/grid_view_of_Labsa_products.dart';
import '../company_or_factory_file/grid_view_of_food_products.dart';
import '../company_or_factory_file/grid_view_of_recommended_product.dart';
import '../company_or_factory_file/grid_view_of_texapon_products.dart';

class ViscosityEnhancers extends StatefulWidget {

  final int pageId ;

  const ViscosityEnhancers({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  State<ViscosityEnhancers> createState() => _ViscosityEnhancersState();
}

class _ViscosityEnhancersState extends State<ViscosityEnhancers> with TickerProviderStateMixin {

  final controller2 = HomeController();
  final controller = ScrollController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                                        text: widget.pageId == 0 ?
                                        "Labsa_Class".tr : widget.pageId == 1 ? "فئة معززات اللزوجة / المغلظات" : "فئة التكسابون",
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
                                    Container(
                                          height: Dimensions.height45 * 7,
                                          width: double.maxFinite,
                                          color: Colors.white,
                                          padding: EdgeInsets.only(top: Dimensions.height20),
                                          // child: GetBuilder<GridViewOfCategoryController>(builder: (gridProduct) {
                                          child: GetBuilder<ViscosityEnhancersSubSectionController>(builder: (viscosityEnhancersSubSection) {
                                            return viscosityEnhancersSubSection.isLoaded ? GridView.builder(
                                              physics: const NeverScrollableScrollPhysics(),
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio: 1 / 1.3,
                                                mainAxisSpacing: 8,
                                                crossAxisSpacing: 8,
                                              ),
                                              padding: const EdgeInsets.all(4),
                                              // controller: controller,
                                              // itemCount: gridProduct.recommendedProductList.length,
                                              itemCount: viscosityEnhancersSubSection.viscosityEnhancersSubSectionList.length,
                                              // itemCount: name.length,
                                              itemBuilder: (context, index) {
                                                // final item = numbers[index];
                                                return Container(
                                                  padding: const EdgeInsets.all(0.001),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                    // color: Colors.red,
                                                    // color: Colors.blueGrey.withOpacity(0.5),
                                                    border: Border.all(width: 2, color: Colors.blueGrey.withOpacity(0.2),),),
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      //Get.toNamed(RouteHelper.getPopularFood(index, "home"));
                                                      index == 1 ?
                                                      Get.to(ViscosityEnhancers(pageId: index,)):
                                                      Get.toNamed(RouteHelper.getCompanyOrFactoryView2(index));
                                                      // Get.toNamed(RouteHelper.getElMomtazLabsaFood(index, "home"));
                                                      // Get.to(const DetailsView3());
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          width: double.maxFinite,
                                                          height: Dimensions.height45 * 3,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                            // color: Colors.yellow,
                                                            // color: Colors.blueGrey.withOpacity(0.5),
                                                            ),
                                                          // child: Image.asset(categoryIconList[index]),
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                            child: CachedNetworkImage(
                                                            // imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + gridProduct.recommendedProductList[index].img!,
                                                            imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + viscosityEnhancersSubSection.viscosityEnhancersSubSectionList[index].img!,
                                                            fit: BoxFit.fill,
                                                            placeholder: (context, url) => Container(color: Colors.black12,),
                                                            errorWidget: (context, url, error) => Container(
                                                              color: Colors.black12,
                                                              child: const Icon(Icons.error, color: Colors.red),
                                                            ),
                                                          ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: double.maxFinite,
                                                          height: Dimensions.height10 * 3,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                            // color: Colors.yellow,
                                                            // color: Colors.blueGrey.withOpacity(0.5),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              // gridProduct.recommendedProductList[index].name!.tr,
                                                              viscosityEnhancersSubSection.viscosityEnhancersSubSectionList[index].name!.tr,
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
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //the short cart
                      customcartview (context, constraints, controller2),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Widget indexOfGrid(index, s) {
//   switch (index) {
//     case 0:
//       return GridViewOfLabsaProducts(pageId: s,);
//     case 1:
//       return getPopGrid2(s);
//     case 2:
//     default: return getPopGrid2(s);
//   }
// }
//
// Widget getPopRecGrid(int s) {
//   switch (s) {
//     case 0:
//       return GridViewOfFoodProducts(pageId: s,);
//     case 1:
//     default:
//       return GridViewRecommendedProducts(pageId: s,);
//   }
// }
//
// Widget getPopGrid2(int s) {
//   switch (s) {
//     case 0:
//     default:
//       return GridViewOfFoodProducts(pageId: s,);
//   }
// }
//
// Widget getGrid3(int s) {
//   switch (s) {
//     case 0:
//     default:
//       return GridViewRecommendedProducts(pageId: s,);
//   }
// }


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