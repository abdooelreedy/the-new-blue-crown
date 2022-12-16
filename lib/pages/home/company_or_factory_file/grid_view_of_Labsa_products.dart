// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:theblue_crown/controllers/controller_lists/product_grids/el_momtaz_labsa_controller.dart';
// import 'package:theblue_crown/controllers/controller_lists/product_grids/super_el_momtaz_labsa_controller.dart';
// import 'package:theblue_crown/pages/home/company_or_factory_file/product_card.dart';
// import '../../../controllers/cart_controller.dart';
// import '../../../controllers/controller_lists/product_grids/malaysia_texapon_controller.dart';
// import '../../../controllers/language_controller.dart';
// import '../../../routes/route_helper.dart';
// import '../../../utils/app_constants.dart';
// import '../../../utils/dimensions.dart';
// import '../../../widgets/custom_big_text.dart';
// import '../../../widgets/custom_small_text.dart';
// import '../ProductCardText.dart';
// import '../details/elmomtaz_labsa_details.dart';
//
// class GridViewOfLabsaProducts extends StatefulWidget {
//
//   final int pageId ;
//
//   const GridViewOfLabsaProducts({
//     Key? key,
//     required this.pageId,
//   }) : super(key: key);
//
//   @override
//   State<GridViewOfLabsaProducts> createState() => _GridViewOfLabsaProductsState();
// }
//
// class _GridViewOfLabsaProductsState extends State<GridViewOfLabsaProducts> {
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
//       body: GetBuilder<ElMomtazLabsaController>(builder: (elMomtazLabsa) {
//         return GetBuilder<SuperElMomtazLabsaController>(builder: (superElMomtazLabsa) {
//
//           List lengths = [
//             elMomtazLabsa.elMomtazLabsaList.length,
//             superElMomtazLabsa.superElMomtazLabsaList.length,
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
//               // working 1
//               List labsa = [
//                 ElMomtazLabsa(index),
//                 SuperElMomtazLabsa(index),
//               ];
//               return labsa[widget.pageId];
//               // print("widget.pageId : " + widget.pageId.toString());
//               // return ElMomtazLabsa(index);
//               // return SuperElMomtazLabsa(index);
//
//
//               // return labsaList(index, index, index);
//               },
//           );},);}),
//     );
//   }
//
//   // working 1
//   Widget ElMomtazLabsa (index) {
//     return GetBuilder<CartController>(builder: (cartController) {
//       return GetBuilder<LocalizationController>(builder: (localizationController) {
//         return GetBuilder<ElMomtazLabsaController>(builder: (elMomtazLabsa) {
//
//             var product = Get.find<ElMomtazLabsaController>().elMomtazLabsaList[index];
//             Get.find<ElMomtazLabsaController>().initProduct(product, Get.find<CartController>());
//
//             var subController = elMomtazLabsa;
//             var subControllersList = elMomtazLabsa.elMomtazLabsaList[index];
//             var route =  RouteHelper.getElMomtazLabsaFood(index, "home");
//             // var route = Get.to(ElMomtazLabsaDetails(page: 'home', pageId: index,));
//             var image = elMomtazLabsa.elMomtazLabsaList[index].img!;
//             var localization = localizationController;
//             var cart = cartController;
//
//             return ProductCard(
//               index: index,
//                 product: product,
//                 subController: subController,
//                 subControllersList: subControllersList,
//                 route: route,
//                 image: image,
//                 localization: localization,
//                 cart: cart,
//             );
//             },);});},);
//   }
//   Widget SuperElMomtazLabsa (index) {
//     return GetBuilder<CartController>(builder: (cartController) {
//       return GetBuilder<LocalizationController>(builder: (localizationController) {
//         return GetBuilder<SuperElMomtazLabsaController>(builder: (superElMomtazLabsa) {
//
//           var product = Get.find<SuperElMomtazLabsaController>().superElMomtazLabsaList[index];
//           Get.find<SuperElMomtazLabsaController>().initProduct(product, Get.find<CartController>());
//
//           var subController = superElMomtazLabsa;
//           var subControllersList = superElMomtazLabsa.superElMomtazLabsaList[index];
//           var route = RouteHelper.getSuperElMomtazLabsaFood(index, "home");
//           var image = superElMomtazLabsa.superElMomtazLabsaList[index].img!;
//           var localization = localizationController;
//           var cart = cartController;
//
//           return ProductCard(
//             index: index,
//             product: product,
//             subController: subController,
//             subControllersList: subControllersList,
//             route: route,
//             image: image,
//             localization: localization,
//             cart: cart,
//           );
//         },);});},);
//   }
//
//
//
//
//
//
//   // Widget ElMomtazLabsa (int index1, int index2) {
//   //   return GetBuilder<CartController>(builder: (cartController) {
//   //     return GetBuilder<LocalizationController>(builder: (localizationController) {
//   //       return GetBuilder<ElMomtazLabsaController>(builder: (elMomtazLabsa) {
//   //         return GetBuilder<SuperElMomtazLabsaController>(builder: (superElMomtazLabsa) {
//   //
//   //
//   //           var product = Get.find<ElMomtazLabsaController>().elMomtazLabsaList[index1];
//   //           Get.find<ElMomtazLabsaController>().initProduct(product, Get.find<CartController>());
//   //
//   //           var product2 = Get.find<SuperElMomtazLabsaController>().superElMomtazLabsaList[index2];
//   //           Get.find<SuperElMomtazLabsaController>().initProduct(product2, Get.find<CartController>());
//   //
//   //           List products = [
//   //             product,
//   //             product2
//   //           ];
//   //
//   //           List subControllers = [
//   //             elMomtazLabsa,
//   //             superElMomtazLabsa
//   //           ];
//   //
//   //           List subControllersLists = [
//   //             elMomtazLabsa.elMomtazLabsaList[index1],
//   //             superElMomtazLabsa.superElMomtazLabsaList[index2]
//   //           ];
//   //
//   //           List routes = [
//   //             RouteHelper.getElMomtazLabsaFood(index1, "home"),
//   //             RouteHelper.getSuperElMomtazLabsaFood(index2, "home")
//   //           ];
//   //
//   //           List images = [
//   //             elMomtazLabsa.elMomtazLabsaList[index1].img!,
//   //             superElMomtazLabsa.superElMomtazLabsaList[index2].img!
//   //           ];
//   //
//   //           void showMeDialog () {
//   //             showDialog(
//   //                 context: Get.overlayContext!,
//   //                 builder: (_) => Padding(
//   //                     padding: EdgeInsets.only(top: Dimensions.screenHeight - Dimensions.height45 * 6),// Aligns the container to center
//   //                     child: Center(
//   //                       child: Container( // A simplified version of dialog.
//   //                         width: localizationController.selectedIndex == 0 ? Dimensions.width30 * 9 : Dimensions.width30 * 6,
//   //                         height: Dimensions.height45,
//   //                         decoration: BoxDecoration(
//   //                           borderRadius: BorderRadius.circular(Dimensions.radius20 * 2),
//   //                           color: Colors.white,
//   //                         ),
//   //                         alignment: Alignment.bottomCenter,
//   //                         child: Scaffold(
//   //                           backgroundColor: Colors.transparent,
//   //                           body: Center(
//   //                             child: Text(
//   //                               "Maximum_Quantity_Added".tr,
//   //                               style: TextStyle(
//   //                                 fontSize: Dimensions.font16,
//   //                                 color: Colors.blue,
//   //                               ),
//   //                             ),
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     )
//   //                 )
//   //             );
//   //           }
//   //
//   //           void modelSheet () {
//   //             showModalBottomSheet(
//   //               context: context,
//   //               builder: (context) {
//   //                 return SizedBox(
//   //                   height: Dimensions.height45 * 12,
//   //                   // color: Colors.transparent,
//   //                   child: ClipRRect(
//   //                     borderRadius: BorderRadius.only(
//   //                       topLeft: Radius.circular(Dimensions.radius20),
//   //                       topRight: Radius.circular(Dimensions.radius20),
//   //                     ),
//   //                     child: WillPopScope(
//   //                       onWillPop: () async {
//   //                         setState(() {
//   //                           newQuantity = int.parse(_newNumber.text);
//   //                           cartController.customAddItem(products[widget.pageId], newQuantity >= products[widget.pageId].max_quantity! ? products[widget.pageId].max_quantity! : newQuantity);
//   //                         });
//   //                         return true;
//   //                       },
//   //                       child: Scaffold(
//   //                         body: Padding(
//   //                           padding: EdgeInsets.only(
//   //                             top: Dimensions.height30,
//   //                             right: Dimensions.width10,
//   //                             left: Dimensions.width10,
//   //                           ),
//   //                           child: Row(
//   //                             children: [
//   //                               // putting a custom quantity
//   //                               Padding(
//   //                                 padding: EdgeInsets.only(
//   //                                   top: Dimensions.height45,
//   //                                 ),
//   //                                 child: SizedBox(
//   //                                   // color: Colors.green,
//   //                                   width: Dimensions.width30 * 7.5,
//   //                                   height: Dimensions.height45 * 5,
//   //                                   child: Column(
//   //                                     children: [
//   //                                       SizedBox(
//   //                                         height: Dimensions.height45,
//   //                                         width: double.maxFinite,
//   //                                         child: Text(
//   //                                           "put_required_quantity_here".tr,
//   //                                           style: TextStyle(
//   //                                               fontSize: Dimensions.font16,
//   //                                               color: Colors.blue
//   //                                           ),
//   //                                         ),
//   //                                       ),
//   //                                       SizedBox(
//   //                                           height: Dimensions.height45 / 1.5,
//   //                                           width: Dimensions.width30 * 7,
//   //                                           // color: Colors.red,
//   //                                           child: TextFormField(
//   //                                             controller: _newNumber,
//   //                                             keyboardType: TextInputType.number,
//   //                                             autofocus: true,
//   //                                             inputFormatters: <TextInputFormatter>[
//   //                                               // for below version 2 use this
//   //                                               FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//   //                                               // for version 2 and greater you can also use this
//   //                                               FilteringTextInputFormatter.digitsOnly
//   //                                             ],
//   //                                             decoration: InputDecoration(
//   //                                               hintText: "type_number".tr,
//   //                                               // icon: Icon(Icons.phone_iphone)
//   //                                             ),
//   //                                           )
//   //                                       ),
//   //                                       _newNumber.text.isEmpty ? Padding(
//   //                                         padding: EdgeInsets.only(right: Dimensions.width5, left: Dimensions.width5),
//   //                                         child: SizedBox(
//   //                                           height: Dimensions.height30,
//   //                                           width: double.maxFinite,
//   //                                           child: Text(
//   //                                             "You_Should_put_a_Quantity".tr,
//   //                                             style: const TextStyle(
//   //                                                 color: Colors.red
//   //                                             ),
//   //                                           ),
//   //                                         ),
//   //                                       ) : Container(),
//   //                                       SizedBox(height: Dimensions.height20,),
//   //                                       ElevatedButton(
//   //                                         onPressed: () {
//   //                                           setState(() {
//   //                                             newQuantity = int.parse(_newNumber.text);
//   //                                             cartController.customAddItem(products[widget.pageId], newQuantity >= products[widget.pageId].max_quantity! ? products[widget.pageId].max_quantity! : newQuantity);
//   //                                             // Get.back();
//   //                                             Navigator.pop(context);
//   //                                             if(cartController.getQuantity(products[widget.pageId]) == products[widget.pageId].max_quantity) {     showMeDialog();     }
//   //                                           });
//   //                                         },
//   //                                         style: ElevatedButton.styleFrom(
//   //                                           fixedSize: Size(
//   //                                               Dimensions.width30 * 7,
//   //                                               Dimensions.height45
//   //                                           ),
//   //                                           primary: Colors.blue,
//   //                                         ),
//   //                                         child: CustomBigText(
//   //                                           text: "put_quantity_to_cart".tr,
//   //                                           color: Colors.white,
//   //                                           size: Dimensions.font16,
//   //                                         ),
//   //                                       )
//   //                                     ],
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //
//   //                               // The Image
//   //                               SizedBox(
//   //                                 width: Dimensions.width30 * 6,
//   //                                 height: Dimensions.height45 * 5.5,
//   //                                 // color: Colors.yellow,
//   //                                 child: ClipRRect(
//   //                                   borderRadius: BorderRadius.circular(Dimensions.radius20),
//   //                                   child: CachedNetworkImage(
//   //                                     imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + images[widget.pageId],
//   //                                     height: Dimensions.listViewImgSize / 1.3,
//   //                                     width: Dimensions.listViewImgSize,
//   //                                     fit: BoxFit.fitHeight,
//   //                                     placeholder: (context, url) => Container(color: Colors.black12,),
//   //                                     errorWidget: (context, url, error) => Container(
//   //                                       color: Colors.black12,
//   //                                       child: const Icon(Icons.error, color: Colors.red),
//   //                                     ),
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //                             ],
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 );
//   //               },
//   //               isScrollControlled: true,
//   //               shape: RoundedRectangleBorder(
//   //                 borderRadius: BorderRadius.vertical(
//   //                   top: Radius.circular(Dimensions.radius20),
//   //                 ),
//   //               ),
//   //             );
//   //           }
//   //
//   //           return Container(
//   //             margin: EdgeInsets.only(left: Dimensions.width20 / 5, right: Dimensions.width20 / 5,),
//   //             decoration: BoxDecoration(
//   //               borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
//   //               border: Border.all(width: 2, color: Colors.blueGrey.withOpacity(0.2),),
//   //               color: Colors.grey.shade200,
//   //               boxShadow: [
//   //                 //darker shadow at bottom right
//   //                 localizationController.selectedIndex == 0 ?
//   //                 BoxShadow(
//   //                     color: Colors.grey.shade700.withOpacity(0.7),
//   //                     offset: const Offset(3, 3),
//   //                     blurRadius: 3,
//   //                     spreadRadius: 1
//   //                 ) :
//   //                 BoxShadow(
//   //                     color: Colors.grey.shade700.withOpacity(0.7),
//   //                     offset: const Offset(-3, 3),
//   //                     blurRadius: 3,
//   //                     spreadRadius: 1
//   //                 ),
//   //               ],
//   //               gradient:
//   //               localizationController.selectedIndex == 0 ?
//   //               LinearGradient(
//   //                 begin: Alignment.topLeft,
//   //                 end: Alignment.bottomRight,
//   //                 colors: [
//   //                   Colors.grey.shade200,
//   //                   Colors.grey.shade400
//   //                 ],
//   //                 stops: const [
//   //                   0.1,
//   //                   0.9
//   //                 ],
//   //               ) :
//   //               LinearGradient(
//   //                 begin: Alignment.topRight,
//   //                 end: Alignment.bottomLeft,
//   //                 colors: [
//   //                   Colors.grey.shade200,
//   //                   Colors.grey.shade400
//   //                 ],
//   //                 stops: const [
//   //                   0.1,
//   //                   0.9
//   //                 ],
//   //               ),
//   //             ),
//   //
//   //             child: Padding(
//   //               padding: EdgeInsets.all(Dimensions.height10 / 4),
//   //               child: Stack(
//   //                 children: [
//   //                   // Product Info
//   //                   Positioned.fill(
//   //                     top: Dimensions.height10 / 2,
//   //                     bottom: Dimensions.height45 * 2.3,
//   //                     left: localizationController.selectedIndex == 0 ? Dimensions.width5 : Dimensions.width30 * 2,
//   //                     right: localizationController.selectedIndex == 0 ? Dimensions.width30 * 2 : Dimensions.width5,
//   //                     child: SizedBox(
//   //                       width: Dimensions.width30 * 3,
//   //                       height: Dimensions.height45 * 3.5,
//   //                       // color: Colors.red,
//   //                       child: Column(
//   //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                         crossAxisAlignment: CrossAxisAlignment.start,
//   //                         children: [
//   //                           ProductCardText(
//   //                             text: "Weight".tr,
//   //                             value: products[widget.pageId].weight.toString().tr + "KG".tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Origin".tr,
//   //                             value: products[widget.pageId].origin!.toString().tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Company".tr,
//   //                             value: products[widget.pageId].company.toString().tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Concentration".tr,
//   //                             value: products[widget.pageId].concentration.toString().tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Type".tr,
//   //                             value: products[widget.pageId].type.toString().tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Expiration".tr,
//   //                             value: products[widget.pageId].expiration.toString().tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Production_Date".tr,
//   //                             value: products[widget.pageId].production_date.toString().tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Price".tr,
//   //                             // value: "2500 جنية",
//   //                             value: subControllers[widget.pageId].inCartItems <= products[widget.pageId].quantity2! ?
//   //                             products[widget.pageId].price.toString() + " " + "Pound".tr : subControllers[widget.pageId].inCartItems >= products[widget.pageId].quantity2! && subControllers[widget.pageId].inCartItems <= products[widget.pageId].quantity3! ?
//   //                             products[widget.pageId].price2.toString() + " " + "Pound".tr : subControllers[widget.pageId].inCartItems >= products[widget.pageId].quantity3! && subControllers[widget.pageId].inCartItems <= products[widget.pageId].quantity4! ?
//   //                             products[widget.pageId].price3.toString() + " " + "Pound".tr : products[widget.pageId].price4.toString() + " " + "Pound".tr,
//   //                             colors: Colors.red,
//   //                             fontWeight: FontWeight.w900,
//   //                           ),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   // The Image
//   //                   Positioned.fill(
//   //                     top: Dimensions.height10 / 2,
//   //                     bottom: Dimensions.height45 * 2.2,
//   //                     left: localizationController.selectedIndex == 0 ? Dimensions.width30 : -Dimensions.width30 / 2.5,
//   //                     right: localizationController.selectedIndex == 0 ? -Dimensions.width30 * 1.5 : Dimensions.width30 * 2.5,
//   //                     child: SizedBox(
//   //                       width: Dimensions.width30 * 2,
//   //                       height: Dimensions.height45 * 3,
//   //                       // color: Colors.green,
//   //                       child: ClipRRect(
//   //                         borderRadius: BorderRadius.circular(Dimensions.radius20),
//   //                         // child: Image.asset(
//   //                         //   // _selectedIndex == 0 ?
//   //                         //   // ElMomtazLabsaImages[index] :
//   //                         //   // SuperElMomtazLabsaImages[index],
//   //                         //   products[_selectedIndex],
//   //                         //   fit: BoxFit.fitHeight,),
//   //                         child: GestureDetector(
//   //                           onTap: (){
//   //                             Get.toNamed(routes[widget.pageId]);
//   //                             // print("selectedIndex : " + _selectedIndex.toString());
//   //                             // Get.toNamed(RouteHelper.getPopularFood(index, "home"));
//   //                           },
//   //                           child: CachedNetworkImage(
//   //                             imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + images[widget.pageId],
//   //                             height: Dimensions.listViewImgSize / 1.3,
//   //                             width: Dimensions.listViewImgSize,
//   //                             fit: BoxFit.fitHeight,
//   //                             placeholder: (context, url) => Container(color: Colors.black12,),
//   //                             errorWidget: (context, url, error) => Container(
//   //                               color: Colors.black12,
//   //                               child: const Icon(Icons.error, color: Colors.red),
//   //                             ),
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   // The Name
//   //                   Positioned.fill(
//   //                     top: Dimensions.height45 * 2.5,
//   //                     bottom: Dimensions.width5,
//   //                     left: localizationController.selectedIndex == 0 ? Dimensions.width5 : Dimensions.width5,
//   //                     right: localizationController.selectedIndex == 0 ? Dimensions.width5 : Dimensions.width5,
//   //                     child: Container(
//   //                       width: Dimensions.screenWidth,
//   //                       height: Dimensions.height45 * 1.2,
//   //                       // color: Colors.yellow,
//   //                       alignment: Alignment.center,
//   //                       child: CustomSmallText(
//   //                         // text: "سلفونيك سوبر الممتاز",
//   //                         text: subControllersLists[widget.pageId].name!.toString().tr,
//   //                         color: Colors.black,
//   //                         size: Dimensions.font20,
//   //                         // alignment: Alignment.center,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   // Button of Add To Cart
//   //                   Positioned.fill(
//   //                     top: Dimensions.height45 * 4.8,
//   //                     bottom: Dimensions.width5 / 3,
//   //                     left: localizationController.selectedIndex == 0 ? Dimensions.width5 * 0 : Dimensions.width5 * 0,
//   //                     right: localizationController.selectedIndex == 0 ? Dimensions.width5 * 0 : Dimensions.width5 * 0,
//   //                     child: Container(
//   //                       width: double.infinity / 1.5,
//   //                       height: Dimensions.height30 * 1.4,
//   //                       padding: EdgeInsets.only(right: Dimensions.width5 / 2, left: Dimensions.width5 / 2),
//   //                       child: cartController.existInCart(products[widget.pageId]) && subControllers[widget.pageId].checkQuantity(-1) == 0 || subControllers[widget.pageId].inCartItems.toString() == "0" ?
//   //                       ElevatedButton(
//   //                         onPressed: () {
//   //                           subControllers[widget.pageId].increase(products[widget.pageId]);
//   //                           subControllers[widget.pageId].addItem(products[widget.pageId]);
//   //                         },
//   //                         style: ElevatedButton.styleFrom(
//   //                           fixedSize: const Size(
//   //                               double.maxFinite,
//   //                               double.maxFinite
//   //                           ),
//   //                           primary: Colors.blue,
//   //                         ),
//   //                         child: CustomBigText(
//   //                           text: "Add_To_Cart".tr,
//   //                           color: Colors.white,
//   //                           size: Dimensions.font16,
//   //                         ),
//   //                       ) :
//   //                       //Remove And Add Container
//   //                       Container(
//   //                         width: double.maxFinite,
//   //                         height: Dimensions.height20 * 2,
//   //                         margin: EdgeInsets.only(
//   //                           top: Dimensions.height10 / 13,
//   //                         ),
//   //                         decoration: BoxDecoration(
//   //                           borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
//   //                         ),
//   //                         child: Row(
//   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                           children: [
//   //                             //Add Icon
//   //                             InkWell(
//   //                               onTap: (){
//   //                                 subControllers[widget.pageId].increase(products[widget.pageId]);
//   //                                 subControllers[widget.pageId].addItem(products[widget.pageId]);
//   //                                 if(cartController.getQuantity(products[widget.pageId]) == 10) {     modelSheet();     }
//   //                                 if(cartController.getQuantity(products[widget.pageId]) == products[widget.pageId].max_quantity) {     showMeDialog();     }
//   //                               },
//   //                               child: Container(
//   //                                 width: Dimensions.width30 * 1.5,
//   //                                 height: double.maxFinite,
//   //                                 decoration: BoxDecoration(
//   //                                   color: cartController.getQuantity(products[widget.pageId]) == products[widget.pageId].max_quantity ? Colors.grey : Colors.blue,
//   //                                   borderRadius: BorderRadius.circular(Dimensions.radius15 / 2.5),
//   //                                 ),
//   //                                 child: const Icon(
//   //                                   Icons.add,
//   //                                   color: Colors.white,
//   //                                 ),
//   //
//   //                               ),
//   //                             ),
//   //
//   //
//   //                             //inCartItems
//   //                             InkWell(
//   //                               onTap: () => modelSheet(),
//   //                               child: Container(
//   //                                 height: double.maxFinite,
//   //                                 width: Dimensions.width30 * 2.5,
//   //                                 // color: Colors.red,
//   //                                 alignment: Alignment.center,
//   //                                 child: CustomBigText(text: subControllers[widget.pageId].inCartItems.toString(),),
//   //                               ),
//   //                             ),
//   //
//   //
//   //
//   //                             //Remove Icon
//   //                             InkWell(
//   //                               onTap: (){
//   //                                 subControllers[widget.pageId].decrease(products[widget.pageId]);
//   //                                 subControllers[widget.pageId].addItem(products[widget.pageId]);
//   //                               },
//   //                               child: Container(
//   //                                 width: Dimensions.width30 * 1.5,
//   //                                 height: double.infinity,
//   //                                 decoration: BoxDecoration(
//   //                                   color: Colors.blue,
//   //                                   borderRadius: BorderRadius.circular(Dimensions.radius15 / 2.5),
//   //                                 ),
//   //                                 child: const Icon(
//   //                                   Icons.remove,
//   //                                   color: Colors.white,
//   //                                 ),
//   //                               ),
//   //                             ),
//   //                           ],
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 ],
//   //               ),),);},);},);});},);
//   // }
//   // Widget SuperElMomtazLabsa (int index1, int index2) {
//   //   return GetBuilder<CartController>(builder: (cartController) {
//   //     return GetBuilder<LocalizationController>(builder: (localizationController) {
//   //       return GetBuilder<ElMomtazLabsaController>(builder: (elMomtazLabsa) {
//   //         return GetBuilder<SuperElMomtazLabsaController>(builder: (superElMomtazLabsa) {
//   //
//   //
//   //           var product = Get.find<ElMomtazLabsaController>().elMomtazLabsaList[index1];
//   //           Get.find<ElMomtazLabsaController>().initProduct(product, Get.find<CartController>());
//   //
//   //           var product2 = Get.find<SuperElMomtazLabsaController>().superElMomtazLabsaList[index2];
//   //           Get.find<SuperElMomtazLabsaController>().initProduct(product2, Get.find<CartController>());
//   //
//   //           List products = [
//   //             product,
//   //             product2
//   //           ];
//   //
//   //           List subControllers = [
//   //             elMomtazLabsa,
//   //             superElMomtazLabsa
//   //           ];
//   //
//   //           List subControllersLists = [
//   //             elMomtazLabsa.elMomtazLabsaList[index1],
//   //             superElMomtazLabsa.superElMomtazLabsaList[index2]
//   //           ];
//   //
//   //           List routes = [
//   //             RouteHelper.getElMomtazLabsaFood(index1, "home"),
//   //             RouteHelper.getSuperElMomtazLabsaFood(index2, "home")
//   //           ];
//   //
//   //           List images = [
//   //             elMomtazLabsa.elMomtazLabsaList[index1].img!,
//   //             superElMomtazLabsa.superElMomtazLabsaList[index2].img!
//   //           ];
//   //
//   //           void showMeDialog () {
//   //             showDialog(
//   //                 context: Get.overlayContext!,
//   //                 builder: (_) => Padding(
//   //                     padding: EdgeInsets.only(top: Dimensions.screenHeight - Dimensions.height45 * 6),// Aligns the container to center
//   //                     child: Center(
//   //                       child: Container( // A simplified version of dialog.
//   //                         width: localizationController.selectedIndex == 0 ? Dimensions.width30 * 9 : Dimensions.width30 * 6,
//   //                         height: Dimensions.height45,
//   //                         decoration: BoxDecoration(
//   //                           borderRadius: BorderRadius.circular(Dimensions.radius20 * 2),
//   //                           color: Colors.white,
//   //                         ),
//   //                         alignment: Alignment.bottomCenter,
//   //                         child: Scaffold(
//   //                           backgroundColor: Colors.transparent,
//   //                           body: Center(
//   //                             child: Text(
//   //                               "Maximum_Quantity_Added".tr,
//   //                               style: TextStyle(
//   //                                 fontSize: Dimensions.font16,
//   //                                 color: Colors.blue,
//   //                               ),
//   //                             ),
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     )
//   //                 )
//   //             );
//   //           }
//   //
//   //           void modelSheet () {
//   //             showModalBottomSheet(
//   //               context: context,
//   //               builder: (context) {
//   //                 return SizedBox(
//   //                   height: Dimensions.height45 * 12,
//   //                   // color: Colors.transparent,
//   //                   child: ClipRRect(
//   //                     borderRadius: BorderRadius.only(
//   //                       topLeft: Radius.circular(Dimensions.radius20),
//   //                       topRight: Radius.circular(Dimensions.radius20),
//   //                     ),
//   //                     child: WillPopScope(
//   //                       onWillPop: () async {
//   //                         setState(() {
//   //                           newQuantity = int.parse(_newNumber.text);
//   //                           cartController.customAddItem(products[widget.pageId], newQuantity >= products[widget.pageId].max_quantity! ? products[widget.pageId].max_quantity! : newQuantity);
//   //                         });
//   //                         return true;
//   //                       },
//   //                       child: Scaffold(
//   //                         body: Padding(
//   //                           padding: EdgeInsets.only(
//   //                             top: Dimensions.height30,
//   //                             right: Dimensions.width10,
//   //                             left: Dimensions.width10,
//   //                           ),
//   //                           child: Row(
//   //                             children: [
//   //                               // putting a custom quantity
//   //                               Padding(
//   //                                 padding: EdgeInsets.only(
//   //                                   top: Dimensions.height45,
//   //                                 ),
//   //                                 child: SizedBox(
//   //                                   // color: Colors.green,
//   //                                   width: Dimensions.width30 * 7.5,
//   //                                   height: Dimensions.height45 * 5,
//   //                                   child: Column(
//   //                                     children: [
//   //                                       SizedBox(
//   //                                         height: Dimensions.height45,
//   //                                         width: double.maxFinite,
//   //                                         child: Text(
//   //                                           "put_required_quantity_here".tr,
//   //                                           style: TextStyle(
//   //                                               fontSize: Dimensions.font16,
//   //                                               color: Colors.blue
//   //                                           ),
//   //                                         ),
//   //                                       ),
//   //                                       SizedBox(
//   //                                           height: Dimensions.height45 / 1.5,
//   //                                           width: Dimensions.width30 * 7,
//   //                                           // color: Colors.red,
//   //                                           child: TextFormField(
//   //                                             controller: _newNumber,
//   //                                             keyboardType: TextInputType.number,
//   //                                             autofocus: true,
//   //                                             inputFormatters: <TextInputFormatter>[
//   //                                               // for below version 2 use this
//   //                                               FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//   //                                               // for version 2 and greater you can also use this
//   //                                               FilteringTextInputFormatter.digitsOnly
//   //                                             ],
//   //                                             decoration: InputDecoration(
//   //                                               hintText: "type_number".tr,
//   //                                               // icon: Icon(Icons.phone_iphone)
//   //                                             ),
//   //                                           )
//   //                                       ),
//   //                                       _newNumber.text.isEmpty ? Padding(
//   //                                         padding: EdgeInsets.only(right: Dimensions.width5, left: Dimensions.width5),
//   //                                         child: SizedBox(
//   //                                           height: Dimensions.height30,
//   //                                           width: double.maxFinite,
//   //                                           child: Text(
//   //                                             "You_Should_put_a_Quantity".tr,
//   //                                             style: const TextStyle(
//   //                                                 color: Colors.red
//   //                                             ),
//   //                                           ),
//   //                                         ),
//   //                                       ) : Container(),
//   //                                       SizedBox(height: Dimensions.height20,),
//   //                                       ElevatedButton(
//   //                                         onPressed: () {
//   //                                           setState(() {
//   //                                             newQuantity = int.parse(_newNumber.text);
//   //                                             cartController.customAddItem(products[widget.pageId], newQuantity >= products[widget.pageId].max_quantity! ? products[widget.pageId].max_quantity! : newQuantity);
//   //                                             // Get.back();
//   //                                             Navigator.pop(context);
//   //                                             if(cartController.getQuantity(products[widget.pageId]) == products[widget.pageId].max_quantity) {     showMeDialog();     }
//   //                                           });
//   //                                         },
//   //                                         style: ElevatedButton.styleFrom(
//   //                                           fixedSize: Size(
//   //                                               Dimensions.width30 * 7,
//   //                                               Dimensions.height45
//   //                                           ),
//   //                                           primary: Colors.blue,
//   //                                         ),
//   //                                         child: CustomBigText(
//   //                                           text: "put_quantity_to_cart".tr,
//   //                                           color: Colors.white,
//   //                                           size: Dimensions.font16,
//   //                                         ),
//   //                                       )
//   //                                     ],
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //
//   //                               // The Image
//   //                               SizedBox(
//   //                                 width: Dimensions.width30 * 6,
//   //                                 height: Dimensions.height45 * 5.5,
//   //                                 // color: Colors.yellow,
//   //                                 child: ClipRRect(
//   //                                   borderRadius: BorderRadius.circular(Dimensions.radius20),
//   //                                   child: CachedNetworkImage(
//   //                                     imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + images[widget.pageId],
//   //                                     height: Dimensions.listViewImgSize / 1.3,
//   //                                     width: Dimensions.listViewImgSize,
//   //                                     fit: BoxFit.fitHeight,
//   //                                     placeholder: (context, url) => Container(color: Colors.black12,),
//   //                                     errorWidget: (context, url, error) => Container(
//   //                                       color: Colors.black12,
//   //                                       child: const Icon(Icons.error, color: Colors.red),
//   //                                     ),
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //                             ],
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 );
//   //               },
//   //               isScrollControlled: true,
//   //               shape: RoundedRectangleBorder(
//   //                 borderRadius: BorderRadius.vertical(
//   //                   top: Radius.circular(Dimensions.radius20),
//   //                 ),
//   //               ),
//   //             );
//   //           }
//   //
//   //           return Container(
//   //             margin: EdgeInsets.only(left: Dimensions.width20 / 5, right: Dimensions.width20 / 5,),
//   //             decoration: BoxDecoration(
//   //               borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
//   //               border: Border.all(width: 2, color: Colors.blueGrey.withOpacity(0.2),),
//   //               color: Colors.grey.shade200,
//   //               boxShadow: [
//   //                 //darker shadow at bottom right
//   //                 localizationController.selectedIndex == 0 ?
//   //                 BoxShadow(
//   //                     color: Colors.grey.shade700.withOpacity(0.7),
//   //                     offset: const Offset(3, 3),
//   //                     blurRadius: 3,
//   //                     spreadRadius: 1
//   //                 ) :
//   //                 BoxShadow(
//   //                     color: Colors.grey.shade700.withOpacity(0.7),
//   //                     offset: const Offset(-3, 3),
//   //                     blurRadius: 3,
//   //                     spreadRadius: 1
//   //                 ),
//   //               ],
//   //               gradient:
//   //               localizationController.selectedIndex == 0 ?
//   //               LinearGradient(
//   //                 begin: Alignment.topLeft,
//   //                 end: Alignment.bottomRight,
//   //                 colors: [
//   //                   Colors.grey.shade200,
//   //                   Colors.grey.shade400
//   //                 ],
//   //                 stops: const [
//   //                   0.1,
//   //                   0.9
//   //                 ],
//   //               ) :
//   //               LinearGradient(
//   //                 begin: Alignment.topRight,
//   //                 end: Alignment.bottomLeft,
//   //                 colors: [
//   //                   Colors.grey.shade200,
//   //                   Colors.grey.shade400
//   //                 ],
//   //                 stops: const [
//   //                   0.1,
//   //                   0.9
//   //                 ],
//   //               ),
//   //             ),
//   //
//   //             child: Padding(
//   //               padding: EdgeInsets.all(Dimensions.height10 / 4),
//   //               child: Stack(
//   //                 children: [
//   //                   // Product Info
//   //                   Positioned.fill(
//   //                     top: Dimensions.height10 / 2,
//   //                     bottom: Dimensions.height45 * 2.3,
//   //                     left: localizationController.selectedIndex == 0 ? Dimensions.width5 : Dimensions.width30 * 2,
//   //                     right: localizationController.selectedIndex == 0 ? Dimensions.width30 * 2 : Dimensions.width5,
//   //                     child: SizedBox(
//   //                       width: Dimensions.width30 * 3,
//   //                       height: Dimensions.height45 * 3.5,
//   //                       // color: Colors.red,
//   //                       child: Column(
//   //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                         crossAxisAlignment: CrossAxisAlignment.start,
//   //                         children: [
//   //                           ProductCardText(
//   //                             text: "Weight".tr,
//   //                             value: products[widget.pageId].weight.toString().tr + "KG".tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Origin".tr,
//   //                             value: products[widget.pageId].origin!.toString().tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Company".tr,
//   //                             value: products[widget.pageId].company.toString().tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Concentration".tr,
//   //                             value: products[widget.pageId].concentration.toString().tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Type".tr,
//   //                             value: products[widget.pageId].type.toString().tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Expiration".tr,
//   //                             value: products[widget.pageId].expiration.toString().tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Production_Date".tr,
//   //                             value: products[widget.pageId].production_date.toString().tr,
//   //                           ),
//   //                           ProductCardText(
//   //                             text: "Price".tr,
//   //                             // value: "2500 جنية",
//   //                             value: subControllers[widget.pageId].inCartItems <= products[widget.pageId].quantity2! ?
//   //                             products[widget.pageId].price.toString() + " " + "Pound".tr : subControllers[widget.pageId].inCartItems >= products[widget.pageId].quantity2! && subControllers[widget.pageId].inCartItems <= products[widget.pageId].quantity3! ?
//   //                             products[widget.pageId].price2.toString() + " " + "Pound".tr : subControllers[widget.pageId].inCartItems >= products[widget.pageId].quantity3! && subControllers[widget.pageId].inCartItems <= products[widget.pageId].quantity4! ?
//   //                             products[widget.pageId].price3.toString() + " " + "Pound".tr : products[widget.pageId].price4.toString() + " " + "Pound".tr,
//   //                             colors: Colors.red,
//   //                             fontWeight: FontWeight.w900,
//   //                           ),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   // The Image
//   //                   Positioned.fill(
//   //                     top: Dimensions.height10 / 2,
//   //                     bottom: Dimensions.height45 * 2.2,
//   //                     left: localizationController.selectedIndex == 0 ? Dimensions.width30 : -Dimensions.width30 / 2.5,
//   //                     right: localizationController.selectedIndex == 0 ? -Dimensions.width30 * 1.5 : Dimensions.width30 * 2.5,
//   //                     child: SizedBox(
//   //                       width: Dimensions.width30 * 2,
//   //                       height: Dimensions.height45 * 3,
//   //                       // color: Colors.green,
//   //                       child: ClipRRect(
//   //                         borderRadius: BorderRadius.circular(Dimensions.radius20),
//   //                         // child: Image.asset(
//   //                         //   // _selectedIndex == 0 ?
//   //                         //   // ElMomtazLabsaImages[index] :
//   //                         //   // SuperElMomtazLabsaImages[index],
//   //                         //   products[_selectedIndex],
//   //                         //   fit: BoxFit.fitHeight,),
//   //                         child: GestureDetector(
//   //                           onTap: (){
//   //                             Get.toNamed(routes[widget.pageId]);
//   //                             // print("selectedIndex : " + _selectedIndex.toString());
//   //                             // Get.toNamed(RouteHelper.getPopularFood(index, "home"));
//   //                           },
//   //                           child: CachedNetworkImage(
//   //                             imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + images[widget.pageId],
//   //                             height: Dimensions.listViewImgSize / 1.3,
//   //                             width: Dimensions.listViewImgSize,
//   //                             fit: BoxFit.fitHeight,
//   //                             placeholder: (context, url) => Container(color: Colors.black12,),
//   //                             errorWidget: (context, url, error) => Container(
//   //                               color: Colors.black12,
//   //                               child: const Icon(Icons.error, color: Colors.red),
//   //                             ),
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   // The Name
//   //                   Positioned.fill(
//   //                     top: Dimensions.height45 * 2.5,
//   //                     bottom: Dimensions.width5,
//   //                     left: localizationController.selectedIndex == 0 ? Dimensions.width5 : Dimensions.width5,
//   //                     right: localizationController.selectedIndex == 0 ? Dimensions.width5 : Dimensions.width5,
//   //                     child: Container(
//   //                       width: Dimensions.screenWidth,
//   //                       height: Dimensions.height45 * 1.2,
//   //                       // color: Colors.yellow,
//   //                       alignment: Alignment.center,
//   //                       child: CustomSmallText(
//   //                         // text: "سلفونيك سوبر الممتاز",
//   //                         text: subControllersLists[widget.pageId].name!.toString().tr,
//   //                         color: Colors.black,
//   //                         size: Dimensions.font20,
//   //                         // alignment: Alignment.center,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   // Button of Add To Cart
//   //                   Positioned.fill(
//   //                     top: Dimensions.height45 * 4.8,
//   //                     bottom: Dimensions.width5 / 3,
//   //                     left: localizationController.selectedIndex == 0 ? Dimensions.width5 * 0 : Dimensions.width5 * 0,
//   //                     right: localizationController.selectedIndex == 0 ? Dimensions.width5 * 0 : Dimensions.width5 * 0,
//   //                     child: Container(
//   //                       width: double.infinity / 1.5,
//   //                       height: Dimensions.height30 * 1.4,
//   //                       padding: EdgeInsets.only(right: Dimensions.width5 / 2, left: Dimensions.width5 / 2),
//   //                       child: cartController.existInCart(products[widget.pageId]) && subControllers[widget.pageId].checkQuantity(-1) == 0 || subControllers[widget.pageId].inCartItems.toString() == "0" ?
//   //                       ElevatedButton(
//   //                         onPressed: () {
//   //                           subControllers[widget.pageId].increase(products[widget.pageId]);
//   //                           subControllers[widget.pageId].addItem(products[widget.pageId]);
//   //                         },
//   //                         style: ElevatedButton.styleFrom(
//   //                           fixedSize: const Size(
//   //                               double.maxFinite,
//   //                               double.maxFinite
//   //                           ),
//   //                           primary: Colors.blue,
//   //                         ),
//   //                         child: CustomBigText(
//   //                           text: "Add_To_Cart".tr,
//   //                           color: Colors.white,
//   //                           size: Dimensions.font16,
//   //                         ),
//   //                       ) :
//   //                       //Remove And Add Container
//   //                       Container(
//   //                         width: double.maxFinite,
//   //                         height: Dimensions.height20 * 2,
//   //                         margin: EdgeInsets.only(
//   //                           top: Dimensions.height10 / 13,
//   //                         ),
//   //                         decoration: BoxDecoration(
//   //                           borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
//   //                         ),
//   //                         child: Row(
//   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                           children: [
//   //                             //Add Icon
//   //                             InkWell(
//   //                               onTap: (){
//   //                                 subControllers[widget.pageId].increase(products[widget.pageId]);
//   //                                 subControllers[widget.pageId].addItem(products[widget.pageId]);
//   //                                 if(cartController.getQuantity(products[widget.pageId]) == 10) {     modelSheet();     }
//   //                                 if(cartController.getQuantity(products[widget.pageId]) == products[widget.pageId].max_quantity) {     showMeDialog();     }
//   //                               },
//   //                               child: Container(
//   //                                 width: Dimensions.width30 * 1.5,
//   //                                 height: double.maxFinite,
//   //                                 decoration: BoxDecoration(
//   //                                   color: cartController.getQuantity(products[widget.pageId]) == products[widget.pageId].max_quantity ? Colors.grey : Colors.blue,
//   //                                   borderRadius: BorderRadius.circular(Dimensions.radius15 / 2.5),
//   //                                 ),
//   //                                 child: const Icon(
//   //                                   Icons.add,
//   //                                   color: Colors.white,
//   //                                 ),
//   //
//   //                               ),
//   //                             ),
//   //
//   //
//   //                             //inCartItems
//   //                             InkWell(
//   //                               onTap: () => modelSheet(),
//   //                               child: Container(
//   //                                 height: double.maxFinite,
//   //                                 width: Dimensions.width30 * 2.5,
//   //                                 // color: Colors.red,
//   //                                 alignment: Alignment.center,
//   //                                 child: CustomBigText(text: subControllers[widget.pageId].inCartItems.toString(),),
//   //                               ),
//   //                             ),
//   //
//   //
//   //
//   //                             //Remove Icon
//   //                             InkWell(
//   //                               onTap: (){
//   //                                 subControllers[widget.pageId].decrease(products[widget.pageId]);
//   //                                 subControllers[widget.pageId].addItem(products[widget.pageId]);
//   //                               },
//   //                               child: Container(
//   //                                 width: Dimensions.width30 * 1.5,
//   //                                 height: double.infinity,
//   //                                 decoration: BoxDecoration(
//   //                                   color: Colors.blue,
//   //                                   borderRadius: BorderRadius.circular(Dimensions.radius15 / 2.5),
//   //                                 ),
//   //                                 child: const Icon(
//   //                                   Icons.remove,
//   //                                   color: Colors.white,
//   //                                 ),
//   //                               ),
//   //                             ),
//   //                           ],
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 ],
//   //               ),),);},);},);});},);
//   // }
//
//
//
// }
//
