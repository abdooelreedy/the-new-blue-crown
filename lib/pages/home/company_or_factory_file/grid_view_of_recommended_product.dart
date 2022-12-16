// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:theblue_crown/controllers/controller_lists/product_grids/recommended_product_controller.dart';
// import '../../../controllers/cart_controller.dart';
// import '../../../controllers/controller_lists/product_grids/popular_product_controller.dart';
// import '../../../controllers/language_controller.dart';
// import '../../../utils/app_constants.dart';
// import '../../../utils/dimensions.dart';
// import '../../../widgets/custom_big_text.dart';
// import '../../../widgets/custom_small_text.dart';
// import '../ProductCardText.dart';
//
//
// class GridViewRecommendedProducts extends StatefulWidget {
//
//   final int pageId ;
//
//   const GridViewRecommendedProducts({
//     Key? key,
//     required this.pageId,
//   }) : super(key: key);
//
//   @override
//   State<GridViewRecommendedProducts> createState() => _GridViewRecommendedProductsState();
// }
//
// class _GridViewRecommendedProductsState extends State<GridViewRecommendedProducts> {
//
//   bool isAdded = true;
//
//   List<String> productImages = [
//     'assets/products/elmomtaz_labsa_5KG.png',
//     'assets/products/elmomtaz_labsa_31.5KG.png',
//     'assets/products/elmomtaz_labsa_63KG.png',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
//         return GridView.builder(
//           physics: const BouncingScrollPhysics(),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 1 / 1.35,
//             mainAxisSpacing: 8,
//             crossAxisSpacing: 8,
//           ),
//           padding: EdgeInsets.only(
//             left: Dimensions.width10,
//             right: Dimensions.width10,
//             top: Dimensions.height10,
//             bottom: Dimensions.cartBarHeight * 1.1,
//           ),
//           itemCount: recommendedProduct.recommendedProductList.length,
//           itemBuilder: (context, index) {
//
//             var product = Get.find<RecommendedProductController>().recommendedProductList[index];
//             Get.find<RecommendedProductController>().initProduct(product, Get.find<CartController>());
//
//             return GetBuilder<LocalizationController>(builder: (localizationController) {
//               return Container(
//                 margin: EdgeInsets.only(
//                   left: Dimensions.width20 / 5,
//                   right: Dimensions.width20 / 5,
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
//                   border: Border.all(width: 2, color: Colors.blueGrey.withOpacity(0.2),),
//                   color: Colors.grey.shade200,
//                   boxShadow: [
//                     //darker shadow at bottom left
//                     BoxShadow(
//                         color: Colors.grey.shade700.withOpacity(0.7),
//                         offset: const Offset(-3, 3),
//                         blurRadius: 3,
//                         spreadRadius: 1
//                     ),
//
//                     //Lighter shadow at top right
//                     // BoxShadow(
//                     //     color: Colors.grey.shade300.withOpacity(0.7),
//                     //     offset: const Offset(3, -3),
//                     //     blurRadius: 3,
//                     //     spreadRadius: 1
//                     // ),
//                   ],
//                   gradient: LinearGradient(
//                     begin: Alignment.topRight,
//                     end: Alignment.bottomLeft,
//                     colors: [
//                       Colors.grey.shade200,
//                       Colors.grey.shade400
//                     ],
//                     stops: const [
//                       0.1,
//                       0.9
//                     ],
//                   ),
//                 ),
//                 // padding: const EdgeInsets.all(1),
//
//                 child: Padding(padding: EdgeInsets.all(Dimensions.height10 / 4),
//                   child: Column(
//                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: Dimensions.width30 * 3.5,
//                             height: Dimensions.height45 * 3.5,
//                             // color: Colors.red,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ProductCardText(
//                                   text: "الوزن: ",
//                                   value: "66" + "KG".tr,
//                                 ),
//                                 ProductCardText(
//                                   text: "المنشأ: ",
//                                   value: "مصر",
//                                 ),
//                                 ProductCardText(
//                                   text: "الشركة: ",
//                                   value: "اللؤلؤة",
//                                 ),
//                                 ProductCardText(
//                                   text: "التركيز: ",
//                                   value: "75 %",
//                                 ),
//                                 ProductCardText(
//                                   text: "النوع: ",
//                                   value: "سائل",
//                                 ),
//                                 ProductCardText(
//                                   text: "الصلاحية: ",
//                                   value: "سنتين",
//                                 ),
//                                 ProductCardText(
//                                   text: "انتاج: ",
//                                   value: "2022",
//                                 ),
//                                 ProductCardText(
//                                   text: "السعر: ",
//                                   // value: "2500 جنية",
//                                   value: recommendedProduct.recommendedProductList[index].price!.toString(),
//                                   colors: Colors.red,
//                                   fontWeight: FontWeight.w900,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: Dimensions.width30 * 2.5,
//                             height: Dimensions.height45 * 3.5,
//                             // color: Colors.green,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(Dimensions.radius20),
//                               // child: Image.asset(
//                               //   // _selectedIndex == 0 ?
//                               //   // ElMomtazLabsaImages[index] :
//                               //   // SuperElMomtazLabsaImages[index],
//                               //   products[_selectedIndex],
//                               //   fit: BoxFit.fitHeight,),
//                               child: CachedNetworkImage(
//                                 imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + recommendedProduct.recommendedProductList[index].img!,
//                                 height: Dimensions.listViewImgSize / 1.3,
//                                 width: Dimensions.listViewImgSize,
//                                 fit: BoxFit.fitHeight,
//                                 placeholder: (context, url) => Container(color: Colors.black12,),
//                                 errorWidget: (context, url, error) => Container(
//                                   color: Colors.black12,
//                                   child: const Icon(Icons.error, color: Colors.red),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         width: Dimensions.screenWidth,
//                         height: Dimensions.height45 * 1.2,
//                         // color: Colors.yellow,
//                         alignment: Alignment.center,
//                         child: CustomSmallText(
//                           // text: "سلفونيك سوبر الممتاز",
//                           text: recommendedProduct.recommendedProductList[index].name!,
//                           color: Colors.black,
//                           size: Dimensions.font20,
//                           // alignment: Alignment.center,
//                         ),
//                       ),
//                       GetBuilder<CartController>(builder: (cartController) {
//                         return Padding(
//                           padding: EdgeInsets.only(right: Dimensions.width5 / 2, left: Dimensions.width5 / 2),
//                           child: SizedBox(
//                             width: double.infinity / 1.5,
//                             height: Dimensions.height30 * 1.4,
//                             child: isAdded && cartController.existInCart(product) && recommendedProduct.checkQuantity(-1) == 0 || recommendedProduct.inCartItems.toString() == "0" ?
//                             ElevatedButton(
//                               onPressed: () {
//                                 recommendedProduct.setQuantity(true);
//                                 recommendedProduct.addItem(product);
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 fixedSize: const Size(
//                                     double.maxFinite,
//                                     double.maxFinite
//                                 ),
//                                 primary: Colors.blue,
//                               ),
//                               child: CustomBigText(
//                                 text: "Add_To_Cart".tr,
//                                 color: Colors.white,
//                                 size: Dimensions.font16,
//                               ),
//                             ) :
//                             //Remove And Add Container
//                             Container(
//                               width: double.maxFinite,
//                               height: Dimensions.height20 * 2,
//                               margin: EdgeInsets.only(
//                                 top: Dimensions.height10 / 13,
//                               ),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   //Add Icon
//                                   InkWell(
//                                     onTap: (){
//                                       recommendedProduct.setQuantity(true);
//                                       recommendedProduct.addItem(product);
//                                     },
//                                     child: Container(
//                                       width: Dimensions.width30 * 1.5,
//                                       height: double.maxFinite,
//                                       decoration: BoxDecoration(
//                                         color: Colors.blue,
//                                         borderRadius: BorderRadius.circular(Dimensions.radius15 / 2.5),
//                                       ),
//                                       child: const Icon(
//                                         Icons.add,
//                                         color: Colors.white,
//                                       ),
//
//                                     ),
//                                   ),
//
//
//                                   //inCartItems
//                                   CustomBigText(text: recommendedProduct.inCartItems.toString(),),
//
//                                   //Remove Icon
//                                   InkWell(
//                                     onTap: (){
//                                       recommendedProduct.decrease();
//                                       recommendedProduct.addItem(product);
//                                     },
//                                     child: Container(
//                                       width: Dimensions.width30 * 1.5,
//                                       height: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: Colors.blue,
//                                         borderRadius: BorderRadius.circular(Dimensions.radius15 / 2.5),
//                                       ),
//                                       child: const Icon(
//                                         Icons.remove,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             );
//           },
//         );
//       },
//       ),
//     );
//   }
// }
