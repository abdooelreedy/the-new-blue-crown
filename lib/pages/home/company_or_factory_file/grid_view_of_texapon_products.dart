// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:theblue_crown/controllers/controller_lists/product_grids/galaxy_texapon_controller.dart';
// import 'package:theblue_crown/controllers/controller_lists/product_grids/malaysia_texapon_controller.dart';
// import 'package:theblue_crown/controllers/controller_lists/product_grids/renotex_texapon_controller.dart';
// import 'package:theblue_crown/pages/home/company_or_factory_file/product_card.dart';
// import '../../../controllers/cart_controller.dart';
// import '../../../controllers/language_controller.dart';
// import '../../../routes/route_helper.dart';
// import '../../../utils/app_constants.dart';
// import '../../../utils/dimensions.dart';
// import '../../../widgets/custom_big_text.dart';
// import '../../../widgets/custom_small_text.dart';
// import '../ProductCardText.dart';
//
// class GridViewOfTexaponProducts extends StatefulWidget {
//
//   final int pageId ;
//
//   const GridViewOfTexaponProducts({
//     Key? key,
//     required this.pageId,
//   }) : super(key: key);
//
//   @override
//   State<GridViewOfTexaponProducts> createState() => _GridViewOfTexaponProductsState();
// }
//
// class _GridViewOfTexaponProductsState extends State<GridViewOfTexaponProducts> {
//   // List<String> productImages = [
//   //   'assets/products/elmomtaz_labsa_5KG.png',
//   //   'assets/products/elmomtaz_labsa_31.5KG.png',
//   //   'assets/products/elmomtaz_labsa_63KG.png',
//   // ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: GetBuilder<GalaxyTexaponController>(builder: (galaxyTexapon) {
//         return GetBuilder<RenotexTexaponController>(builder: (renotexTexapon) {
//           return GetBuilder<MalaysiaTexaponController>(builder: (malaysiaTexapon) {
//
//           List lengths = [
//             galaxyTexapon.galaxyTexaponList.length,
//             renotexTexapon.renotexTexaponList.length,
//             malaysiaTexapon.malaysiaTexaponList.length,
//           ];
//
//           return GridView.builder(
//             physics: const BouncingScrollPhysics(),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 1 / 1.35,
//               mainAxisSpacing: 8,
//               crossAxisSpacing: 8,
//             ),
//             padding: EdgeInsets.only(
//               left: Dimensions.width10,
//               right: Dimensions.width10,
//               top: Dimensions.height10,
//               bottom: Dimensions.cartBarHeight * 1.1,
//             ),
//             itemCount: lengths[widget.pageId],
//             itemBuilder: (context, index) {
//
//               List texapon = [
//                 GalaxyTexapon(index),
//                 RenotexTexapon(index),
//                 MalaysiaTexapon(index)
//               ];
//               return texapon[widget.pageId];
//               },
//           );},);},);}),
//     );
//     }
//
//   Widget GalaxyTexapon (int index) {
//     return GetBuilder<CartController>(builder: (cartController) {
//       return GetBuilder<LocalizationController>(builder: (localizationController) {
//         return GetBuilder<GalaxyTexaponController>(builder: (galaxyTexapon) {
//
//               var product = Get.find<GalaxyTexaponController>().galaxyTexaponList[index];
//               Get.find<GalaxyTexaponController>().initProduct(product, Get.find<CartController>());
//
//               var subController = galaxyTexapon;
//               var subControllersList = galaxyTexapon.galaxyTexaponList[index];
//               var route = RouteHelper.getGalaxyTexaponFood(index, "home");
//               var image = galaxyTexapon.galaxyTexaponList[index].img!;
//               var localization = localizationController;
//               var cart = cartController;
//
//               return ProductCard(
//                 index: index,
//                 product: product,
//                 subController: subController,
//                 subControllersList: subControllersList,
//                 route: route,
//                 image: image,
//                 localization: localization,
//                 cart: cart,
//               );
//             },);},);},);
//   }
//   Widget RenotexTexapon (int index) {
//     return GetBuilder<CartController>(builder: (cartController) {
//       return GetBuilder<LocalizationController>(builder: (localizationController) {
//           return GetBuilder<RenotexTexaponController>(builder: (renotexTexapon) {
//
//               var product = Get.find<RenotexTexaponController>().renotexTexaponList[index];
//               Get.find<RenotexTexaponController>().initProduct(product, Get.find<CartController>());
//
//               var subController = renotexTexapon;
//               var subControllersList = renotexTexapon.renotexTexaponList[index];
//               var route = RouteHelper.getRenotexTexaponFood(index, "home");
//               var image = renotexTexapon.renotexTexaponList[index].img!;
//               var localization = localizationController;
//               var cart = cartController;
//
//               return ProductCard(
//                 index: index,
//                 product: product,
//                 subController: subController,
//                 subControllersList: subControllersList,
//                 route: route,
//                 image: image,
//                 localization: localization,
//                 cart: cart,
//               );
//               },);},);},);
//   }
//   Widget MalaysiaTexapon (int index) {
//     return GetBuilder<CartController>(builder: (cartController) {
//       return GetBuilder<LocalizationController>(builder: (localizationController) {
//             return GetBuilder<MalaysiaTexaponController>(builder: (malaysiaTexapon) {
//
//               var product = Get.find<MalaysiaTexaponController>().malaysiaTexaponList[index];
//               Get.find<MalaysiaTexaponController>().initProduct(product, Get.find<CartController>());
//
//               var subController = malaysiaTexapon;
//               var subControllersList = malaysiaTexapon.malaysiaTexaponList[index];
//               var route = RouteHelper.getMalaysiaTexaponFood(index, "home");
//               var image = malaysiaTexapon.malaysiaTexaponList[index].img!;
//               var localization = localizationController;
//               var cart = cartController;
//
//               return ProductCard(
//                 index: index,
//                 product: product,
//                 subController: subController,
//                 subControllersList: subControllersList,
//                 route: route,
//                 image: image,
//                 localization: localization,
//                 cart: cart,
//               );
//             },);},);},);
//   }
//
//   // Widget texaponList (int index1, int index2, int index3) {
//   //   return GetBuilder<CartController>(builder: (cartController) {
//   //     return GetBuilder<LocalizationController>(builder: (localizationController) {
//   //       return GetBuilder<GalaxyTexaponController>(builder: (galaxyTexapon) {
//   //         return GetBuilder<RenotexTexaponController>(builder: (renotexTexapon) {
//   //           return GetBuilder<MalaysiaTexaponController>(builder: (malaysiaTexapon) {
//   //
//   //             var product = Get.find<GalaxyTexaponController>().galaxyTexaponList[index1];
//   //             Get.find<GalaxyTexaponController>().initProduct(product, Get.find<CartController>());
//   //
//   //             List images = [
//   //               galaxyTexapon.galaxyTexaponList[index1].img!,
//   //               renotexTexapon.renotexTexaponList[index2].img!,
//   //               malaysiaTexapon.malaysiaTexaponList[index3].img!
//   //             ];
//   //
//   //             void ShowDialog () {
//   //               showDialog(
//   //                   context: Get.overlayContext!,
//   //                   builder: (_) => Padding(
//   //                       padding: EdgeInsets.only(top: Dimensions.screenHeight - Dimensions.height45 * 6),// Aligns the container to center
//   //                       child: Center(
//   //                         child: Container( // A simplified version of dialog.
//   //                           width: localizationController.selectedIndex == 0 ? Dimensions.width30 * 9 : Dimensions.width30 * 6,
//   //                           height: Dimensions.height45,
//   //                           decoration: BoxDecoration(
//   //                             borderRadius: BorderRadius.circular(Dimensions.radius20 * 2),
//   //                             color: Colors.white,
//   //                           ),
//   //                           alignment: Alignment.bottomCenter,
//   //                           child: Scaffold(
//   //                             backgroundColor: Colors.transparent,
//   //                             body: Center(
//   //                               child: Text(
//   //                                 "Maximum_Quantity_Added".tr,
//   //                                 style: TextStyle(
//   //                                   fontSize: Dimensions.font16,
//   //                                   color: Colors.blue,
//   //                                 ),
//   //                               ),
//   //                             ),
//   //                           ),
//   //                         ),
//   //                       )
//   //                   )
//   //               );
//   //             }
//   //
//   //             void modelSheet (){
//   //               showModalBottomSheet(
//   //                 context: context,
//   //                 builder: (context) {
//   //                   return SizedBox(
//   //                     height: Dimensions.height45 * 12,
//   //                     // color: Colors.transparent,
//   //                     child: ClipRRect(
//   //                       borderRadius: BorderRadius.only(
//   //                         topLeft: Radius.circular(Dimensions.radius20),
//   //                         topRight: Radius.circular(Dimensions.radius20),
//   //                       ),
//   //                       child: WillPopScope(
//   //                         onWillPop: () async {
//   //                           setState(() {
//   //                             newQuantity = int.parse(_newNumber.text);
//   //                             cartController.customAddItem(product, newQuantity >= product.max_quantity! ? product.max_quantity! : newQuantity);
//   //                           });
//   //                           return true;
//   //                         },
//   //                         child: Scaffold(
//   //                           body: Padding(
//   //                             padding: EdgeInsets.only(
//   //                               top: Dimensions.height30,
//   //                               right: Dimensions.width10,
//   //                               left: Dimensions.width10,
//   //                             ),
//   //                             child: Row(
//   //                               children: [
//   //                                 // putting a custom quantity
//   //                                 Padding(
//   //                                   padding: EdgeInsets.only(
//   //                                     top: Dimensions.height45,
//   //                                   ),
//   //                                   child: Container(
//   //                                     // color: Colors.green,
//   //                                     width: Dimensions.width30 * 7.5,
//   //                                     height: Dimensions.height45 * 5,
//   //                                     child: Column(
//   //                                       children: [
//   //                                         Container(
//   //                                           height: Dimensions.height45,
//   //                                           width: double.maxFinite,
//   //                                           child: Text(
//   //                                             "put_required_quantity_here".tr,
//   //                                             style: TextStyle(
//   //                                                 fontSize: Dimensions.font16,
//   //                                                 color: Colors.blue
//   //                                             ),
//   //                                           ),
//   //                                         ),
//   //                                         Container(
//   //                                             height: Dimensions.height45 / 1.5,
//   //                                             width: Dimensions.width30 * 7,
//   //                                             // color: Colors.red,
//   //                                             child: TextFormField(
//   //                                               controller: _newNumber,
//   //                                               keyboardType: TextInputType.number,
//   //                                               autofocus: true,
//   //                                               inputFormatters: <TextInputFormatter>[
//   //                                                 // for below version 2 use this
//   //                                                 FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//   //                                                 // for version 2 and greater you can also use this
//   //                                                 FilteringTextInputFormatter.digitsOnly
//   //                                               ],
//   //                                               decoration: InputDecoration(
//   //                                                 hintText: "type_number".tr,
//   //                                                 // icon: Icon(Icons.phone_iphone)
//   //                                               ),
//   //                                             )
//   //                                         ),
//   //                                         _newNumber.text.isEmpty ? Padding(
//   //                                           padding: EdgeInsets.only(right: Dimensions.width5, left: Dimensions.width5),
//   //                                           child: Container(
//   //                                             height: Dimensions.height30,
//   //                                             width: double.maxFinite,
//   //                                             child: Text(
//   //                                               "You_Should_put_a_Quantity".tr,
//   //                                               style: TextStyle(
//   //                                                   color: Colors.red
//   //                                               ),
//   //                                             ),
//   //                                           ),
//   //                                         ) : Container(),
//   //                                         SizedBox(height: Dimensions.height20,),
//   //                                         ElevatedButton(
//   //                                           onPressed: () {
//   //                                             setState(() {
//   //                                               newQuantity = int.parse(_newNumber.text);
//   //                                               cartController.customAddItem(product, newQuantity >= product.max_quantity! ? product.max_quantity! : newQuantity);
//   //                                               // Get.back();
//   //                                               Navigator.pop(context);
//   //                                               if(cartController.getQuantity(product) == product.max_quantity) {
//   //                                                 ShowDialog();
//   //                                               }
//   //                                             });
//   //                                           },
//   //                                           style: ElevatedButton.styleFrom(
//   //                                             fixedSize: Size(
//   //                                                 Dimensions.width30 * 7,
//   //                                                 Dimensions.height45
//   //                                             ),
//   //                                             primary: Colors.blue,
//   //                                           ),
//   //                                           child: CustomBigText(
//   //                                             text: "put_quantity_to_cart".tr,
//   //                                             color: Colors.white,
//   //                                             size: Dimensions.font16,
//   //                                           ),
//   //                                         )
//   //                                       ],
//   //                                     ),
//   //                                   ),
//   //                                 ),
//   //
//   //                                 // The Image
//   //                                 Container(
//   //                                   width: Dimensions.width30 * 6,
//   //                                   height: Dimensions.height45 * 5.5,
//   //                                   // color: Colors.yellow,
//   //                                   child: ClipRRect(
//   //                                     borderRadius: BorderRadius.circular(Dimensions.radius20),
//   //                                     child: CachedNetworkImage(
//   //                                       imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + galaxyTexapon.galaxyTexaponList[index1].img!,
//   //                                       height: Dimensions.listViewImgSize / 1.3,
//   //                                       width: Dimensions.listViewImgSize,
//   //                                       fit: BoxFit.fitHeight,
//   //                                       placeholder: (context, url) => Container(color: Colors.black12,),
//   //                                       errorWidget: (context, url, error) => Container(
//   //                                         color: Colors.black12,
//   //                                         child: const Icon(Icons.error, color: Colors.red),
//   //                                       ),
//   //                                     ),
//   //                                   ),
//   //                                 ),
//   //                               ],
//   //                             ),
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   );
//   //                 },
//   //                 isScrollControlled: true,
//   //                 shape: RoundedRectangleBorder(
//   //                   borderRadius: BorderRadius.vertical(
//   //                     top: Radius.circular(Dimensions.radius20),
//   //                   ),
//   //                 ),
//   //               );
//   //             }
//   //
//   //             return Container(
//   //               margin: EdgeInsets.only(
//   //                 left: Dimensions.width20 / 5,
//   //                 right: Dimensions.width20 / 5,
//   //               ),
//   //               decoration: BoxDecoration(
//   //                 borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
//   //                 border: Border.all(width: 2, color: Colors.blueGrey.withOpacity(0.2),),
//   //                 color: Colors.grey.shade200,
//   //                 boxShadow: [
//   //                   //darker shadow at bottom right
//   //                   localizationController.selectedIndex == 0 ?
//   //                   BoxShadow(
//   //                       color: Colors.grey.shade700.withOpacity(0.7),
//   //                       offset: const Offset(3, 3),
//   //                       blurRadius: 3,
//   //                       spreadRadius: 1
//   //                   ) :
//   //                   BoxShadow(
//   //                       color: Colors.grey.shade700.withOpacity(0.7),
//   //                       offset: const Offset(-3, 3),
//   //                       blurRadius: 3,
//   //                       spreadRadius: 1
//   //                   ),
//   //
//   //                   //Lighter shadow at top right
//   //                   // BoxShadow(
//   //                   //     color: Colors.grey.shade300.withOpacity(0.7),
//   //                   //     offset: const Offset(3, -3),
//   //                   //     blurRadius: 3,
//   //                   //     spreadRadius: 1
//   //                   // ),
//   //                 ],
//   //                 gradient: localizationController.selectedIndex == 0 ?
//   //                 LinearGradient(
//   //                   begin: Alignment.topLeft,
//   //                   end: Alignment.bottomRight,
//   //                   colors: [
//   //                     Colors.grey.shade200,
//   //                     Colors.grey.shade400
//   //                   ],
//   //                   stops: const [
//   //                     0.1,
//   //                     0.9
//   //                   ],
//   //                 ) :
//   //                 LinearGradient(
//   //                   begin: Alignment.topRight,
//   //                   end: Alignment.bottomLeft,
//   //                   colors: [
//   //                     Colors.grey.shade200,
//   //                     Colors.grey.shade400
//   //                   ],
//   //                   stops: const [
//   //                     0.1,
//   //                     0.9
//   //                   ],
//   //                 ),
//   //               ),
//   //
//   //               child: Padding(
//   //                 padding: EdgeInsets.all(Dimensions.height10 / 4),
//   //                 child: Stack(
//   //                   children: [
//   //                     // Product Info
//   //                     Positioned.fill(
//   //                       top: Dimensions.height10 / 2,
//   //                       bottom: Dimensions.height45 * 2.3,
//   //                       left: localizationController.selectedIndex == 0 ? Dimensions.width5 : Dimensions.width30 * 2,
//   //                       right: localizationController.selectedIndex == 0 ? Dimensions.width30 * 2 : Dimensions.width5,
//   //                       child: SizedBox(
//   //                         width: Dimensions.width30 * 3,
//   //                         height: Dimensions.height45 * 3.5,
//   //                         // color: Colors.red,
//   //                         child: Column(
//   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                           crossAxisAlignment: CrossAxisAlignment.start,
//   //                           children: [
//   //                             ProductCardText(
//   //                               text: "Weight".tr,
//   //                               value: product.weight.toString().tr + "KG".tr,
//   //                             ),
//   //                             ProductCardText(
//   //                               text: "Origin".tr,
//   //                               value: product.origin!.tr,
//   //                             ),
//   //                             ProductCardText(
//   //                               text: "Company".tr,
//   //                               value: product.company.toString().tr,
//   //                             ),
//   //                             ProductCardText(
//   //                               text: "Concentration".tr,
//   //                               value: product.concentration.toString().tr,
//   //                             ),
//   //                             ProductCardText(
//   //                               text: "Type".tr,
//   //                               value: product.type.toString().tr,
//   //                             ),
//   //                             ProductCardText(
//   //                               text: "Expiration".tr,
//   //                               value: product.expiration.toString().tr,
//   //                             ),
//   //                             ProductCardText(
//   //                               text: "Production_Date".tr,
//   //                               value: product.production_date.toString().tr,
//   //                             ),
//   //                             ProductCardText(
//   //                               text: "Price".tr,
//   //                               // value: "2500 جنية",
//   //                               value: galaxyTexapon.inCartItems <= product.quantity2! ?
//   //                               product.price.toString() + " " + "Pound".tr : galaxyTexapon.inCartItems >= product.quantity2! && galaxyTexapon.inCartItems <= product.quantity3! ?
//   //                               product.price2.toString() + " " + "Pound".tr : galaxyTexapon.inCartItems >= product.quantity3! && galaxyTexapon.inCartItems <= product.quantity4! ?
//   //                               product.price3.toString() + " " + "Pound".tr : product.price4.toString() + " " + "Pound".tr,
//   //                               colors: Colors.red,
//   //                               fontWeight: FontWeight.w900,
//   //                             ),
//   //                           ],
//   //                         ),
//   //                       ),
//   //                     ),
//   //                     // The Image
//   //                     Positioned.fill(
//   //                       top: Dimensions.height10 / 2,
//   //                       bottom: Dimensions.height45 * 2.2,
//   //                       left: localizationController.selectedIndex == 0 ? Dimensions.width30 : -Dimensions.width30 / 2.5,
//   //                       right: localizationController.selectedIndex == 0 ? -Dimensions.width30 * 1.5 : Dimensions.width30 * 2.5,
//   //                       child: Container(
//   //                         width: Dimensions.width30 * 2,
//   //                         height: Dimensions.height45 * 3,
//   //                         // color: Colors.green,
//   //                         child: ClipRRect(
//   //                           borderRadius: BorderRadius.circular(Dimensions.radius20),
//   //                           // child: Image.asset(
//   //                           //   // _selectedIndex == 0 ?
//   //                           //   // ElMomtazLabsaImages[index] :
//   //                           //   // SuperElMomtazLabsaImages[index],
//   //                           //   products[_selectedIndex],
//   //                           //   fit: BoxFit.fitHeight,),
//   //                           child: GestureDetector(
//   //                             onTap: (){
//   //                               Get.toNamed(RouteHelper.getGalaxyTexaponFood(index1, "home"));
//   //                               // print("selectedIndex : " + _selectedIndex.toString());
//   //                               // Get.toNamed(RouteHelper.getPopularFood(index, "home"));
//   //                             },
//   //                             child: CachedNetworkImage(
//   //                               imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + images[widget.pageId],
//   //                               height: Dimensions.listViewImgSize / 1.3,
//   //                               width: Dimensions.listViewImgSize,
//   //                               fit: BoxFit.fitHeight,
//   //                               placeholder: (context, url) => Container(color: Colors.black12,),
//   //                               errorWidget: (context, url, error) => Container(
//   //                                 color: Colors.black12,
//   //                                 child: const Icon(Icons.error, color: Colors.red),
//   //                               ),
//   //                             ),
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                     // The Name
//   //                     Positioned.fill(
//   //                       top: Dimensions.height45 * 2.5,
//   //                       bottom: Dimensions.width5,
//   //                       left: localizationController.selectedIndex == 0 ? Dimensions.width5 : Dimensions.width5,
//   //                       right: localizationController.selectedIndex == 0 ? Dimensions.width5 : Dimensions.width5,
//   //                       child: Container(
//   //                         width: Dimensions.screenWidth,
//   //                         height: Dimensions.height45 * 1.2,
//   //                         // color: Colors.yellow,
//   //                         alignment: Alignment.center,
//   //                         child: CustomSmallText(
//   //                           // text: "سلفونيك سوبر الممتاز",
//   //                           text: galaxyTexapon.galaxyTexaponList[index1].name!.tr,
//   //                           color: Colors.black,
//   //                           size: Dimensions.font20,
//   //                           // alignment: Alignment.center,
//   //                         ),
//   //                       ),
//   //                     ),
//   //                     // Button of Add To Cart
//   //                     Positioned.fill(
//   //                       top: Dimensions.height45 * 4.8,
//   //                       bottom: Dimensions.width5 / 3,
//   //                       left: localizationController.selectedIndex == 0 ? Dimensions.width5 * 0 : Dimensions.width5 * 0,
//   //                       right: localizationController.selectedIndex == 0 ? Dimensions.width5 * 0 : Dimensions.width5 * 0,
//   //                       child: Container(
//   //                         width: double.infinity / 1.5,
//   //                         height: Dimensions.height30 * 1.4,
//   //                         padding: EdgeInsets.only(right: Dimensions.width5 / 2, left: Dimensions.width5 / 2),
//   //                         child: cartController.existInCart(product) && galaxyTexapon.checkQuantity(-1) == 0 || galaxyTexapon.inCartItems.toString() == "0" ?
//   //                         ElevatedButton(
//   //                           onPressed: () {
//   //                             galaxyTexapon.increase(product);
//   //                             galaxyTexapon.addItem(product);
//   //                           },
//   //                           style: ElevatedButton.styleFrom(
//   //                             fixedSize: const Size(
//   //                                 double.maxFinite,
//   //                                 double.maxFinite
//   //                             ),
//   //                             primary: Colors.blue,
//   //                           ),
//   //                           child: CustomBigText(
//   //                             text: "Add_To_Cart".tr,
//   //                             color: Colors.white,
//   //                             size: Dimensions.font16,
//   //                           ),
//   //                         ) :
//   //                         //Remove And Add Container
//   //                         Container(
//   //                           width: double.maxFinite,
//   //                           height: Dimensions.height20 * 2,
//   //                           margin: EdgeInsets.only(
//   //                             top: Dimensions.height10 / 13,
//   //                           ),
//   //                           decoration: BoxDecoration(
//   //                             borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
//   //                           ),
//   //                           child: Row(
//   //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                             children: [
//   //                               //Add Icon
//   //                               InkWell(
//   //                                 onTap: (){
//   //                                   galaxyTexapon.increase(product);
//   //                                   galaxyTexapon.addItem(product);
//   //                                   if(cartController.getQuantity(product) == 10) {     modelSheet();     }
//   //                                   if(cartController.getQuantity(product) == product.max_quantity) {     ShowDialog();     }
//   //                                 },
//   //                                 child: Container(
//   //                                   width: Dimensions.width30 * 1.5,
//   //                                   height: double.maxFinite,
//   //                                   decoration: BoxDecoration(
//   //                                     color: cartController.getQuantity(product) == product.max_quantity ? Colors.grey : Colors.blue,
//   //                                     borderRadius: BorderRadius.circular(Dimensions.radius15 / 2.5),
//   //                                   ),
//   //                                   child: const Icon(
//   //                                     Icons.add,
//   //                                     color: Colors.white,
//   //                                   ),
//   //
//   //                                 ),
//   //                               ),
//   //
//   //
//   //                               //inCartItems
//   //                               InkWell(
//   //                                 onTap: () => modelSheet(),
//   //                                 child: Container(
//   //                                   height: double.maxFinite,
//   //                                   width: Dimensions.width30 * 2.5,
//   //                                   // color: Colors.red,
//   //                                   alignment: Alignment.center,
//   //                                   child: CustomBigText(
//   //                                     text: galaxyTexapon.inCartItems.toString(),
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //
//   //
//   //                               //Remove Icon
//   //                               InkWell(
//   //                                 onTap: (){
//   //                                   galaxyTexapon.decrease(product);
//   //                                   galaxyTexapon.addItem(product);
//   //                                 },
//   //                                 child: Container(
//   //                                   width: Dimensions.width30 * 1.5,
//   //                                   height: double.infinity,
//   //                                   decoration: BoxDecoration(
//   //                                     color: Colors.blue,
//   //                                     borderRadius: BorderRadius.circular(Dimensions.radius15 / 2.5),
//   //                                   ),
//   //                                   child: const Icon(
//   //                                     Icons.remove,
//   //                                     color: Colors.white,
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //                             ],
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ),
//   //             );
//   //           },);},);});});},);
//   // }
// }
//
