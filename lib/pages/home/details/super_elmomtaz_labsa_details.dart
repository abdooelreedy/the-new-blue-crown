// import 'package:badges/badges.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:theblue_crown/controllers/controller_lists/product_grids/el_momtaz_labsa_controller.dart';
// import 'package:theblue_crown/controllers/controller_lists/product_grids/popular_product_controller.dart';
// import 'package:theblue_crown/controllers/controller_lists/product_grids/super_el_momtaz_labsa_controller.dart';
// import 'package:theblue_crown/controllers/language_controller.dart';
// import 'package:theblue_crown/pages/home/product_info_text.dart';
// import 'package:theblue_crown/routes/route_helper.dart';
// import 'package:theblue_crown/utils/dimensions.dart';
// import 'package:theblue_crown/widgets/custom_big_text.dart';
// import 'package:theblue_crown/widgets/expandable_text.dart';
// import '../../../animations/fade_animation.dart';
// import '../../../animations/scale_animation.dart';
// import '../../../animations/slide_animation.dart';
// import '../../../controllers/cart_controller.dart';
// import '../../../utils/app_constants.dart';
// import '../products/elmomtaz_labsa_5KG.dart';
//
//
//
// class SuperElMomtazLabsaDetails extends StatefulWidget {
//   final int pageId ;
//   final String page;
//   const SuperElMomtazLabsaDetails({
//     Key? key,
//     required this.pageId,
//     required this.page,
//   }) : super(key: key);
//
//   @override
//   State<SuperElMomtazLabsaDetails> createState() => _SuperElMomtazLabsaDetailsState();
//
// }
//
// class _SuperElMomtazLabsaDetailsState extends State<SuperElMomtazLabsaDetails> with TickerProviderStateMixin{
//
//   // Elmomtaz_Labsa_31KG products = new Elmomtaz_Labsa_31KG();
//
//   int _selectedIndex = 0;
//
//   List<String> name = [
//     'Details',
//     'Comments',
//   ];
//
//   TextEditingController _newNumber = TextEditingController();
//   int newQuantity = 0;
//
//   Elmomtaz_Labsa_5KG products = new Elmomtaz_Labsa_5KG();
//
//   @override
//   Widget build(BuildContext context) {
//
//     var product = Get.find<SuperElMomtazLabsaController>().superElMomtazLabsaList[widget.pageId];
//     Get.find<SuperElMomtazLabsaController>().initProduct(product, Get.find<CartController>());
//
//     TabController _tabController =
//     TabController(length: 2, vsync: this);
//
//     return
//       GetBuilder<CartController>(builder: (cartController){
//       return GetBuilder<SuperElMomtazLabsaController>(builder: (superElMomtazLabsa){
//         return GetBuilder<LocalizationController>(builder: (localizationController){
//
//           void ShowDialog () {
//             showDialog(
//                 context: Get.overlayContext!,
//                 builder: (_) => Padding(
//                     padding: EdgeInsets.only(top: Dimensions.screenHeight - Dimensions.height45 * 6),// Aligns the container to center
//                     child: Center(
//                       child: Container( // A simplified version of dialog.
//                         width: localizationController.selectedIndex == 0 ? Dimensions.width30 * 9 : Dimensions.width30 * 6,
//                         height: Dimensions.height45,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(Dimensions.radius20 * 2),
//                           color: Colors.white,
//                         ),
//                         alignment: Alignment.bottomCenter,
//                         child: Scaffold(
//                           backgroundColor: Colors.transparent,
//                           body: Center(
//                             child: Text(
//                               "Maximum_Quantity_Added".tr,
//                               style: TextStyle(
//                                 fontSize: Dimensions.font16,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                 )
//             );
//           }
//
//           void modelSheet () {
//             showModalBottomSheet(
//               context: context,
//               builder: (context) {
//                 return SizedBox(
//                   height: Dimensions.height45 * 12,
//                   // color: Colors.transparent,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(Dimensions.radius20),
//                       topRight: Radius.circular(Dimensions.radius20),
//                     ),
//                     child: WillPopScope(
//                       onWillPop: () async {
//                         setState(() {
//                           newQuantity = int.parse(_newNumber.text);
//                           cartController.customAddItem(product, newQuantity >= product.max_quantity! ? product.max_quantity! : newQuantity);
//                         });
//                         return true;
//                       },
//                       child: Scaffold(
//                         body: Padding(
//                           padding: EdgeInsets.only(
//                             top: Dimensions.height30,
//                             right: Dimensions.width10,
//                             left: Dimensions.width10,
//                           ),
//                           child: Row(
//                             children: [
//                               // putting a custom quantity
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: Dimensions.height45,
//                                 ),
//                                 child: Container(
//                                   // color: Colors.green,
//                                   width: Dimensions.width30 * 7.5,
//                                   height: Dimensions.height45 * 5,
//                                   child: Column(
//                                     children: [
//                                       Container(
//                                         height: Dimensions.height45,
//                                         width: double.maxFinite,
//                                         child: Text(
//                                           "put_required_quantity_here".tr,
//                                           style: TextStyle(
//                                               fontSize: Dimensions.font16,
//                                               color: Colors.blue
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                           height: Dimensions.height45 / 1.5,
//                                           width: Dimensions.width30 * 7,
//                                           // color: Colors.red,
//                                           child: TextFormField(
//                                             controller: _newNumber,
//                                             keyboardType: TextInputType.number,
//                                             autofocus: true,
//                                             inputFormatters: <TextInputFormatter>[
//                                               // for below version 2 use this
//                                               FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                                               // for version 2 and greater you can also use this
//                                               FilteringTextInputFormatter.digitsOnly
//                                             ],
//                                             decoration: InputDecoration(
//                                               hintText: "type_number".tr,
//                                               // icon: Icon(Icons.phone_iphone)
//                                             ),
//                                           )
//                                       ),
//                                       _newNumber.text.isEmpty ? Padding(
//                                         padding: EdgeInsets.only(right: Dimensions.width5, left: Dimensions.width5),
//                                         child: Container(
//                                           height: Dimensions.height30,
//                                           width: double.maxFinite,
//                                           child: Text(
//                                             "You_Should_put_a_Quantity".tr,
//                                             style: TextStyle(
//                                                 color: Colors.red
//                                             ),
//                                           ),
//                                         ),
//                                       ) : Container(),
//                                       SizedBox(height: Dimensions.height20,),
//                                       ElevatedButton(
//                                         onPressed: () {
//                                           setState(() {
//                                             newQuantity = int.parse(_newNumber.text);
//                                             cartController.customAddItem(product, newQuantity >= product.max_quantity! ? product.max_quantity! : newQuantity);
//                                             // Get.back();
//                                             Navigator.pop(context);
//                                             if(cartController.getQuantity(product) == product.max_quantity) {ShowDialog();}
//                                           });
//                                         },
//                                         style: ElevatedButton.styleFrom(
//                                           fixedSize: Size(
//                                               Dimensions.width30 * 7,
//                                               Dimensions.height45
//                                           ),
//                                           primary: Colors.blue,
//                                         ),
//                                         child: CustomBigText(
//                                           text: "put_quantity_to_cart".tr,
//                                           color: Colors.white,
//                                           size: Dimensions.font16,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                               // The Image
//                               Container(
//                                 width: Dimensions.width30 * 6,
//                                 height: Dimensions.height45 * 5.5,
//                                 // color: Colors.yellow,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(Dimensions.radius20),
//                                   child: CachedNetworkImage(
//                                     imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + superElMomtazLabsa.superElMomtazLabsaList[widget.pageId].img!,
//                                     height: Dimensions.listViewImgSize / 1.3,
//                                     width: Dimensions.listViewImgSize,
//                                     fit: BoxFit.fitHeight,
//                                     placeholder: (context, url) => Container(color: Colors.black12,),
//                                     errorWidget: (context, url, error) => Container(
//                                       color: Colors.black12,
//                                       child: const Icon(Icons.error, color: Colors.red),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               isScrollControlled: true,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(Dimensions.radius20),
//                 ),
//               ),
//             );
//           }
//
//           return Scaffold(
//             backgroundColor: Colors.white,
//             // backgroundColor: Color(0xff293f6e),
//             body: CustomScrollView(
//               slivers: [
//                 SliverAppBar(
//                   title: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                         onTap: (){
//                           Get.toNamed(RouteHelper.getInitial());
//                         },
//                         child: CircleAvatar(
//                           radius: Dimensions.radius15,
//                           backgroundColor: Colors.transparent,
//                           child: const Icon(Icons.arrow_back, color: Colors.blue,),
//                         ),
//                       ),
//                     ],
//                   ),
//                   bottom: PreferredSize(
//                     preferredSize: Size.fromHeight(Dimensions.height15 * 7),
//                     child: FadeAnimation(
//                       intervalStart: 0.04,
//                       duration: const Duration(milliseconds: 1250),
//                       child: SlideAnimation(
//                         begin: Offset(0, Dimensions.height20 * 14),
//                         intervalStart: 0.4,
//                         duration: const Duration(milliseconds: 1250),
//                         child: Container(
//                           height: Dimensions.height20 * 6,
//                           alignment: Alignment.centerRight,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(top: Dimensions.height10),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//
//                                     //The Name
//                                     CustomBigText(
//                                       text: product.name!.tr,
//                                       // text: products.name.tr,
//                                       size: Dimensions.font26,
//                                       color: Colors.black,
//                                     ),
//
//                                     SizedBox(width: Dimensions.width15,),
//
//                                     //The Price
//                                     Row(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           cartController.totalItemAmount(product, 0) == 0 ?
//                                           product.price.toString() :
//                                           cartController.totalItemAmount(product, 0).toString(),
//                                           // products.price,
//                                           style: TextStyle(
//                                             fontSize: Dimensions.font26,
//                                             color: Colors.blue,
//                                             fontWeight: FontWeight.w800,
//                                           ),
//                                         ),
//                                         SizedBox(width: Dimensions.width10,),
//                                         Padding(
//                                           padding: EdgeInsets.only(top: Dimensions.height10 / 2),
//                                           child: CustomBigText(
//                                             //text: product.name!,
//                                             text: "Pound".tr,
//                                             fontWeight: FontWeight.w800,
//                                             overflow: TextOverflow.ellipsis,
//                                             size: Dimensions.font26,
//                                             color: Colors.blue,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(width: Dimensions.width15,),
//                               Container(
//                                 // color: Colors.red,
//                                 height: Dimensions.height45 * 1.4,
//                                 child: ListView.separated(
//                                   scrollDirection: Axis.horizontal,
//                                   physics: const NeverScrollableScrollPhysics(),
//                                   itemCount: 2,
//                                   separatorBuilder: (BuildContext context, int index) {return SizedBox(width: Dimensions.width10 / 2);},
//                                   itemBuilder: (context, index){
//                                     return GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           _selectedIndex = index;
//                                         });
//                                       },
//                                       child: _selectedIndex == index ?
//                                       SelectedCategoryItem(
//                                         name: name[index].tr,
//                                         backgroundColor: Colors.white,
//                                       ) :
//                                       UnSelectedCategoryItem(
//                                         name: name[index].tr,
//                                         backgroundColor: Colors.white,
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               // TabBar(
//                               //   controller: _tabController,
//                               //   labelColor: Colors.black,
//                               //   unselectedLabelColor: Colors.grey,
//                               //   tabs: const [
//                               //     Tab(text: "التفاصيل"),
//                               //     Tab(text: "التعليقات",),
//                               //   ]
//                               // ),
//                             ],
//                           ),
//                           width: double.maxFinite,
//                           padding: EdgeInsets.only(top: Dimensions.height10 / 10, bottom: Dimensions.height10 / 2, right: Dimensions.width15, left: Dimensions.width15),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             // color: Color(0xff293f6e),
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(Dimensions.radius20),
//                               topRight: Radius.circular(Dimensions.radius20),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   automaticallyImplyLeading: false,
//                   toolbarHeight: Dimensions.height30,
//                   pinned: true,
//                   backgroundColor: Colors.white,
//                   // backgroundColor: Color(0xff293f6e),
//                   expandedHeight: Dimensions.height45 * 12,
//                   flexibleSpace: FlexibleSpaceBar(
//                     background: Hero(
//                       tag: "tag",
//                       child: Stack(
//                         children: [
//
//                           // yellow back shape
//                           Positioned(
//                             top: 0,
//                             bottom: Dimensions.height45 * 4,
//                             left: localizationController.selectedIndex == 1 ? 0 : Dimensions.width30 * Dimensions.width5,
//                             right: localizationController.selectedIndex == 1 ? Dimensions.width30 * Dimensions.width5 : 0,
//                             child: Container(
//                               alignment: Alignment.topLeft,
//                               height: double.infinity,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 // gradient: LinearGradient(
//                                 //   colors: [
//                                 //     Color(0xFFf7c72a),
//                                 //     Color(0xccc239),
//                                 //   ],
//                                 // ),
//                                 color: Colors.yellow,
//                                 // color: Color(0xFFf7c72a),
//                                 // color: Color(0xff293f6e),
//                                 borderRadius: localizationController.selectedIndex == 1 ?
//                                 BorderRadius.only(bottomRight: Radius.circular(Dimensions.radius30 * 1.5),) :
//                                 BorderRadius.only(bottomLeft: Radius.circular(Dimensions.radius30 * 1.5),),
//                               ),
//                             ),
//                           ),
//
//
//                           // The Image
//                           Positioned.fill(
//                             top: -Dimensions.height45,
//                             bottom: Dimensions.height10 / 2,
//                             left: localizationController.selectedIndex == 0 ? Dimensions.width30 * 6 : Dimensions.width5 / 5,
//                             right: localizationController.selectedIndex == 0 ? Dimensions.width5 / 5 : Dimensions.width30 * 6,
//                             child: ScaleAnimation(
//                               begin: 0,
//                               duration: const Duration(milliseconds: 1000),
//                               intervalStart: 0.2,
//                               curve: Curves.easeOutBack,
//                               child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Badge(
//                                   badgeContent: Text(
//                                     superElMomtazLabsa.inCartItems.toString(),
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: Dimensions.font20
//                                     ),
//                                   ),
//                                   padding: EdgeInsets.all(Dimensions.height10),
//                                   badgeColor: Colors.blue,
//                                   showBadge: superElMomtazLabsa.inCartItems.toString() == "0" ? false : true,
//                                   position: BadgePosition.topEnd(
//                                     top: Dimensions.height10,
//                                     end: Dimensions.height10,
//                                   ),
//                                   child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(Dimensions.radius20),
//                                   child: Container(
//                                     width: Dimensions.width30 * 9,
//                                     height: Dimensions.height45 * 8,
//                                     // color: Colors.red,
//                                     child: CachedNetworkImage(
//                                       imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + superElMomtazLabsa.superElMomtazLabsaList[widget.pageId].img!,
//                                       // height: Dimensions.listViewImgSize,
//                                       // width:Dimensions.listViewImgSize,
//                                       fit: BoxFit.fitHeight,
//                                       placeholder: (context, url) => Container(color: Colors.black12,),
//                                       errorWidget: (context, url, error) => Container(
//                                         color: Colors.black12,
//                                         child: const Icon(Icons.error, color: Colors.red),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 ),
//                                 // child: products.img,
//                               ),
//                             ),
//                           ),
//
//                           //Food Info
//                           Positioned.fill(
//                             // top: -Dimensions.height10 * Dimensions.height15,
//                             top: Dimensions.height30 * 3,
//                             bottom: Dimensions.height30 * 5,
//                             right: localizationController.selectedIndex == 0 ? Dimensions.width30 * 5 : Dimensions.width20 / 2,
//                             left: localizationController.selectedIndex == 0 ? Dimensions.width20 / 2 : Dimensions.width30 * 6,
//                             child: FadeAnimation(
//                               duration: const Duration(milliseconds: 1250),
//                               child: ScaleAnimation(
//                                 intervalStart: 0.10,
//                                 duration: const Duration(milliseconds: 1250),
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       // color: Colors.red,
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children:  [
//                                           ProductInfoText(
//                                             text: "Tare_Weight".tr,
//                                             // value: products.emptyValue + "KG".tr,
//                                             value: product.tare_weight.toString().tr + "KG".tr,
//                                           ),
//                                           ProductInfoText(
//                                             text: "Net_Weight".tr,
//                                             // value: products.netValue + "KG".tr,
//                                             value: product.net_weight.toString().tr + "KG".tr,
//                                           ),
//                                           ProductInfoText(
//                                             text: "Gross_Weight".tr,
//                                             // value: products.fullValue + "KG".tr,
//                                             value: product.gross_weight.toString().tr + "KG".tr,
//                                           ),
//                                           ProductInfoText(
//                                             text: "Origin".tr,
//                                             // value: products.origin.tr,
//                                             value: product.origin.toString().tr,
//                                           ),
//                                           ProductInfoText(
//                                             text: "Company".tr,
//                                             // value: products.company.tr,
//                                             value: product.company.toString().tr,
//                                           ),
//                                           ProductInfoText(
//                                             text: "Concentration".tr,
//                                             // value: products.concentration,
//                                             value: product.concentration.toString().tr,
//                                           ),
//                                           ProductInfoText(
//                                             text: "Type".tr,
//                                             // value: products.type.tr,
//                                             value: product.type.toString().tr,
//                                           ),
//                                           ProductInfoText(
//                                             text: "Expiration".tr,
//                                             // value: products.exp.tr,
//                                             value: product.expiration.toString().tr,
//                                           ),
//                                           ProductInfoText(
//                                             text: "Production_Date".tr,
//                                             // value: products.pro,
//                                             value: product.production_date.toString().tr,
//                                           ),
//                                           ProductInfoText(
//                                             text: "Price".tr,
//
//                                             value: superElMomtazLabsa.inCartItems <= product.quantity2! ?
//                                             product.price.toString() + " " + "Pound".tr : superElMomtazLabsa.inCartItems >= product.quantity2! && superElMomtazLabsa.inCartItems <= product.quantity3! ?
//                                             product.price2.toString() + " " + "Pound".tr : superElMomtazLabsa.inCartItems >= product.quantity3! && superElMomtazLabsa.inCartItems <= product.quantity4! ?
//                                             product.price3.toString() + " " + "Pound".tr : product.price4.toString() + " " + "Pound".tr,
//
//                                             color: superElMomtazLabsa.inCartItems <= product.quantity2! ? Colors.blue : Colors.red,
//                                             fontWeight: FontWeight.w900,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: FadeAnimation(
//                     intervalStart: 0.04,
//                     duration: const Duration(milliseconds: 1250),
//                     child: SlideAnimation(
//                       begin: Offset(0, Dimensions.height20 * 11),
//                       intervalStart: 0.6,
//                       duration: const Duration(milliseconds: 1250),
//                       child:  _selectedIndex == 0 ?
//                       Container(
//                         padding: EdgeInsets.all(Dimensions.height10 / 1.5),
//                         child: SingleChildScrollView(
//                           physics: BouncingScrollPhysics(),
//                           child: ExpandableText(
//                             text: product.description!,
//                             // text: "asfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsd",),
//                             // text: products.description,
//                           ),
//                         ),
//                       ) :
//                       Center(
//                         // height: MediaQuery.of(context).size.height,
//                         child: Text("Hi Again"),
//                       ),
//                     ),
//                     // Container(
//                     //                     child: const SingleChildScrollView(
//                     //                       physics: BouncingScrollPhysics(),
//                     //                       child: ExpandableText(
//                     //                         // text: product.description! +
//                     //                         // text: "asfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsd",),
//                     //                     text: "تحضيرهيتولد حمض السلفونيك بعملية السلفنة. عامل السلفنة عادة هو ثلاثي أكسيد الكبريت. التطبيق الخاص الواسع الطيف لهذه الطريقة هو إنتاج حموض ألكيل البنزين المسلفنة.RC6H5 + SO3 → RC6H4SO3Hفي هذ التفاعل، ثلاثي أكسيد الكبريت هو شغوف بالإلكترون ويخضع الأرين إلى عملية استبدال عطري شغوف بالإلكترونات.يمكن أكسدة الثيولات لتتحول إلى حموض سلفونيك:RSH + 3/2 O2 → RSO3Hالتطبيقاتمع أن الحموض السلفونية الألكيلية والأريلية معروفة، إلا أن معظم التطبيقات مرتبطة بالمشتقات العطرية.المنظفات والفاعلات بالسطحالمنظفات والمواد الفاعلة بالسطح هي جزيئات تتضمن مجموعات عالية القطبية وأخرى لاقطبية. الصابون هو فاعل بالسطح معروف مشتق من الحموض الدسمة. منذ منتصف القرن العشرين، تفوق استخدام حموض السلفونيك على الصابون في المجتمعات المتطورة. فمثلا، ينتج مليوني كيلوغرام من سلفونات ألكيل البنزين سنويًا لأغراض متعددة. سلفونات الليغنين هي مكونات في سوائل الثقب ومواد مضافة لبعض أنواع الخرسانة.الأصبغةالعديد إن لم يكن معظم أصبغة الأنثراكينون تنتج أو تعالج بالسلفنة  تميل حموض السلفونيك للارتباط الوثيق مع البروتينات والكربوهيدرات. معظم الأصبغة القابلة للغسل هي حموض سلفونيك (أو تمتلك مجموعة سولفونيل) لهذا السبب. الأصبغة المباشرة في أغلبها تتضمن مجموعات السلفونيل، وهي تساعد على انحلالية الصباغ في حوض الصباغة لتسهيل انتقاله إلى الألياف النسيجية كالقطن.الأدويةأدوية سلفوناميد المضادة للبكتريا منتجة من حموض السلفونيك.",)
//                     //   ),
//                     //   width: double.maxFinite,
//                     //   // height: MediaQuery.of(context).size.height,
//                     //   // child: TabBarView(
//                     //   //   controller: _tabController,
//                     //   //   children: [
//                     //   //     ExpandableText(
//                     //   //         // text: product.description! +
//                     //   //       text: products.description,
//                     //   //     ),
//                     //   //     const Center(
//                     //   //       // height: MediaQuery.of(context).size.height,
//                     //   //       child: Text("Hi Again"),
//                     //   //     ),
//                     //   //   ],
//                     //   // ),
//                     //   margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,),
//                     // ),
//                   ),
//
//                 ),
//               ],
//             ),
//             bottomNavigationBar: Padding(
//               padding: EdgeInsets.only(right: Dimensions.width15, left: Dimensions.width15, bottom: Dimensions.height20),
//               child: cartController.existInCart(product) && superElMomtazLabsa.checkQuantity(-1) == 0 || superElMomtazLabsa.inCartItems.toString() == "0" ?
//               ElevatedButton(
//                 onPressed: () {
//                   superElMomtazLabsa.increase(product);
//                   superElMomtazLabsa.addItem(product);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(
//                     double.maxFinite,
//                     Dimensions.height45 * 1.5,
//                   ),
//                   primary: Colors.blue,
//                 ),
//                 child: CustomBigText(
//                   text: "Add_To_Cart".tr,
//                   color: Colors.white,
//                   size: Dimensions.font26,
//                 ),
//               )
//                   :
//               //Remove And Add Container
//               Container(
//                 width: double.maxFinite,
//                 height: Dimensions.height45 * 1.5,
//                 decoration: BoxDecoration(
//                   // color: Colors.red,
//                   borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
//                 ),
//                 child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     //Add Icon
//                     InkWell(
//                       onTap: (){
//                         superElMomtazLabsa.increase(product);
//                         superElMomtazLabsa.addItem(product);
//                         if(cartController.getQuantity(product) == 10) {     modelSheet();     }
//                         if(cartController.getQuantity(product) == product.max_quantity) {     ShowDialog();     }
//                       },
//                       child: Container(
//                         width: Dimensions.width30 * 2,
//                         height: double.infinity,
//                         decoration: BoxDecoration(
//                           color: cartController.getQuantity(product) == product.max_quantity ? Colors.grey : Colors.blue,
//                           borderRadius: BorderRadius.circular(Dimensions.radius15 / 3),
//                         ),
//                         child: const Icon(
//                           Icons.add,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//
//                     //inCartItems
//                     InkWell(
//                       onTap: () => modelSheet(),
//                       child: Container(
//                         height: double.maxFinite,
//                         width: Dimensions.width30 * 7.5,
//                         // color: Colors.red,
//                         alignment: Alignment.center,
//                         child: CustomBigText(
//                           text: superElMomtazLabsa.inCartItems.toString(),
//                         ),
//                       ),
//                     ),
//
//                     //Remove Icon
//                     InkWell(
//                       onTap: (){
//                         superElMomtazLabsa.decrease(product);
//                         superElMomtazLabsa.addItem(product);
//                       },
//                       child: Container(
//                         width: Dimensions.width30 * 2,
//                         height: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(Dimensions.radius15 / 3),
//                         ),
//                         child: const Icon(
//                           Icons.remove,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//         );});});
//     // );
//   }
// }
//
// class SelectedCategoryItem extends StatelessWidget {
//   const SelectedCategoryItem(
//       {Key? key,
//         required this.name,
//         required this.backgroundColor
//       })
//       : super(key: key);
//
//   final String name;
//   final Color backgroundColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // alignment: Alignment.bottomCenter,
//       color: backgroundColor,
//       width: MediaQuery.of(context).size.width / 2.2,
//       child: Padding(
//         padding: EdgeInsets.only(top: Dimensions.height15 / 1.2),
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               name,
//               style: Theme.of(context).textTheme.headline6!.copyWith(
//                   fontSize: Dimensions.font20,
//                   color: Colors.blue
//               ),
//             ),
//             SizedBox(height: Dimensions.height10,),
//             Container(
//               height: Dimensions.height10 / 2.5,
//               width: double.maxFinite,
//               color: Colors.blue,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class UnSelectedCategoryItem extends StatelessWidget {
//   const UnSelectedCategoryItem(
//       {Key? key,
//         required this.name,
//         required this.backgroundColor})
//       : super(key: key);
//
//   final String name;
//   final Color backgroundColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: backgroundColor,
//       width: MediaQuery.of(context).size.width / 2.2,
//       child: Padding(
//         padding: EdgeInsets.only(top: Dimensions.height15 / 1.2),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               name,
//               style: Theme.of(context).textTheme.headline6!.copyWith(
//                   fontSize: Dimensions.font20,
//                   color: Colors.grey
//               ),
//             ),
//             SizedBox(height: Dimensions.height10,),
//             Container(
//               height: Dimensions.height10 / 2,
//               width: double.maxFinite,
//               color: Colors.transparent,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:theblue_crown/pages/home/product_info_text.dart';
// // import 'package:theblue_crown/utils/dimensions.dart';
// // import '../../animations/fade_animation.dart';
// // import '../../animations/scale_animation.dart';
// // import '../../animations/slide_animation.dart';
// // import '../../controllers/popular_product_controller.dart';
// // import '../../utils/navigation.dart';
// // import '../../view/widgets/custom_big_text.dart';
// // import 'package:get/get.dart';
// //
// // import '../../view/widgets/expandable_text.dart';
// // class ProductScreen extends StatefulWidget {
// //
// //   // final int pageId ;
// //   // final String page;
// //
// //   const ProductScreen({
// //     Key? key,
// //     // required this.pageId,
// //     // required this.page,
// //   }) : super(key: key);
// //
// //   @override
// //   _ProductScreenState createState() => _ProductScreenState();
// // }
// //
// // class _ProductScreenState extends State<ProductScreen> {
// //   final width = Dimensions.width30 * Dimensions.width5;
// //   late double _height;
// //
// //   final _duration = const Duration(milliseconds: 750);
// //   final _psudoDuration = const Duration(milliseconds: 150);
// //
// //   _navigateBack() async {
// //     await _animateContainerFromBottomToTop();
// //
// //     Navigation.pop(context);
// //   }
// //
// //   _animateContainerFromBottomToTop() async {
// //     //Animate back to default value
// //     _height = MediaQuery.of(context).padding.top + 50;
// //     setState(() {});
// //
// //     //Wait till animation is finished
// //     await Future.delayed(_duration);
// //   }
// //
// //   _animateContainerFromTopToBottom() async {
// //     //Wait
// //     await Future.delayed(_psudoDuration);
// //
// //     //Animate from top to bottom
// //     _height = MediaQuery.of(context).size.height;
// //     setState(() {});
// //   }
// //
// //   @override
// //   void didChangeDependencies() {
// //     super.didChangeDependencies();
// //
// //     //Default height
// //
// //     _height = MediaQuery.of(context).padding.top + 50;
// //     setState(() {});
// //
// //     //Animate Container from Top to bottom
// //     _animateContainerFromTopToBottom();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // backgroundColor: Theme.of(context).primaryColor,
// //       backgroundColor: Colors.blue,
// //       body: AnimatedContainer(
// //         height: _height,
// //         duration: _duration,
// //         padding: EdgeInsets.only(bottom: Dimensions.height10 / 3),
// //         curve: Curves.fastOutSlowIn,
// //         decoration: BoxDecoration(
// //           color: Theme.of(context).scaffoldBackgroundColor,
// //           borderRadius: BorderRadius.only(
// //             bottomRight: Radius.circular(Dimensions.radius20 * 2),
// //             bottomLeft: Radius.circular(Dimensions.radius20 * 2),
// //           ),
// //         ),
// //
// //
// //         child: SingleChildScrollView(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               //The upper part
// //               Container(
// //                 height: Dimensions.height45 * 2,
// //                 width: Dimensions.screenWidth - width,
// //                 color: const Color(0xFFf7c72a),
// //                 // color: Colors.green,
// //               ),
// //               SizedBox(
// //                 height: Dimensions.height45 * 8,
// //                 child: Stack(
// //                   children: [
// //                     //yellow back shape
// //                     Positioned(
// //                       top: 0,
// //                       bottom: Dimensions.height45 * 2 - Dimensions.height15,
// //                       left: 0,
// //                       right: width,
// //                       child: Container(
// //                         alignment: Alignment.topLeft,
// //                         height: double.infinity,
// //                         width: double.infinity,
// //                         decoration: const BoxDecoration(
// //                           color: Color(0xFFf7c72a),
// //                           // color: Colors.red,
// //                           borderRadius: BorderRadius.only(
// //                             bottomRight: Radius.circular(50),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     //The Image
// //                     Positioned.fill(
// //                       top: 0,
// //                       bottom: 0,
// //                       left: -Dimensions.width30 * 2.1,
// //                       child: ScaleAnimation(
// //                         begin: 0,
// //                         duration: const Duration(milliseconds: 1000),
// //                         intervalStart: 0.2,
// //                         curve: Curves.easeOutBack,
// //                         child: Align(
// //                           alignment: Alignment.centerLeft,
// //                           child: Image.asset(
// //                             'assets/images/gmdana.png',
// //                             // 'assets/images/labsa2.png',
// //                             width: Dimensions.width30 * 13.5,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     //Food Info
// //                     Positioned.fill(
// //                       top: Dimensions.height10 / 20,
// //                       bottom: 0,
// //                       right: Dimensions.width30 + Dimensions.width10,
// //                       child: Align(
// //                         alignment: Alignment.centerRight,
// //                         child: FadeAnimation(
// //                           duration: const Duration(milliseconds: 1250),
// //                           child: ScaleAnimation(
// //                             intervalStart: 0.4,
// //                             duration: const Duration(milliseconds: 1250),
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: const <Widget>[
// //                                 ProductInfoText(
// //                                   text: 'الوزن',
// //                                   value: '60 KG',
// //                                 ),
// //                                 ProductInfoText(
// //                                   text: 'المنشأ',
// //                                   value: 'مصر',
// //                                 ),
// //                                 ProductInfoText(
// //                                   text: 'التركيز',
// //                                   value: '85 %',
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //
// //               //the middle part
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 10),
// //                     child: FadeAnimation(
// //                         intervalStart: 0.4,
// //                         duration: const Duration(milliseconds: 1300),
// //                         child: SlideAnimation(
// //                           intervalStart: 0.4,
// //                           begin: const Offset(0, 80),
// //                           duration: const Duration(milliseconds: 1300),
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: <Widget>[
// //                               Text(
// //                                 'Raspberry Donut',
// //                                 style: Theme.of(context).textTheme.headline4,
// //                               ),
// //                               const SizedBox(height: 20),
// //                               Text(
// //                                 '\$12.95',
// //                                 style:
// //                                 Theme.of(context).textTheme.headline4!.copyWith(
// //                                   color: Theme.of(context).primaryColorDark,
// //                                   fontSize: 18,
// //                                   fontWeight: FontWeight.normal,
// //                                 ),
// //                               ),
// //                               const SizedBox(height: 20),
// //                               const ExpandableText(
// //                                 text: 'lorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetorem ipsum doremet',
// //                               ),
// //                               // Text(
// //                               //   'lorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetorem ipsum doremet',
// //                               //   style: Theme.of(context).textTheme.bodyText2,
// //                               // ),
// //                             ],
// //                           ),
// //                         ),
// //                     ),
// //               ),
// //             ],
// //           ),
// //         )
// //       ),
// //       bottomNavigationBar: GetBuilder<PopularProductController>(
// //           builder: (popularProduct){
// //             return Container(
// //               height: Dimensions.bottomHeightBar / 1.25,
// //               padding: EdgeInsets.only(top: Dimensions.height30,
// //                 bottom: Dimensions.height20,
// //                 left: Dimensions.width20,
// //                 right: Dimensions.width20,),
// //               decoration: BoxDecoration(
// //                 color: Colors.blue,
// //                 borderRadius: BorderRadius.only(
// //                   topLeft: Radius.circular(Dimensions.radius20 * 2),
// //                   topRight: Radius.circular(Dimensions.radius20 * 2),
// //                 ),
// //               ),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Container(
// //                     padding: EdgeInsets.only(
// //                       top: Dimensions.height10,
// //                       bottom: Dimensions.height10,
// //                       left: Dimensions.width15,
// //                       right: Dimensions.width15,
// //                     ),
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(
// //                           Dimensions.radius20),
// //                       color: Colors.white,
// //                     ),
// //                     child: Row(
// //                       children: [
// //                         GestureDetector(
// //                           onTap: () {
// //                             popularProduct.setQuantity(false);
// //                           },
// //                           child: Icon(
// //                             Icons.remove,
// //                             color: Colors.grey.shade800,
// //                           ),
// //                         ),
// //                         SizedBox(width: Dimensions.width30,),
// //                         CustomBigText(
// //                           text: popularProduct.inCartItems.toString(),
// //                           alignment: Alignment.center,
// //                         ),
// //                         SizedBox(width: Dimensions.width30,),
// //                         GestureDetector(
// //                           onTap: () {
// //                             popularProduct.setQuantity(true);
// //                           },
// //                           child: Icon(
// //                             Icons.add,
// //                             color: Colors.grey.shade800,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   GestureDetector(
// //                     onTap: () {
// //                       // popularProduct.addItem(product);
// //                       // Get.toNamed(RouteHelper.getInitial());
// //                       // setState(() {
// //                       //   _cartTag = '_cartTag';
// //                       // });
// //                     },
// //                     child: Container(
// //                       padding: EdgeInsets.only(
// //                         top: Dimensions.height10,
// //                         bottom: Dimensions.height10,
// //                         left: Dimensions.width10,
// //                         right: Dimensions.width10,),
// //                       child: CustomBigText(
// //                         // text: "\$ ${product.price!} | أضف للسلة ",
// //                         text: "1800 | أضف للسلة ",
// //                         color: Colors.white,
// //                       ),
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(
// //                             Dimensions.radius20),
// //                         color: Colors.blue,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           }
// //       ),
// //     );
// //   }
// // }