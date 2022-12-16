import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/pages/home/product_info_text.dart';
import 'package:theblue_crown/routes/route_helper.dart';
import 'package:theblue_crown/utils/dimensions.dart';
import 'package:theblue_crown/widgets/custom_big_text.dart';
import 'package:theblue_crown/widgets/expandable_text.dart';
import '../../../animations/fade_animation.dart';
import '../../../animations/scale_animation.dart';
import '../../../animations/slide_animation.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/cart_controller.dart';
import '../../../controllers/controller_lists/product_grids/el_momtaz_labsa_controller.dart';
import '../../../controllers/controller_lists/product_grids/galaxy_texapon_controller.dart';
import '../../../controllers/controller_lists/product_grids/malaysia_texapon_controller.dart';
import '../../../controllers/controller_lists/product_grids/popular_product_controller.dart';
import '../../../controllers/controller_lists/product_grids/recommended_product_controller.dart';
import '../../../controllers/controller_lists/product_grids/renotex_texapon_controller.dart';
import '../../../controllers/controller_lists/product_grids/super_el_momtaz_labsa_controller.dart';
import '../../../controllers/language_controller.dart';
import '../../../controllers/post_controller.dart';
import '../../../controllers/replies_controller.dart';
import '../../../models/place_like_model.dart';
import '../../../models/place_post_model.dart';
import '../../../models/place_product_like_model.dart';
import '../../../models/products_model.dart';
import '../../../utils/app_constants.dart';
import '../../../widgets/custom_small_text.dart';
import '../../../widgets/input_widget.dart';
import '../reply_page.dart';

class DetailsScreen extends StatefulWidget {

  final int pageId ;
  ProductModel product;
  var subController;
  var subControllersList;
  var image;
  var productId;

