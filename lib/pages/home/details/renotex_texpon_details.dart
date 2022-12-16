// import 'package:badges/badges.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:theblue_crown/controllers/controller_lists/product_grids/renotex_texapon_controller.dart';
//
// import '../../../animations/fade_animation.dart';
// import '../../../animations/scale_animation.dart';
// import '../../../animations/slide_animation.dart';
// import '../../../controllers/cart_controller.dart';
// import '../../../controllers/language_controller.dart';
// import '../../../controllers/post_controller.dart';
// import '../../../routes/route_helper.dart';
// import '../../../utils/app_constants.dart';
// import '../../../utils/dimensions.dart';
// import '../../../widgets/custom_big_text.dart';
// import '../../../widgets/expandable_text.dart';
// import '../../../widgets/post_data.dart';
// import '../../../widgets/post_field.dart';
// import '../advertisement_view.dart';
// import '../product_info_text.dart';
//
// class RenotexTexponDetails extends StatefulWidget {
//
//   final int pageId ;
//   final String page;
//
//   const RenotexTexponDetails({
//     Key? key,
//     required this.pageId,
//     required this.page,
//   }) : super(key: key);
//
//   @override
//   State<RenotexTexponDetails> createState() => _RenotexTexponDetailsState();
// }
//
// class _RenotexTexponDetailsState extends State<RenotexTexponDetails> with TickerProviderStateMixin {
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
//   final PostController _postController = Get.put(PostController(postRepo: Get.find()));
//   final TextEditingController _textController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//
//     var product = Get.find<RenotexTexaponController>().renotexTexaponList[widget.pageId];
//     Get.find<RenotexTexaponController>().initProduct(product, Get.find<CartController>());
//
//     TabController _tabController =
//     TabController(length: 2, vsync: this);
//
//     return GetBuilder<CartController>(builder: (cartController){
//         return GetBuilder<RenotexTexaponController>(builder: (renotexTexapon){
//           return GetBuilder<LocalizationController>(builder: (localizationController){
//
//             void ShowDialog () {
//               showDialog(
//                   context: Get.overlayContext!,
//                   builder: (_) => Padding(
//                       padding: EdgeInsets.only(top: Dimensions.screenHeight - Dimensions.height45 * 6),// Aligns the container to center
//                       child: Center(
//                         child: Container( // A simplified version of dialog.
//                           width: localizationController.selectedIndex == 0 ? Dimensions.width30 * 9 : Dimensions.width30 * 6,
//                           height: Dimensions.height45,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(Dimensions.radius20 * 2),
//                             color: Colors.white,
//                           ),
//                           alignment: Alignment.bottomCenter,
//                           child: Scaffold(
//                             backgroundColor: Colors.transparent,
//                             body: Center(
//                               child: Text(
//                                 "Maximum_Quantity_Added".tr,
//                                 style: TextStyle(
//                                   fontSize: Dimensions.font16,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                   )
//               );
//             }
//
//             void modelSheet () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (context) {
//                   return SizedBox(
//                     height: Dimensions.height45 * 12,
//                     // color: Colors.transparent,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(Dimensions.radius20),
//                         topRight: Radius.circular(Dimensions.radius20),
//                       ),
//                       child: WillPopScope(
//                         onWillPop: () async {
//                           setState(() {
//                             newQuantity = int.parse(_newNumber.text);
//                             cartController.customAddItem(product, newQuantity >= product.max_quantity! ? product.max_quantity! : newQuantity);
//                           });
//                           return true;
//                         },
//                         child: Scaffold(
//                           body: Padding(
//                             padding: EdgeInsets.only(
//                               top: Dimensions.height30,
//                               right: Dimensions.width10,
//                               left: Dimensions.width10,
//                             ),
//                             child: Row(
//                               children: [
//                                 // putting a custom quantity
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     top: Dimensions.height45,
//                                   ),
//                                   child: Container(
//                                     // color: Colors.green,
//                                     width: Dimensions.width30 * 7.5,
//                                     height: Dimensions.height45 * 5,
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           height: Dimensions.height45,
//                                           width: double.maxFinite,
//                                           child: Text(
//                                             "put_required_quantity_here".tr,
//                                             style: TextStyle(
//                                                 fontSize: Dimensions.font16,
//                                                 color: Colors.blue
//                                             ),
//                                           ),
//                                         ),
//                                         Container(
//                                             height: Dimensions.height45 / 1.5,
//                                             width: Dimensions.width30 * 7,
//                                             // color: Colors.red,
//                                             child: TextFormField(
//                                               controller: _newNumber,
//                                               keyboardType: TextInputType.number,
//                                               autofocus: true,
//                                               inputFormatters: <TextInputFormatter>[
//                                                 // for below version 2 use this
//                                                 FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                                                 // for version 2 and greater you can also use this
//                                                 FilteringTextInputFormatter.digitsOnly
//                                               ],
//                                               decoration: InputDecoration(
//                                                 hintText: "type_number".tr,
//                                                 // icon: Icon(Icons.phone_iphone)
//                                               ),
//                                             )
//                                         ),
//                                         _newNumber.text.isEmpty ? Padding(
//                                           padding: EdgeInsets.only(right: Dimensions.width5, left: Dimensions.width5),
//                                           child: Container(
//                                             height: Dimensions.height30,
//                                             width: double.maxFinite,
//                                             child: Text(
//                                               "You_Should_put_a_Quantity".tr,
//                                               style: TextStyle(
//                                                   color: Colors.red
//                                               ),
//                                             ),
//                                           ),
//                                         ) : Container(),
//                                         SizedBox(height: Dimensions.height20,),
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               newQuantity = int.parse(_newNumber.text);
//                                               cartController.customAddItem(product, newQuantity >= product.max_quantity! ? product.max_quantity! : newQuantity);
//                                               // Get.back();
//                                               Navigator.pop(context);
//                                               if(cartController.getQuantity(product) == product.max_quantity) {ShowDialog();}
//                                             });
//                                           },
//                                           style: ElevatedButton.styleFrom(
//                                             fixedSize: Size(
//                                                 Dimensions.width30 * 7,
//                                                 Dimensions.height45
//                                             ),
//                                             primary: Colors.blue,
//                                           ),
//                                           child: CustomBigText(
//                                             text: "put_quantity_to_cart".tr,
//                                             color: Colors.white,
//                                             size: Dimensions.font16,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//
//                                 // The Image
//                                 Container(
//                                   width: Dimensions.width30 * 6,
//                                   height: Dimensions.height45 * 5.5,
//                                   // color: Colors.yellow,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(Dimensions.radius20),
//                                     child: CachedNetworkImage(
//                                       imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + renotexTexapon.renotexTexaponList[widget.pageId].img!,
//                                       height: Dimensions.listViewImgSize / 1.3,
//                                       width: Dimensions.listViewImgSize,
//                                       fit: BoxFit.fitHeight,
//                                       placeholder: (context, url) => Container(color: Colors.black12,),
//                                       errorWidget: (context, url, error) => Container(
//                                         color: Colors.black12,
//                                         child: const Icon(Icons.error, color: Colors.red),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 isScrollControlled: true,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.vertical(
//                     top: Radius.circular(Dimensions.radius20),
//                   ),
//                 ),
//               );
//             }
//
//             return Scaffold(
//               backgroundColor: Colors.white,
//               // backgroundColor: Color(0xff293f6e),
//               body: CustomScrollView(
//                 slivers: [
//                   SliverAppBar(
//                     title: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         GestureDetector(
//                           onTap: (){
//                             Get.toNamed(RouteHelper.getInitial());
//                           },
//                           child: CircleAvatar(
//                             radius: Dimensions.radius15,
//                             backgroundColor: Colors.transparent,
//                             child: const Icon(Icons.arrow_back, color: Colors.blue,),
//                           ),
//                         ),
//                       ],
//                     ),
//                     bottom: PreferredSize(
//                       preferredSize: Size.fromHeight(Dimensions.height15 * 7),
//                       child: FadeAnimation(
//                         intervalStart: 0.04,
//                         duration: const Duration(milliseconds: 1250),
//                         child: SlideAnimation(
//                           begin: Offset(0, Dimensions.height20 * 14),
//                           intervalStart: 0.4,
//                           duration: const Duration(milliseconds: 1250),
//                           child: Container(
//                             height: Dimensions.height20 * 6,
//                             alignment: Alignment.centerRight,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(top: Dimensions.height10),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//
//                                       //The Name
//                                       CustomBigText(
//                                         text: product.name!.tr,
//                                         // text: products.name.tr,
//                                         size: Dimensions.font26,
//                                         color: Colors.black,
//                                       ),
//
//                                       SizedBox(width: Dimensions.width15,),
//
//                                       //The Price
//                                       Row(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             cartController.totalItemAmount(product, 0) == 0 ?
//                                             product.price.toString() :
//                                             cartController.totalItemAmount(product, 0).toString(),
//                                             // products.price,
//                                             style: TextStyle(
//                                               fontSize: Dimensions.font26,
//                                               color: Colors.blue,
//                                               fontWeight: FontWeight.w800,
//                                             ),
//                                           ),
//                                           SizedBox(width: Dimensions.width10,),
//                                           Padding(
//                                             padding: EdgeInsets.only(top: Dimensions.height10 / 2),
//                                             child: CustomBigText(
//                                               //text: product.name!,
//                                               text: "Pound".tr,
//                                               fontWeight: FontWeight.w800,
//                                               overflow: TextOverflow.ellipsis,
//                                               size: Dimensions.font26,
//                                               color: Colors.blue,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(width: Dimensions.width15,),
//                                 Container(
//                                   // color: Colors.red,
//                                   height: Dimensions.height45 * 1.4,
//                                   child: ListView.separated(
//                                     scrollDirection: Axis.horizontal,
//                                     physics: const NeverScrollableScrollPhysics(),
//                                     itemCount: 2,
//                                     separatorBuilder: (BuildContext context, int index) {return SizedBox(width: Dimensions.width10 / 2);},
//                                     itemBuilder: (context, index){
//                                       return GestureDetector(
//                                         onTap: () {
//                                           setState(() {
//                                             _selectedIndex = index;
//                                           });
//                                         },
//                                         child: _selectedIndex == index ?
//                                         SelectedCategoryItem(
//                                           name: name[index].tr,
//                                           backgroundColor: Colors.white,
//                                         ) :
//                                         UnSelectedCategoryItem(
//                                           name: name[index].tr,
//                                           backgroundColor: Colors.white,
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 // TabBar(
//                                 //   controller: _tabController,
//                                 //   labelColor: Colors.black,
//                                 //   unselectedLabelColor: Colors.grey,
//                                 //   tabs: const [
//                                 //     Tab(text: "التفاصيل"),
//                                 //     Tab(text: "التعليقات",),
//                                 //   ]
//                                 // ),
//                               ],
//                             ),
//                             width: double.maxFinite,
//                             padding: EdgeInsets.only(top: Dimensions.height10 / 10, bottom: Dimensions.height10 / 2, right: Dimensions.width15, left: Dimensions.width15),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               // color: Color(0xff293f6e),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(Dimensions.radius20),
//                                 topRight: Radius.circular(Dimensions.radius20),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     automaticallyImplyLeading: false,
//                     toolbarHeight: Dimensions.height30,
//                     pinned: true,
//                     backgroundColor: Colors.white,
//                     // backgroundColor: Color(0xff293f6e),
//                     expandedHeight: Dimensions.height45 * 12,
//                     flexibleSpace: FlexibleSpaceBar(
//                       background: Hero(
//                         tag: "tag",
//                         child: Stack(
//                           children: [
//
//                             // yellow back shape
//                             Positioned(
//                               top: 0,
//                               bottom: Dimensions.height45 * 4,
//                               left: localizationController.selectedIndex == 1 ? 0 : Dimensions.width30 * Dimensions.width5,
//                               right: localizationController.selectedIndex == 1 ? Dimensions.width30 * Dimensions.width5 : 0,
//                               child: Container(
//                                 alignment: Alignment.topLeft,
//                                 height: double.infinity,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   // gradient: LinearGradient(
//                                   //   colors: [
//                                   //     Color(0xFFf7c72a),
//                                   //     Color(0xccc239),
//                                   //   ],
//                                   // ),
//                                   color: Colors.yellow,
//                                   // color: Color(0xFFf7c72a),
//                                   // color: Color(0xff293f6e),
//                                   borderRadius: localizationController.selectedIndex == 1 ?
//                                   BorderRadius.only(bottomRight: Radius.circular(Dimensions.radius30 * 1.5),) :
//                                   BorderRadius.only(bottomLeft: Radius.circular(Dimensions.radius30 * 1.5),),
//                                 ),
//                               ),
//                             ),
//
//
//                             // The Image
//                             Positioned.fill(
//                               top: -Dimensions.height45,
//                               bottom: Dimensions.height10 / 2,
//                               left: localizationController.selectedIndex == 0 ? Dimensions.width30 * 6 : Dimensions.width5 / 5,
//                               right: localizationController.selectedIndex == 0 ? Dimensions.width5 / 5 : Dimensions.width30 * 6,
//                               child: ScaleAnimation(
//                                 begin: 0,
//                                 duration: const Duration(milliseconds: 1000),
//                                 intervalStart: 0.2,
//                                 curve: Curves.easeOutBack,
//                                 child: Align(
//                                   alignment: Alignment.centerLeft,
//                                   child: Badge(
//                                     badgeContent: Text(
//                                       renotexTexapon.inCartItems.toString(),
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: Dimensions.font20
//                                       ),
//                                     ),
//                                     padding: EdgeInsets.all(Dimensions.height10),
//                                     badgeColor: Colors.blue,
//                                     showBadge: renotexTexapon.inCartItems.toString() == "0" ? false : true,
//                                     position: BadgePosition.topEnd(
//                                       top: Dimensions.height10,
//                                       end: Dimensions.height10,
//                                     ),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(Dimensions.radius20),
//                                       child: Container(
//                                         width: Dimensions.width30 * 9,
//                                         height: Dimensions.height45 * 8,
//                                         // color: Colors.red,
//                                         child: CachedNetworkImage(
//                                           imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + renotexTexapon.renotexTexaponList[widget.pageId].img!,
//                                           // height: Dimensions.listViewImgSize,
//                                           // width:Dimensions.listViewImgSize,
//                                           fit: BoxFit.fitHeight,
//                                           placeholder: (context, url) => Container(color: Colors.black12,),
//                                           errorWidget: (context, url, error) => Container(
//                                             color: Colors.black12,
//                                             child: const Icon(Icons.error, color: Colors.red),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   // child: products.img,
//                                 ),
//                               ),
//                             ),
//
//                             //Food Info
//                             Positioned.fill(
//                               // top: -Dimensions.height10 * Dimensions.height15,
//                               top: Dimensions.height30 * 3,
//                               bottom: Dimensions.height30 * 5,
//                               right: localizationController.selectedIndex == 0 ? Dimensions.width30 * 5 : Dimensions.width20 / 2,
//                               left: localizationController.selectedIndex == 0 ? Dimensions.width20 / 2 : Dimensions.width30 * 6,
//                               child: FadeAnimation(
//                                 duration: const Duration(milliseconds: 1250),
//                                 child: ScaleAnimation(
//                                   intervalStart: 0.10,
//                                   duration: const Duration(milliseconds: 1250),
//                                   child: Stack(
//                                     children: [
//                                       Container(
//                                         // color: Colors.red,
//                                         child: Column(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children:  [
//                                             ProductInfoText(
//                                               text: "Tare_Weight".tr,
//                                               // value: products.emptyValue + "KG".tr,
//                                               value: product.tare_weight.toString().tr + "KG".tr,
//                                             ),
//                                             ProductInfoText(
//                                               text: "Net_Weight".tr,
//                                               // value: products.netValue + "KG".tr,
//                                               value: product.net_weight.toString().tr + "KG".tr,
//                                             ),
//                                             ProductInfoText(
//                                               text: "Gross_Weight".tr,
//                                               // value: products.fullValue + "KG".tr,
//                                               value: product.gross_weight.toString().tr + "KG".tr,
//                                             ),
//                                             ProductInfoText(
//                                               text: "Origin".tr,
//                                               // value: products.origin.tr,
//                                               value: product.origin.toString().tr,
//                                             ),
//                                             ProductInfoText(
//                                               text: "Company".tr,
//                                               // value: products.company.tr,
//                                               value: product.company.toString().tr,
//                                             ),
//                                             ProductInfoText(
//                                               text: "Concentration".tr,
//                                               // value: products.concentration,
//                                               value: product.concentration.toString().tr,
//                                             ),
//                                             ProductInfoText(
//                                               text: "Type".tr,
//                                               // value: products.type.tr,
//                                               value: product.type.toString().tr,
//                                             ),
//                                             ProductInfoText(
//                                               text: "Expiration".tr,
//                                               // value: products.exp.tr,
//                                               value: product.expiration.toString().tr,
//                                             ),
//                                             ProductInfoText(
//                                               text: "Production_Date".tr,
//                                               // value: products.pro,
//                                               value: product.production_date.toString().tr,
//                                             ),
//                                             ProductInfoText(
//                                               text: "Price".tr,
//
//                                               value: renotexTexapon.inCartItems <= product.quantity2! ?
//                                               product.price.toString() + " " + "Pound".tr : renotexTexapon.inCartItems >= product.quantity2! && renotexTexapon.inCartItems <= product.quantity3! ?
//                                               product.price2.toString() + " " + "Pound".tr : renotexTexapon.inCartItems >= product.quantity3! && renotexTexapon.inCartItems <= product.quantity4! ?
//                                               product.price3.toString() + " " + "Pound".tr : product.price4.toString() + " " + "Pound".tr,
//
//                                               color: renotexTexapon.inCartItems <= product.quantity2! ? Colors.blue : Colors.red,
//                                               fontWeight: FontWeight.w900,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SliverToBoxAdapter(
//                     child: FadeAnimation(
//                       intervalStart: 0.04,
//                       duration: const Duration(milliseconds: 1250),
//                       child: SlideAnimation(
//                         begin: Offset(0, Dimensions.height20 * 11),
//                         intervalStart: 0.6,
//                         duration: const Duration(milliseconds: 1250),
//                         child:  _selectedIndex == 0 ?
//                         Container(
//                           padding: EdgeInsets.all(Dimensions.height10 / 1.5),
//                           child: SingleChildScrollView(
//                             physics: BouncingScrollPhysics(),
//                             child: ExpandableText(
//                               text: product.description!,
//                               // text: "asfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsd",),
//                               // text: products.description,
//                             ),
//                           ),
//                         ) :
//                         // Center(
//                         //   // height: MediaQuery.of(context).size.height,
//                         //   child: Text("Hi Again"),
//                         // ),
//                         SingleChildScrollView(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: RefreshIndicator(
//                               onRefresh: () async {
//                                 await _postController.getAllPosts();
//                               },
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   PostFIeld(
//                                     hintText: 'What do you want to ask?',
//                                     controller: _textController,
//                                   ),
//                                   // const SizedBox(
//                                   //   height: ,
//                                   // ),
//                                   ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       // backgroundColor: Colors.black,
//                                       elevation: 0,
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 50,
//                                         vertical: 10,
//                                       ),
//                                     ),
//                                     onPressed: () async {
//                                       await _postController.createPost(
//                                         content: _textController.text.trim(),
//                                       );
//                                       _textController.clear();
//                                       _postController.getAllPosts();
//                                     },
//                                     child: Obx(() {
//                                       return _postController.isLoading.value
//                                           ? const CircularProgressIndicator()
//                                           : Text('Post');
//                                     }),
//                                   ),
//                                   const SizedBox(
//                                     height: 30,
//                                   ),
//                                   Text('Posts'),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   Obx(() {
//                                     return _postController.isLoading.value ?
//                                     const Center(
//                                       child: CircularProgressIndicator(),
//                                     ) :
//                                     ListView.builder(
//                                       shrinkWrap: true,
//                                       physics: const NeverScrollableScrollPhysics(),
//                                       itemCount: _postController.posts.value.length,
//                                       itemBuilder: (context, index) {
//                                         return Padding(
//                                           padding:
//                                           const EdgeInsets.symmetric(vertical: 8.0),
//                                           child: PostData(
//                                             post: _postController.posts.value[index],
//                                           ),
//                                         );
//                                       },
//                                     );
//                                   }),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       // Container(
//                       //                     child: const SingleChildScrollView(
//                       //                       physics: BouncingScrollPhysics(),
//                       //                       child: ExpandableText(
//                       //                         // text: product.description! +
//                       //                         // text: "asfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsd",),
//                       //                     text: "تحضيرهيتولد حمض السلفونيك بعملية السلفنة. عامل السلفنة عادة هو ثلاثي أكسيد الكبريت. التطبيق الخاص الواسع الطيف لهذه الطريقة هو إنتاج حموض ألكيل البنزين المسلفنة.RC6H5 + SO3 → RC6H4SO3Hفي هذ التفاعل، ثلاثي أكسيد الكبريت هو شغوف بالإلكترون ويخضع الأرين إلى عملية استبدال عطري شغوف بالإلكترونات.يمكن أكسدة الثيولات لتتحول إلى حموض سلفونيك:RSH + 3/2 O2 → RSO3Hالتطبيقاتمع أن الحموض السلفونية الألكيلية والأريلية معروفة، إلا أن معظم التطبيقات مرتبطة بالمشتقات العطرية.المنظفات والفاعلات بالسطحالمنظفات والمواد الفاعلة بالسطح هي جزيئات تتضمن مجموعات عالية القطبية وأخرى لاقطبية. الصابون هو فاعل بالسطح معروف مشتق من الحموض الدسمة. منذ منتصف القرن العشرين، تفوق استخدام حموض السلفونيك على الصابون في المجتمعات المتطورة. فمثلا، ينتج مليوني كيلوغرام من سلفونات ألكيل البنزين سنويًا لأغراض متعددة. سلفونات الليغنين هي مكونات في سوائل الثقب ومواد مضافة لبعض أنواع الخرسانة.الأصبغةالعديد إن لم يكن معظم أصبغة الأنثراكينون تنتج أو تعالج بالسلفنة  تميل حموض السلفونيك للارتباط الوثيق مع البروتينات والكربوهيدرات. معظم الأصبغة القابلة للغسل هي حموض سلفونيك (أو تمتلك مجموعة سولفونيل) لهذا السبب. الأصبغة المباشرة في أغلبها تتضمن مجموعات السلفونيل، وهي تساعد على انحلالية الصباغ في حوض الصباغة لتسهيل انتقاله إلى الألياف النسيجية كالقطن.الأدويةأدوية سلفوناميد المضادة للبكتريا منتجة من حموض السلفونيك.",)
//                       //   ),
//                       //   width: double.maxFinite,
//                       //   // height: MediaQuery.of(context).size.height,
//                       //   // child: TabBarView(
//                       //   //   controller: _tabController,
//                       //   //   children: [
//                       //   //     ExpandableText(
//                       //   //         // text: product.description! +
//                       //   //       text: products.description,
//                       //   //     ),
//                       //   //     const Center(
//                       //   //       // height: MediaQuery.of(context).size.height,
//                       //   //       child: Text("Hi Again"),
//                       //   //     ),
//                       //   //   ],
//                       //   // ),
//                       //   margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,),
//                       // ),
//                     ),
//
//                   ),
//                 ],
//               ),
//               bottomNavigationBar: Padding(
//                 padding: EdgeInsets.only(right: Dimensions.width15, left: Dimensions.width15, bottom: Dimensions.height20),
//                 child: cartController.existInCart(product) && renotexTexapon.checkQuantity(-1) == 0 || renotexTexapon.inCartItems.toString() == "0" ?
//                 ElevatedButton(
//                   onPressed: () {
//                     renotexTexapon.increase(product);
//                     renotexTexapon.addItem(product);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: Size(
//                       double.maxFinite,
//                       Dimensions.height45 * 1.5,
//                     ),
//                     primary: Colors.blue,
//                   ),
//                   child: CustomBigText(
//                     text: "Add_To_Cart".tr,
//                     color: Colors.white,
//                     size: Dimensions.font26,
//                   ),
//                 )
//                     :
//                 //Remove And Add Container
//                 Container(
//                   width: double.maxFinite,
//                   height: Dimensions.height45 * 1.5,
//                   decoration: BoxDecoration(
//                     // color: Colors.red,
//                     borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
//                   ),
//                   child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       //Add Icon
//                       InkWell(
//                         onTap: (){
//                           renotexTexapon.increase(product);
//                           renotexTexapon.addItem(product);
//                           if(cartController.getQuantity(product) == 10) {     modelSheet();     }
//                           if(cartController.getQuantity(product) == product.max_quantity) {     ShowDialog();     }
//                         },
//                         child: Container(
//                           width: Dimensions.width30 * 2,
//                           height: double.infinity,
//                           decoration: BoxDecoration(
//                             color: cartController.getQuantity(product) == product.max_quantity ? Colors.grey : Colors.blue,
//                             borderRadius: BorderRadius.circular(Dimensions.radius15 / 3),
//                           ),
//                           child: const Icon(
//                             Icons.add,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//
//                       //inCartItems
//                       InkWell(
//                         onTap: () => modelSheet(),
//                         child: Container(
//                           height: double.maxFinite,
//                           width: Dimensions.width30 * 7.5,
//                           // color: Colors.red,
//                           alignment: Alignment.center,
//                           child: CustomBigText(
//                             text: renotexTexapon.inCartItems.toString(),
//                           ),
//                         ),
//                       ),
//
//                       //Remove Icon
//                       InkWell(
//                         onTap: (){
//                           renotexTexapon.decrease(product);
//                           renotexTexapon.addItem(product);
//                         },
//                         child: Container(
//                           width: Dimensions.width30 * 2,
//                           height: double.infinity,
//                           decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(Dimensions.radius15 / 3),
//                           ),
//                           child: const Icon(
//                             Icons.remove,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//           );});});
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