  DetailsScreen({
    Key? key,
    required this.pageId,
    required this.product,
    required this.subController,
    required this.subControllersList,
    required this.image,
    required this.productId,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> with TickerProviderStateMixin{

  final TextEditingController _newNumber = TextEditingController();
  int newQuantity = 0;
  late bool _isLoggedIn;
  int _selectedIndex = 0;

  List<String> name = [  'Details', 'Comment',  ];

  List<IconData> selectedIcon = [
    Icons.bookmark,
    Icons.mode_comment_rounded,
  ];

  List<IconData> UnSelectedIcon = [
    Icons.bookmark_border,
    Icons.mode_comment_outlined,
  ];

  @override
  void initState(){
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_isLoggedIn){
      Get.find<PostController>().getAllPosts(widget.productId);
      Get.find<RepliesController>().getReplies(44, widget.productId);
      // print("length of comments ::::::: " + widget.postList.toString());
      // print("length of replies ::::::: " + widget.repliesList.toString());
    }
    // print("widget.subController.inCartItems.toString() ::::::: " + widget.subController.inCartItems.toString());
  }

  @override
  Widget build(BuildContext context) {

    TabController _tabController = TabController(length: 2, vsync: this);
    final TextEditingController _noteController = TextEditingController();

    return GetBuilder<CartController>(builder: (cartController) {
      return GetBuilder<LocalizationController>(builder: (localizationController) {
        return GetBuilder<PostController>(builder: (postController) {
          return GetBuilder<RepliesController>(builder: (repliesController){
            return GetBuilder<ElMomtazLabsaController>(builder: (elMomtazLabsa) {
              return GetBuilder<SuperElMomtazLabsaController>(builder: (superElMomtazLabsa) {
                return GetBuilder<GalaxyTexaponController>(builder: (galaxyTexapon) {
                  return GetBuilder<RenotexTexaponController>(builder: (renotexTexapon) {
                    return GetBuilder<MalaysiaTexaponController>(builder: (malaysiaTexapon) {
                      return GetBuilder<PopularProductController>(builder: (popularProduct) {
                        return GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {

                          Get.find<ElMomtazLabsaController>().initProduct(widget.product, Get.find<CartController>());
                          Get.find<SuperElMomtazLabsaController>().initProduct(widget.product, Get.find<CartController>());
                          Get.find<GalaxyTexaponController>().initProduct(widget.product, Get.find<CartController>());
                          Get.find<RenotexTexaponController>().initProduct(widget.product, Get.find<CartController>());
                          Get.find<MalaysiaTexaponController>().initProduct(widget.product, Get.find<CartController>());
                          Get.find<PopularProductController>().initProduct(widget.product, Get.find<CartController>());
                          Get.find<RecommendedProductController>().initProduct(widget.product, Get.find<CartController>());

                          void showMeDialog () {
                            showDialog(
                                context: Get.overlayContext!,
                                builder: (_) =>
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: Dimensions.screenHeight - Dimensions.height45 * 6),
                                        // Aligns the container to center
                                        child: Center(
                                          child: Container( // A simplified version of dialog.
                                            width: localizationController.selectedIndex == 0 ? Dimensions.width30 * 9 : Dimensions.width30 * 6,
                                            height: Dimensions.height45,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius20 * 2),
                                              color: Colors.white,
                                            ),
                                            alignment: Alignment.bottomCenter,
                                            child: Scaffold(
                                              backgroundColor: Colors.transparent,
                                              body: Center(
                                                child: Text(
                                                  "Maximum_Quantity_Added".tr,
                                                  style: TextStyle(
                                                    fontSize: Dimensions.font16,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                    )
                            );
                          }
                          void modelSheet() {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: Dimensions.height45 * 12,
                                  // color: Colors.transparent,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(Dimensions.radius20),
                                      topRight: Radius.circular(Dimensions.radius20),
                                    ),
                                    child: WillPopScope(
                                      onWillPop: () async {
                                        setState(() {
                                          newQuantity = int.parse(_newNumber.text);
                                          cartController.customAddItem(widget.product, newQuantity >= widget.product.max_quantity! ? widget.product.max_quantity! : newQuantity);
                                        });
                                        return true;
                                      },
                                      child: Scaffold(
                                        body: Padding(
                                          padding: EdgeInsets.only(
                                            top: Dimensions.height30,
                                            right: Dimensions.width10,
                                            left: Dimensions.width10,
                                          ),
                                          child: Row(
                                            children: [
                                              // putting a custom quantity
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: Dimensions.height45,
                                                ),
                                                child: Container(
                                                  // color: Colors.green,
                                                  width: Dimensions.width30 * 7.5,
                                                  height: Dimensions.height45 * 5,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: Dimensions.height45,
                                                        width: double.maxFinite,
                                                        child: Text(
                                                          "put_required_quantity_here".tr,
                                                          style: TextStyle(
                                                              fontSize: Dimensions.font16,
                                                              color: Colors.blue
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                          height: Dimensions.height45 / 1.5,
                                                          width: Dimensions.width30 * 7,
                                                          // color: Colors.red,
                                                          child: TextFormField(
                                                            controller: _newNumber,
                                                            keyboardType: TextInputType.number,
                                                            autofocus: true,
                                                            inputFormatters: <TextInputFormatter>[
                                                              // for below version 2 use this
                                                              FilteringTextInputFormatter.allow(    RegExp(r'[0-9]')    ),
                                                              // for version 2 and greater you can also use this
                                                              FilteringTextInputFormatter.digitsOnly
                                                            ],
                                                            decoration: InputDecoration(
                                                              hintText: "type_number".tr,
                                                              // icon: Icon(Icons.phone_iphone)
                                                            ),
                                                          )
                                                      ),
                                                      _newNumber.text.isEmpty ?
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            right: Dimensions.width5,
                                                            left: Dimensions.width5),
                                                        child: Container(
                                                          height: Dimensions.height30,
                                                          width: double.maxFinite,
                                                          child: Text(
                                                            "You_Should_put_a_Quantity".tr,
                                                            style: const TextStyle(
                                                                color: Colors.red
                                                            ),
                                                          ),
                                                        ),
                                                      ) : Container(),
                                                      SizedBox(height: Dimensions.height20,),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            newQuantity = int.parse(_newNumber.text);
                                                            cartController.customAddItem(widget.product, newQuantity >= widget.product.max_quantity! ? widget.product.max_quantity! : newQuantity);
                                                            // Get.back();
                                                            Navigator.pop(context);
                                                            if (cartController.getQuantity(widget.product) == widget.product.max_quantity) {showMeDialog();}
                                                          });
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          fixedSize: Size(
                                                              Dimensions.width30 * 7,
                                                              Dimensions.height45
                                                          ),
                                                          primary: Colors.blue,
                                                        ),
                                                        child: CustomBigText(
                                                          text: "put_quantity_to_cart".tr,
                                                          color: Colors.white,
                                                          size: Dimensions.font16,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              // The Image
                                              Container(
                                                width: Dimensions.width30 * 6,
                                                height: Dimensions.height45 * 5.5,
                                                // color: Colors.yellow,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(
                                                      Dimensions.radius20),
                                                  child: CachedNetworkImage(
                                                    imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + widget.image,
                                                    height: Dimensions.listViewImgSize / 1.3,
                                                    width: Dimensions.listViewImgSize,
                                                    fit: BoxFit.fitHeight,
                                                    placeholder: (context, url) => Container(color: Colors.black12,),
                                                    errorWidget: (context, url, error) =>
                                                        Container(
                                                          color: Colors.black12,
                                                          child: const Icon(
                                                              Icons.error, color: Colors.red),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(Dimensions.radius20),
                                ),
                              ),
                            );
                          }

                          /*var getCartHistoryList = Get.find<CartController>().getCartHistoryList().reversed.toList();
                          print("getCartHistoryList ?????????????????????????????????          " + getCartHistoryList.length.toString());*/

                          var getPostLength = Get.find<PostController>().getPostLength(widget.productId).toList();
                          print("getPostLength ????????????????????????????????       " + getPostLength.length.toString());
                          print("currentPostList  ????????????????????????????????       " + postController.currentPostList.toList().length.toString());
                          print("currentReplyList  ????????????????????????????????       " + repliesController.currentRepliesList.toList().length.toString());
                          print("currentAllCommentsList  ????????????????????????????????       " + (postController.currentPostList.toList().length + repliesController.currentRepliesList.toList().length).toString());
                          print("foodId  ????????????????????????????????       " + widget.productId.toString());
                          // print("feedId  ????????????????????????????????       " + postController.currentPostList[0].id.toString());

                          return Scaffold(
                            backgroundColor: Colors.white,
                            // backgroundColor: Color(0xff293f6e),
                            body: CustomScrollView(
                              slivers: [

                                // The First Half of The Page
                                SliverAppBar(
                                  toolbarHeight: Dimensions.height30,
                                  backgroundColor: Colors.white,
                                  // backgroundColor: Color(0xff293f6e),
                                  expandedHeight: Dimensions.height45 * 12,
                                  pinned: true,
                                  automaticallyImplyLeading: false,

                                  // The Top Part of First Half of The Page
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(RouteHelper.getInitial());
                                        },
                                        child: CircleAvatar(
                                          radius: Dimensions.radius15,
                                          backgroundColor: Colors.transparent,
                                          child: const Icon(Icons.arrow_back, color: Colors.blue,),
                                        ),
                                      ),
                                    ],
                                  ),

                                  // The Medal Part of First Half of The Page
                                  // yellow back shape, Image and Food Info
                                  flexibleSpace: FlexibleSpaceBar(
                                    background: Stack(
                                      children: [

                                        // yellow back shape
                                        Positioned(
                                          top: 0,
                                          bottom: Dimensions.height45 * 4,
                                          left: localizationController.selectedIndex == 1 ? 0 : Dimensions.width30 * Dimensions.width5,
                                          right: localizationController.selectedIndex == 1 ? Dimensions.width30 * Dimensions.width5 : 0,
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            height: double.infinity,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              // gradient: LinearGradient(
                                              //   colors: [
                                              //     Color(0xFFf7c72a),
                                              //     Color(0xccc239),
                                              //   ],
                                              // ),
                                              color: Colors.yellow,
                                              // color: Color(0xFFf7c72a),
                                              // color: Color(0xff293f6e),
                                              borderRadius: localizationController.selectedIndex == 1 ?
                                              BorderRadius.only(bottomRight: Radius.circular(Dimensions.radius30 * 1.5),) :
                                              BorderRadius.only(bottomLeft: Radius.circular(Dimensions.radius30 * 1.5),),
                                            ),
                                          ),
                                        ),


                                        // The Image
                                        Positioned.fill(
                                          top: -Dimensions.height45,
                                          bottom: Dimensions.height10 / 2,
                                          left: localizationController.selectedIndex == 0 ? Dimensions.width30 * 6 : Dimensions.width5 / 5,
                                          right: localizationController.selectedIndex == 0 ? Dimensions.width5 / 5 : Dimensions.width30 * 6,
                                          child: ScaleAnimation(
                                            begin: 0,
                                            duration: const Duration(milliseconds: 1000),
                                            intervalStart: 0.2,
                                            curve: Curves.easeOutBack,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Badge(
                                                badgeContent: Text(
                                                  elMomtazLabsa.inCartItems.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: Dimensions.font20
                                                  ),
                                                ),
                                                padding: EdgeInsets.all(Dimensions.height10),
                                                badgeColor: Colors.blue,
                                                showBadge: elMomtazLabsa.inCartItems.toString() == "0" ? false : true,
                                                position: BadgePosition.topEnd(
                                                  top: Dimensions.height10,
                                                  end: Dimensions.height10,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                  child: Container(
                                                    width: Dimensions.width30 * 9,
                                                    height: Dimensions.height45 * 8,
                                                    // color: Colors.red,
                                                    // child: Padding(
                                                    // padding: const EdgeInsets.only(top: 20, right: 20),
                                                    child: CachedNetworkImage(
                                                      imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + widget.image,
                                                      // height: Dimensions.listViewImgSize,
                                                      // width:Dimensions.listViewImgSize,
                                                      fit: BoxFit.fitHeight,
                                                      placeholder: (context, url) => Container(color: Colors.black12,),
                                                      errorWidget: (context, url, error) =>
                                                          Container(
                                                            color: Colors.black12,
                                                            child: const Icon(
                                                                Icons.error, color: Colors.red),
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // child: products.img,
                                          ),
                                        ),
                                        // ),

                                        //Food Info
                                        Positioned.fill(
                                          // top: -Dimensions.height10 * Dimensions.height15,
                                          top: Dimensions.height30 * 3,
                                          bottom: Dimensions.height30 * 5,
                                          right: localizationController.selectedIndex == 0 ? Dimensions.width30 * 5 : Dimensions.width20 / 2,
                                          left: localizationController.selectedIndex == 0 ? Dimensions.width20 / 2 : Dimensions.width30 * 6,
                                          child: FadeAnimation(
                                            duration: const Duration(milliseconds: 1250),
                                            child: ScaleAnimation(
                                              intervalStart: 0.10,
                                              duration: const Duration(milliseconds: 1250),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    // color: Colors.red,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        ProductInfoText(
                                                          text: "Tare_Weight".tr,
                                                          // value: products.emptyValue + "KG".tr,
                                                          value: widget.product.tare_weight.toString().tr + "KG".tr,
                                                        ),
                                                        ProductInfoText(
                                                          text: "Net_Weight".tr,
                                                          // value: products.netValue + "KG".tr,
                                                          value: widget.product.net_weight.toString().tr + "KG".tr,
                                                        ),
                                                        ProductInfoText(
                                                          text: "Gross_Weight".tr,
                                                          // value: products.fullValue + "KG".tr,
                                                          value: widget.product.gross_weight.toString().tr + "KG".tr,
                                                        ),
                                                        ProductInfoText(
                                                          text: "Origin".tr,
                                                          // value: products.origin.tr,
                                                          value: widget.product.origin.toString().tr,
                                                        ),
                                                        ProductInfoText(
                                                          text: "Company".tr,
                                                          // value: products.company.tr,
                                                          value: widget.product.company.toString().tr,
                                                        ),
                                                        ProductInfoText(
                                                          text: "Concentration".tr,
                                                          // value: products.concentration,
                                                          value: widget.product.concentration.toString().tr,
                                                        ),
                                                        ProductInfoText(
                                                          text: "Type".tr,
                                                          // value: products.type.tr,
                                                          value: widget.product.type.toString().tr,
                                                        ),
                                                        ProductInfoText(
                                                          text: "Expiration".tr,
                                                          // value: products.exp.tr,
                                                          value: widget.product.expiration.toString().tr,
                                                        ),
                                                        ProductInfoText(
                                                          text: "Production_Date".tr,
                                                          // value: products.pro,
                                                          value: widget.product.production_date.toString().tr,
                                                        ),
                                                        ProductInfoText(
                                                          text: "Price".tr,

                                                          value:
                                                          elMomtazLabsa.inCartItems <= widget.product.quantity2! ?
                                                          widget.product.price.toString() + " " + "Pound".tr : elMomtazLabsa.inCartItems >= widget.product.quantity2! && elMomtazLabsa.inCartItems <= widget.product.quantity3! ?
                                                          widget.product.price2.toString() + " " + "Pound".tr : elMomtazLabsa.inCartItems >= widget.product.quantity3! && elMomtazLabsa.inCartItems <= widget.product.quantity4! ?
                                                          widget.product.price3.toString() + " " + "Pound".tr : widget.product.price4.toString() + " " + "Pound".tr,

                                                          color: elMomtazLabsa.inCartItems <= widget.product.quantity2! ? Colors.blue : Colors.red,
                                                          fontWeight: FontWeight.w900,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // The bottom Part of First Half of The Page
                                  // Name, Price, Like, Details and Comments
                                  bottom: PreferredSize(
                                    preferredSize: Size.fromHeight(Dimensions.height15 * 7),
                                    child: FadeAnimation(
                                      intervalStart: 0.04,
                                      duration: const Duration(milliseconds: 1250),
                                      child: SlideAnimation(
                                        begin: Offset(0, Dimensions.height20 * 14),
                                        intervalStart: 0.4,
                                        duration: const Duration(milliseconds: 1250),
                                        child: Container(
                                          height: Dimensions.height20 * 6,
                                          width: double.maxFinite,
                                          alignment: Alignment.centerRight,
                                          padding: EdgeInsets.only(top: Dimensions.height10 / 10,
                                              bottom: Dimensions.height10 / 2,
                                              right: Dimensions.width5,
                                              left: Dimensions.width5),
                                          decoration: BoxDecoration(
                                            // color: Colors.red,
                                            color: Colors.white,
                                            // color: Color(0xff293f6e),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(Dimensions.radius20),
                                              topRight: Radius.circular(Dimensions.radius20),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              // Name and Price
                                              Container(
                                                // color: Colors.green,
                                                color: Colors.white,
                                                padding: EdgeInsets.only(
                                                    top: Dimensions.height10,
                                                    right: Dimensions.width15,
                                                    left: Dimensions.width15
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    //The Name
                                                    CustomBigText(
                                                      text: widget.product.name.toString().tr,
                                                      // text: products.name.tr,
                                                      size: Dimensions.font26,
                                                      color: Colors.black,
                                                    ),

                                                    SizedBox(width: Dimensions.width15,),

                                                    // The length of Comments
                                                    Padding(
                                                      padding: EdgeInsets.only(top: Dimensions.height10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            (postController.currentPostList.toList().length + repliesController.currentRepliesList.toList().length).toString(),
                                                            style: TextStyle(
                                                              color: Colors.grey[700],
                                                              fontSize: Dimensions.font16,
                                                            ),
                                                          ),
                                                          SizedBox(width: Dimensions.width10 / 5,),
                                                          Padding(
                                                            padding: localizationController.selectedIndex == 0 ?
                                                            EdgeInsets.only(top: 0,) :
                                                            EdgeInsets.only(top: Dimensions.height10 / 2,),
                                                            child: CustomBigText(
                                                              text: "Comment".tr,
                                                              size: Dimensions.font16,
                                                              color: Colors.grey[700]!,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: Dimensions.height10 / 2,),

                                              Divider(
                                                height: Dimensions.height10 / 5,
                                                thickness: Dimensions.height10 / 10,
                                                indent: Dimensions.width15,
                                                endIndent: Dimensions.width15,
                                              ),

                                              // Like, Details and Comments
                                              Container(
                                                // color: Colors.yellow,
                                                color: Colors.white,
                                                height: Dimensions.height45 ,
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                      /*onTap: ()  {
                                              // postController.getAllPosts();
                                              PlaceLikeBody commentId = PlaceLikeBody(
                                                // commentId: postController.currentPostList.length - 1 - (index - 1),
                                                commentId: index,//postController.currentPostList[index].id!.toString(),
                                              );
                                              Get.find<PostController>().placeLikeAndDislike(
                                                postController.currentPostList[index].id!,
                                                commentId,
                                              );
                                              postController.getAllPosts(productId);
                                              // Get.find<PostController>().getAllPosts(productId);
                                              print("commentId from like from CommentPage :::::::::::::::::::::::::::::: " + commentId.toJson()['commentId'].toString());
                                              print("postController.currentPostList[index].liked! :::::::::::::::::::::::::::::: " + postController.currentPostList[index].liked.toString());
                                              // print("elMomtazLabsa.elMomtazLabsaList[widget.pageId].like :::::::::::::::::::::::::::::: " + elMomtazLabsa.elMomtazLabsaList[widget.pageId].liked.toString());
                                            },*/
                                                      onTap: ()  {
                                                        // postController.getAllPosts();
                                                        PlaceProductLikeBody productId = PlaceProductLikeBody(
                                                          // commentId: postController.currentPostList.length - 1 - (index - 1),
                                                          id: widget.pageId,//postController.currentPostList[index].id!.toString(),
                                                        );
                                                        Get.find<PostController>().placeLikeAndDislikeForProducts(
                                                          widget.productId,
                                                          // elMomtazLabsa.elMomtazLabsaList[widget.pageId].productLiked!,
                                                          productId,
                                                        );
                                                        postController.getAllPosts(widget.productId);
                                                        // print("elMomtazLabsa.elMomtazLabsaList[widget.pageId].like :::::::::::::::::::::::::::::: " + widget.like!.toString());
                                                      },
                                                      child:
                                                      Padding(
                                                        padding: EdgeInsets.only(right: Dimensions.width15, left: Dimensions.width15),
                                                        child:
                                                        Container(

                                                            height: double.maxFinite,
                                                            width: Dimensions.width30 * 3.5,
                                                            // width: MediaQuery.of(context).size.width / 4,
                                                            color: Colors.white,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Icon(
                                                                  Icons.thumb_up_outlined,
                                                                  // Icons.thumb_up,
                                                                  size: Dimensions.iconSize24,
                                                                  color: Colors.grey[500],
                                                                  // color: widget.productId.liked ? Colors.blue : Colors.grey[700],
                                                                  // color: widget.like! ? Colors.blue : Colors.grey[700],
                                                                ),
                                                                SizedBox(width: Dimensions.width5),
                                                                Text(
                                                                  "Like".tr,
                                                                  style: TextStyle(
                                                                    color: Colors.grey[500],
                                                                    fontSize: Dimensions.font20,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                        ),
                                                      ),
                                                    ),
                                                    // SizedBox(width: Dimensions.width5,),
                                                    Container(
                                                      // color: Colors.black,
                                                      color: Colors.white,
                                                      height: double.maxFinite,
                                                      width: Dimensions.width30 * 9.2,
                                                      // padding: EdgeInsets.only(right: 20),
                                                      child: ListView.separated(
                                                        scrollDirection: Axis.horizontal,
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        itemCount: 2,
                                                        separatorBuilder: (BuildContext context, int index) {  return SizedBox(width: Dimensions.width10);  },
                                                        itemBuilder: (context, index) {
                                                          return InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                _selectedIndex = index;
                                                              });
                                                            },
                                                            child: _selectedIndex == index ?
                                                            SelectedAndUnSelectedCategoryItem(
                                                              name: name[index].tr,
                                                              textColor: Colors.blue,
                                                              icon: selectedIcon[index],
                                                              iconColor: Colors.blue,
                                                              backgroundColor: Colors.white,
                                                            ) :
                                                            SelectedAndUnSelectedCategoryItem(
                                                              name: name[index].tr,
                                                              textColor: Colors.grey[500]!,
                                                              icon: UnSelectedIcon[index],
                                                              iconColor: Colors.grey[500]!,
                                                              backgroundColor: Colors.white,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // TabBar(
                                              //   controller: _tabController,
                                              //   labelColor: Colors.black,
                                              //   unselectedLabelColor: Colors.grey,
                                              //   tabs: const [
                                              //     Tab(text: "التفاصيل"),
                                              //     Tab(text: "التعليقات",),
                                              //   ]
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // The Second Half of The Page
                                // Details and Comments Body
                                SliverToBoxAdapter(
                                  child: FadeAnimation(
                                    intervalStart: 0.04,
                                    duration: const Duration(milliseconds: 1250),
                                    child: SlideAnimation(
                                      begin: Offset(0, Dimensions.height20 * 11),
                                      intervalStart: 0.6,
                                      duration: const Duration(milliseconds: 1250),
                                      child: _selectedIndex == 0 ?
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(Dimensions.height10 / 1.5),
                                            child: SingleChildScrollView(
                                              physics: const BouncingScrollPhysics(),
                                              child: ExpandableText(
                                                text: widget.product.description.toString(),
                                                // text: "asfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsd",),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(Dimensions.height10 / 1.5),
                                            child: SingleChildScrollView(
                                                physics: const BouncingScrollPhysics(),
                                                child: InkWell(
                                                  onTap: ()  {},
                                                  child: Container(
                                                    height: Dimensions.height45,
                                                    width: double.maxFinite,
                                                    color: Colors.white,
                                                    // child: ,
                                                  ),
                                                )
                                            ),
                                          )
                                        ],
                                      ) :
                                      // Container()
                                      CommentSection(
                                          productId: widget.productId,
                                          // currentId: postController.currentPostList[widget.pageId].id,
                                          replyController: repliesController
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            bottomNavigationBar: _selectedIndex == 0 ?
                            Padding(
                              padding: EdgeInsets.only(right: Dimensions.width15,
                                  left: Dimensions.width15,
                                  bottom: Dimensions.height20),
                              child: cartController.existInCart(widget.product) && elMomtazLabsa.checkQuantity(-1) == 0 || elMomtazLabsa.inCartItems.toString() == "0" ?
                              ElevatedButton(
                                onPressed: () {
                                  elMomtazLabsa.increase(widget.product);
                                  elMomtazLabsa.addItem(widget.product);
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                    double.maxFinite,
                                    Dimensions.height45 * 1.5,
                                  ),
                                  primary: Colors.blue,
                                ),
                                child: CustomBigText(
                                  text: "Add_To_Cart".tr,
                                  color: Colors.white,
                                  size: Dimensions.font26,
                                ),
                              )
                                  :
                              //Remove And Add Container
                              Container(
                                width: double.maxFinite,
                                height: Dimensions.height45 * 1.5,
                                padding: EdgeInsets.all(1.5),
                                decoration: BoxDecoration(
                                  // color: Colors.red,
                                  color: Colors.blueGrey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                                  border: Border.all(width: 2, color: Colors.blueGrey.withOpacity(0.05),),
                                ),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    //Add Icon
                                    InkWell(
                                      onTap: () {
                                        elMomtazLabsa.increase(widget.product);
                                        elMomtazLabsa.addItem(widget.product);
                                        // if(cartController.getQuantity(widget.product) == 10) {     modelSheet();     }
                                        // if(cartController.getQuantity(widget.product) == widget.product.max_quantity) {     showMeDialog();     }
                                      },
                                      child: Container(
                                        width: Dimensions.width30 * 2,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: cartController.getQuantity(widget.product) == widget.product.max_quantity ? Colors.grey : Colors.blue,
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius15 / 3),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),

                                    //inCartItems
                                    InkWell(
                                      onTap: () => modelSheet(),
                                      child: Container(
                                          height: double.maxFinite,
                                          width: Dimensions.width30 * 7.5,
                                          padding: EdgeInsets.only(top: Dimensions.height10 / 5),
                                          // color: Colors.red,
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: [
                                              CustomBigText(
                                                text: elMomtazLabsa.inCartItems.toString(),
                                              ),
                                              SizedBox(  height: 5,   ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Total".tr + " : ",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight: FontWeight.w500
                                                    ),
                                                  ),
                                                  Text(
                                                    cartController.totalItemAmount(widget.product, 0) == 0 ? widget.product.price.toString() : cartController.totalItemAmount(widget.product, 0).toString(),
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight: FontWeight.w500
                                                    ),
                                                  ),
                                                  Text(
                                                    " " + "Pound".tr,
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight: FontWeight.w500
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )

                                      ),
                                    ),

                                    //Remove Icon
                                    InkWell(
                                      onTap: () {
                                        elMomtazLabsa.decrease(widget.product);
                                        elMomtazLabsa.addItem(widget.product);
                                      },
                                      child: Container(
                                        width: Dimensions.width30 * 2,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius15 / 3),
                                        ),
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),),),],),),):
                            GetBuilder<PostController>(builder: (postController) {
                              return Container(
                                height: Dimensions.height45 * 2.75,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    InputWidget(
                                      obscureText: false,
                                      hintText: 'Write_A_Comment'.tr,
                                      controller: _noteController,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        // backgroundColor: Colors.black,
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 50,
                                          vertical: 10,
                                        ),
                                      ),
                                      onPressed: () async {
                                        PlacePostBody content = PlacePostBody(
                                          content: _noteController.text,
                                        );
                                        print("content from CommentPage :::::::::::::::::::::::::::::: " + content.toJson()['content'].toString());
                                        // Get.find<PostController>().placePost(
                                        //   widget.productId,
                                        //   content,
                                        // );
                                        // _noteController.clear();
                                        // postController.getAllPosts(widget.productId);
                                      },
                                      child: const Text('Reply'),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          );
                        });});});});});});});});});});});
      }
  }

class CommentSection extends StatelessWidget {

  var productId;
  var replyController;
  // var currentId;

  CommentSection({
    Key? key,
    required this.productId,
    required this.replyController,
    // required this.currentId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RefreshIndicator(
            onRefresh: () async {
              // await _postController.getAllPosts();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Get.find<AuthController>().userLoggedIn() == false ?
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteHelper.getSignInPage());
                    },
                    child: Center(
                      child: Container(
                        height: Dimensions.height45 * 2.5,
                        width: double.maxFinite,
                        // color: Colors.red,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You_Must_Be_Logged_In_To_See_Comments".tr,
                                style: TextStyle(
                                    fontSize: Dimensions.font16,
                                    color: Colors.grey[700]
                                ),
                              ),
                              Text(
                                "Click_Here_To_Sign_IN".tr,
                                style: TextStyle(
                                    fontSize: Dimensions.font16,
                                    color: Colors.blue,
                                  fontWeight: FontWeight.w800
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ) :

                GetBuilder<PostController>(builder: (postController){
                  return GetBuilder<RepliesController>(builder: (repliesController){

                  // print("length of comments ????????????????????????????????::::::: " + postController.getAllPosts2(13));

                      return postController.currentPostList.isEmpty ?
                      Center(
                        child: Container(
                          height: Dimensions.height45 * 4,
                          width: double.maxFinite,
                          // color: Colors.red,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.comment_bank,
                                  color: Colors.grey[300],
                                  size: Dimensions.iconSize24 * 4,
                                ),
                                Text(
                                  "No_Comments_Yet".tr,
                                  style: TextStyle(
                                      fontSize: Dimensions.font20 * 1.1,
                                      color: Colors.grey[600]
                                  ),
                                ),
                                Text(
                                  "Be_The_First_To_Comment".tr,
                                  style: TextStyle(
                                      fontSize: Dimensions.font20 / 1.3,
                                      color: Colors.grey[700],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ) :
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        // itemCount: _postController.posts.value.length,
                        itemCount: postController.currentPostList.length,
                        itemBuilder: (context, index) {
                          // int reversedIndex = postController.currentPostList.length - 1 - index;
                          // String currentTime = postController.currentPostList[index].createdAt!;
                          var time = Get.find<PostController>().createdTime;
                          var currentPost = postController.currentPostList[index].id;

                          // var replies = Get.find<RepliesController>().getReplies(currentId, productId);
                          // print("replies %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          " + replies.toString());

                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: Dimensions.radius20 * 1.3,
                                    backgroundColor: Colors.grey[350],
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.width10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(Dimensions.height10),
                                        // height: 150,
                                        width: Dimensions.width30 * Dimensions.width15 / 1.15,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                                          color: Colors.blueGrey[50],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              postController.currentPostList[index].user!.fName.toString(),
                                              style: TextStyle(
                                                  fontSize: Dimensions.font16 * 1.1,
                                                  fontWeight: FontWeight.w800
                                              ),
                                            ),
                                            Text(
                                              postController.currentPostList[index].user!.email.toString(),
                                              style: TextStyle(
                                                  fontSize: Dimensions.font12 * 1.1,
                                                  color: Colors.grey
                                              ),
                                            ),
                                            SizedBox(  height: Dimensions.height10,  ),
                                            Text(postController.currentPostList[index].content.toString()),

                                          ],
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(  height: Dimensions.height20,  ),
                                          Container(
                                              height: Dimensions.height45,
                                              width: Dimensions.width30 * 2,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: CustomSmallText(
                                                  text: time.toString(),
                                                  // text: postController.currentPostList[index].createdAt.toString(),
                                                  // text: '',
                                                  size: Dimensions.font20 / 1.1,
                                                ),
                                              )
                                          ),
                                          /*onPressed: () async {
                      PlacePostBody content = PlacePostBody(
                        content: _noteController.text,
                      );
                      print("content from CommentPage :::::::::::::::::::::::::::::: " + content.toJson()['content'].toString());
                      Get.find<PostController>().placePost(
                        content,
                      );
                      _noteController.clear();
                      postController.getAllPosts();
                    },*/
                                          InkWell(
                                            onTap: ()  {
                                              // postController.getAllPosts();
                                              PlaceLikeBody commentId = PlaceLikeBody(
                                                commentId: index,//postController.currentPostList[index].id!.toString(),
                                              );
                                              Get.find<PostController>().placeLikeAndDislike(
                                                postController.currentPostList[index].id!,
                                                commentId,
                                              );
                                              postController.getAllPosts(productId);
                                              // Get.find<PostController>().getAllPosts(productId);
                                              print("commentId from like from CommentPage :::::::::::::::::::::::::::::: " + commentId.toJson()['commentId'].toString());
                                              print("postController.currentPostList[index].liked! :::::::::::::::::::::::::::::: " + postController.currentPostList[index].liked.toString());
                                              // print("elMomtazLabsa.elMomtazLabsaList[widget.pageId].like :::::::::::::::::::::::::::::: " + elMomtazLabsa.elMomtazLabsaList[widget.pageId].liked.toString());
                                            },
                                            child: Container(
                                                height: Dimensions.height45,
                                                width: Dimensions.width30 * 2,
                                                color: Colors.transparent,
                                                child: Center(
                                                  child: CustomSmallText(
                                                    text: "Like".tr,
                                                    size: Dimensions.font20 / 1.1,
                                                    // postController.currentPostList[index].content.toString()
                                                    color: postController.currentPostList[index].liked! ? Colors.blue : Colors.black,
                                                  ),
                                                )
                                            ),
                                          ),
                                          //var currentPost = postController.currentPostList[index].id;
                                          InkWell(
                                            onTap: (){
                                              Get.toNamed(
                                                RouteHelper.getReplyPage(),
                                                arguments: ReplyPage(
                                                  currentPost: currentPost,
                                                  index: index,
                                                  productId: productId
                                                  // repliesController: RepliesController,
                                                ),
                                              );
                                            },
                                            child: Container(
                                                height: Dimensions.height45,
                                                width: Dimensions.width30 * 2,
                                                color: Colors.transparent,
                                                child: Center(
                                                  child: CustomSmallText(
                                                    text: "Reply".tr,
                                                    size: Dimensions.font20 / 1.1,
                                                  ),
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimensions.height10 / 2,),
                              // replyController.currentRepliesList.toList().length >= 0 ?
                    //           Padding(
                    //               padding: EdgeInsets.only(right: Dimensions.width30 * 2.5),
                    //             child: Row(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 CircleAvatar(
                    //                   radius: Dimensions.radius15,
                    //                   backgroundColor: Colors.grey[350],
                    //                   child: const Icon(
                    //                     Icons.person,
                    //                     color: Colors.white,
                    //                   ),
                    //                 ),
                    //                 SizedBox(width: Dimensions.width10,),
                    //                 Column(
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     Container(
                    //                       padding: EdgeInsets.all(Dimensions.height10),
                    //                       // height: 150,
                    //                       width: Dimensions.width30 * 9.1,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.circular(Dimensions.radius20),
                    //                         color: Colors.blueGrey[50],
                    //                       ),
                    //                       child: Column(
                    //                         crossAxisAlignment: CrossAxisAlignment.stretch,
                    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                         // crossAxisAlignment: CrossAxisAlignment.start,
                    //                         children: [
                    //                           Text(
                    //                             repliesController.currentRepliesList[index].user!.fName.toString(),
                    //                             style: TextStyle(
                    //                                 fontSize: Dimensions.font16 * 1.1,
                    //                                 fontWeight: FontWeight.w800
                    //                             ),
                    //                           ),
                    //                           Text(
                    //                             repliesController.currentRepliesList[index].user!.email.toString(),
                    //                             style: TextStyle(
                    //                                 fontSize: Dimensions.font12 * 1.1,
                    //                                 color: Colors.grey
                    //                             ),
                    //                           ),
                    //                           SizedBox(  height: Dimensions.height10,  ),
                    //                           Text(repliesController.currentRepliesList[index].body.toString()),
                    //
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Row(
                    //                       crossAxisAlignment: CrossAxisAlignment.start,
                    //                       mainAxisAlignment: MainAxisAlignment.start,
                    //                       children: [
                    //                         SizedBox(  height: Dimensions.height20,  ),
                    //                         Container(
                    //                             height: Dimensions.height45,
                    //                             width: Dimensions.width30 * 2,
                    //                             color: Colors.transparent,
                    //                             child: Center(
                    //                               child: CustomSmallText(
                    //                                 text: time.toString(),
                    //                                 // text: postController.currentPostList[index].createdAt.toString(),
                    //                                 // text: '',
                    //                                 size: Dimensions.font20 / 1.1,
                    //                               ),
                    //                             )
                    //                         ),
                    //                         /*onPressed: () async {
                    //   PlacePostBody content = PlacePostBody(
                    //     content: _noteController.text,
                    //   );
                    //   print("content from CommentPage :::::::::::::::::::::::::::::: " + content.toJson()['content'].toString());
                    //   Get.find<PostController>().placePost(
                    //     content,
                    //   );
                    //   _noteController.clear();
                    //   postController.getAllPosts();
                    // },*/
                    //                         InkWell(
                    //                           onTap: ()  {
                    //                             // postController.getAllPosts();
                    //                             PlaceLikeBody commentId = PlaceLikeBody(
                    //                               commentId: index,//postController.currentPostList[index].id!.toString(),
                    //                             );
                    //                             Get.find<PostController>().placeLikeAndDislike(
                    //                               postController.currentPostList[index].id!,
                    //                               commentId,
                    //                             );
                    //                             postController.getAllPosts(productId);
                    //                             // Get.find<PostController>().getAllPosts(productId);
                    //                             print("commentId from like from CommentPage :::::::::::::::::::::::::::::: " + commentId.toJson()['commentId'].toString());
                    //                             print("postController.currentPostList[index].liked! :::::::::::::::::::::::::::::: " + postController.currentPostList[index].liked.toString());
                    //                             // print("elMomtazLabsa.elMomtazLabsaList[widget.pageId].like :::::::::::::::::::::::::::::: " + elMomtazLabsa.elMomtazLabsaList[widget.pageId].liked.toString());
                    //                           },
                    //                           child: Container(
                    //                               height: Dimensions.height45,
                    //                               width: Dimensions.width30 * 2,
                    //                               color: Colors.transparent,
                    //                               child: Center(
                    //                                 child: CustomSmallText(
                    //                                   text: "أعجبني",
                    //                                   size: Dimensions.font20 / 1.1,
                    //                                   // postController.currentPostList[index].content.toString()
                    //                                   color: postController.currentPostList[index].liked! ? Colors.blue : Colors.black,
                    //                                 ),
                    //                               )
                    //                           ),
                    //                         ),
                    //                         //var currentPost = postController.currentPostList[index].id;
                    //                         InkWell(
                    //                           onTap: (){
                    //                             Get.toNamed(
                    //                               RouteHelper.getReplyPage(),
                    //                               arguments: ReplyPage(
                    //                                   currentPost: currentPost,
                    //                                   index: index,
                    //                                   productId: productId
                    //                                 // repliesController: RepliesController,
                    //                               ),
                    //                             );
                    //                           },
                    //                           child: Container(
                    //                               height: Dimensions.height45,
                    //                               width: Dimensions.width30 * 2,
                    //                               color: Colors.transparent,
                    //                               child: Center(
                    //                                 child: CustomSmallText(
                    //                                   text: "رد",
                    //                                   size: Dimensions.font20 / 1.1,
                    //                                 ),
                    //                               )
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ],
                    //             ),
                    //           ) ,
                    //               // : Container(),
                    //           SizedBox(height: Dimensions.height10 / 2,),
                            ],
                          );
                        },
                      );});}),
              ],),),),);
  }
}

class SelectedAndUnSelectedCategoryItem extends StatelessWidget {

  final String name;
  final Color textColor;
  final IconData? icon;
  final Color iconColor;
  final Color backgroundColor;

  const SelectedAndUnSelectedCategoryItem({
    Key? key,
    required this.name,
    required this.textColor,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: Dimensions.width30 * 4.5,
      child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width5,),
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: Dimensions.font20,
                    color: textColor,
                  ),),],),],),
    );
  }
}