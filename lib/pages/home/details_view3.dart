import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/controllers/cart_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/popular_product_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/recommended_product_controller.dart';
import 'package:theblue_crown/controllers/language_controller.dart';
import 'package:theblue_crown/pages/home/company_or_factory_file/grid_view_of_food_products.dart';
import 'package:theblue_crown/pages/home/product_info_text.dart';
import 'package:theblue_crown/pages/home/products/Aagena_1kg.dart';
import 'package:theblue_crown/pages/home/products/Aagena_25kg.dart';
import 'package:theblue_crown/pages/home/products/Aagena_5kg.dart';
import 'package:theblue_crown/pages/home/products/TAKASAG_BLOSSOM.dart';
import 'package:theblue_crown/pages/home/products/TAKASAG_LAVENDER.dart';
import 'package:theblue_crown/pages/home/products/TAKASAG_LEMON.dart';
import 'package:theblue_crown/pages/home/products/TAKASAG_OUDH.dart';
import 'package:theblue_crown/pages/home/products/TAKASAG_SOFTNER.dart';
import 'package:theblue_crown/pages/home/products/TUC_Apple_700.dart';
import 'package:theblue_crown/pages/home/products/TUC_FARI_700.dart';
import 'package:theblue_crown/pages/home/products/TUC_MINT_700.dart';
import 'package:theblue_crown/pages/home/products/TUC_lavender_700.dart';
import 'package:theblue_crown/pages/home/products/blue_color.dart';
import 'package:theblue_crown/pages/home/products/brmel_160kg.dart';
import 'package:theblue_crown/pages/home/products/butyl_gelicol.dart';
import 'package:theblue_crown/pages/home/products/elmomtaz_labsa_31.5KG.dart';
import 'package:theblue_crown/pages/home/products/elmomtaz_labsa_5KG.dart';
import 'package:theblue_crown/pages/home/products/elmomtaz_labsa_63KG.dart';
import 'package:theblue_crown/pages/home/products/formalin_1kg.dart';
import 'package:theblue_crown/pages/home/products/formalin_20kg.dart';
import 'package:theblue_crown/pages/home/products/formalin_5kg.dart';
import 'package:theblue_crown/pages/home/products/formalin_60kg.dart';
import 'package:theblue_crown/pages/home/products/glesreen_1kg.dart';
import 'package:theblue_crown/pages/home/products/glesreen_250kg.dart';
import 'package:theblue_crown/pages/home/products/glesreen_5kg.dart';
import 'package:theblue_crown/pages/home/products/gmdana.dart';
import 'package:theblue_crown/pages/home/products/kd_alcano85_1kg.dart';
import 'package:theblue_crown/pages/home/products/kd_alcano85_220kg.dart';
import 'package:theblue_crown/pages/home/products/kolor_1250kg.dart';
import 'package:theblue_crown/pages/home/products/kolor_60kg.dart';
import 'package:theblue_crown/pages/home/products/mal7_25KG.dart';
import 'package:theblue_crown/pages/home/products/mosadf_1kg.dart';
import 'package:theblue_crown/pages/home/products/mosadf_5kg.dart';
import 'package:theblue_crown/pages/home/products/pb4_premofor_1kg.dart';
import 'package:theblue_crown/pages/home/products/pb4_premofor_200kg.dart';
import 'package:theblue_crown/pages/home/products/pb4_premofor_5kg.dart';
import 'package:theblue_crown/pages/home/products/pb4_premofor_65kg.dart';
import 'package:theblue_crown/pages/home/products/ph.dart';
import 'package:theblue_crown/pages/home/products/pure_labsa_31.5KG.dart';
import 'package:theblue_crown/pages/home/products/pure_labsa_63KG.dart';
import 'package:theblue_crown/pages/home/products/red_color.dart';
import 'package:theblue_crown/pages/home/products/semasol_dow_1kg.dart';
import 'package:theblue_crown/pages/home/products/semasol_dow_213kg.dart';
import 'package:theblue_crown/pages/home/products/semasol_dow_5kg.dart';
import 'package:theblue_crown/pages/home/products/semasol_dow_70kg.dart';
import 'package:theblue_crown/pages/home/products/snobar_rtx_1kg.dart';
import 'package:theblue_crown/pages/home/products/snobar_rtx_25kg.dart';
import 'package:theblue_crown/pages/home/products/snobar_rtx_5kg.dart';
import 'package:theblue_crown/pages/home/products/soda_5kg.dart';
import 'package:theblue_crown/pages/home/products/soda_70kg.dart';
import 'package:theblue_crown/pages/home/products/super_elmomtaz_labsa_31.5KG.dart';
import 'package:theblue_crown/pages/home/products/super_elmomtaz_labsa_5KG.dart';
import 'package:theblue_crown/pages/home/products/super_elmomtaz_labsa_63KG.dart';
import 'package:theblue_crown/pages/home/products/tank.dart';
import 'package:theblue_crown/pages/home/products/taylos_combizell_1kg.dart';
import 'package:theblue_crown/pages/home/products/taylos_combizell_25kg.dart';
import 'package:theblue_crown/pages/home/products/taylos_walocel_1kg.dart';
import 'package:theblue_crown/pages/home/products/taylos_walocel_25kg.dart';
import 'package:theblue_crown/pages/home/products/texapon_galaxy_160kg.dart';
import 'package:theblue_crown/pages/home/products/texapon_galaxy_240kg.dart';
import 'package:theblue_crown/pages/home/products/texapon_galaxy_5kg.dart';
import 'package:theblue_crown/pages/home/products/texapon_malaysia_160Kg.dart';
import 'package:theblue_crown/pages/home/products/texapon_renotex_170kg.dart';
import 'package:theblue_crown/pages/home/products/yellow_color.dart';
import 'package:theblue_crown/routes/route_helper.dart';
import 'package:theblue_crown/utils/dimensions.dart';
import 'package:theblue_crown/utils/app_constants.dart';
import 'package:theblue_crown/widgets/app_icon.dart';
import 'package:theblue_crown/widgets/custom_big_text.dart';
import 'package:theblue_crown/widgets/expandable_text.dart';

import '../../animations/fade_animation.dart';
import '../../animations/scale_animation.dart';
import '../../animations/slide_animation.dart';
import 'products/Butas.dart';



class DetailsView3 extends StatefulWidget {
  // final int pageId ;
  // final String page;
  const DetailsView3({
    Key? key,
    // required this.pageId,
    // required this.page,
  }) : super(key: key);

  @override
  State<DetailsView3> createState() => _RecommendedDetailsState();

}

class _RecommendedDetailsState extends State<DetailsView3> with TickerProviderStateMixin{

  final String _cartTag = "";
  bool isClicked = true;


  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  // PH products = new PH();
  // Formalin_1kg products = new Formalin_1kg();
  // Formalin_5kg products = new Formalin_5kg();
  // Formalin_20kg products = new Formalin_20kg();
  // Formalin_60kg products = new Formalin_60kg();
  // Elmomtaz_Labsa_5KG products = new Elmomtaz_Labsa_5KG();
  // Elmomtaz_Labsa_31KG products = new Elmomtaz_Labsa_31KG();
  // Elmomtaz_Labsa_63KG products = new Elmomtaz_Labsa_63KG();
  // Super_Elmomtaz_Labsa_5KG products = new Super_Elmomtaz_Labsa_5KG();
  // Super_Elmomtaz_Labsa_31KG products = new Super_Elmomtaz_Labsa_31KG();
  // Super_Elmomtaz_Labsa_63KG products = new Super_Elmomtaz_Labsa_63KG();
  // Pure_Labsa_31KG products = new Pure_Labsa_31KG();
  // Pure_Labsa_63KG products = new Pure_Labsa_63KG();
  // Butas products = new Butas();
  // Soda_5kg products = new Soda_5kg();
  // Soda_70kg products = new Soda_70kg();
  // Taylos_Combizell_1kg products = new Taylos_Combizell_1kg();
  // Taylos_Combizell_25kg products = new Taylos_Combizell_25kg();
  // Taylos_Walocel_1kg products = new Taylos_Walocel_1kg();
  // Taylos_Walocel_25kg products = new Taylos_Walocel_25kg();
  // Texapon_Galaxy_5kg products = new Texapon_Galaxy_5kg();
  // Texapon_Galaxy_160kg products = new Texapon_Galaxy_160kg();
  // Texapon_Galaxy_240kg products = new Texapon_Galaxy_240kg();
  // Texapon_Renotex_170kg products = new Texapon_Renotex_170kg();
  Texapon_Malaysia_160Kg products = new Texapon_Malaysia_160Kg();
  // Yellow_Color products = new Yellow_Color();
  // Blue_color products = new Blue_color();
  // Red_Color products = new Red_Color();
  // TUC_Apple_700 products = new TUC_Apple_700();
  // TUC_FARI_700 products = new TUC_FARI_700();
  // TUC_lavender_700 products = new TUC_lavender_700();
  // TUC_MINT_700 products = new TUC_MINT_700();
  // TAKASAG_BLOSSOM products = new TAKASAG_BLOSSOM();
  // TAKASAG_LAVENDER products = new TAKASAG_LAVENDER();
  // TAKASAG_LEMON products = new TAKASAG_LEMON();
  // TAKASAG_OUDH products = new TAKASAG_OUDH();
  // TAKASAG_SOFTNER products = new TAKASAG_SOFTNER();
  // Mal7_25KG products = new Mal7_25KG();
  // Kd_Alcano85_1kg products = new Kd_Alcano85_1kg();
  // Kd_Alcano85_220kg products = new Kd_Alcano85_220kg();
  // Pb4_Premofor_1kg products = new Pb4_Premofor_1kg();
  // Pb4_Premofor_5kg products = new Pb4_Premofor_5kg();
  // Pb4_Premofor_65kg products = new Pb4_Premofor_65kg();
  // Pb4_Premofor_200kg products = new Pb4_Premofor_200kg();
  // Kolor_60kg products = new Kolor_60kg();
  // Kolor_1250kg products = new Kolor_1250kg();
  // Aagena_1kg products = new Aagena_1kg();
  // Aagena_5kg products = new Aagena_5kg();
  // Aagena_25kg products = new Aagena_25kg();
  // Mosadf_1kg products = new Mosadf_1kg();
  // Mosadf_5kg products = new Mosadf_5kg();
  // Glesreen_1kg products = new Glesreen_1kg();
  // Glesreen_5kg products = new Glesreen_5kg();
  // Glesreen_250kg products = new Glesreen_250kg();
  // Snobar_Rtx_1kg products = new Snobar_Rtx_1kg();
  // Snobar_Rtx_5kg products = new Snobar_Rtx_5kg();
  // Snobar_Rtx_25kg products = new Snobar_Rtx_25kg();
  // Semasol_Dow_1kg products = new Semasol_Dow_1kg();
  // Semasol_Dow_5kg products = new Semasol_Dow_5kg();
  // Semasol_Dow_70kg products = new Semasol_Dow_70kg();
  // Semasol_Dow_213kg products = new Semasol_Dow_213kg();
  // Gmdana products = new Gmdana();
  // Brmel_160kg products = new Brmel_160kg();
  // Tank products = new Tank();
  // Butyl_Gelicol products = new Butyl_Gelicol();
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////


  int _selectedIndex = 0;

  List<String> name = [
    'Details',
    'Comments',
  ];

  @override
  Widget build(BuildContext context) {
    // var product = Get.find<RecommendedProductController>().recommendedProductList[widget.pageId];
    // Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

    TabController _tabController =
    TabController(length: 2, vsync: this);

    return WillPopScope(
      onWillPop: () async {
        // Get.toNamed(RouteHelper.getCompanyOrFactoryView());
        // Get.toNamed(RouteHelper.getInitial());
        // DoubleTapGestureRecognizer(
        //   // debugOwner: Get.back()
        //   supportedDevices: Get.back()
        // );
        return (await showDialog(
          context: Get.overlayContext!,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure'),
            content: const Text('Do you want to get back ?!'),
            actions: <Widget> [
              TextButton(
                onPressed: () => Get.back(result: false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Get.back(result: true),
                child: const Text('Yes'),
              ),
            ],
          ),
        ));
        // return true;
      },
      child: GetBuilder<LocalizationController>(builder: (localizationController){
        return Scaffold(
          backgroundColor: Colors.white,
          // backgroundColor: Color(0xff293f6e),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
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
                        alignment: Alignment.centerRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: Dimensions.height10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  //The Name
                                  CustomBigText(
                                    //text: product.name!,
                                    text: products.name.tr,
                                    size: Dimensions.font26,
                                    color: Colors.black,
                                  ),

                                  SizedBox(width: Dimensions.width15,),

                                  //The Price
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        products.price,
                                        style: TextStyle(
                                          fontSize: Dimensions.font26,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(width: Dimensions.width10,),
                                      Padding(
                                          padding: EdgeInsets.only(top: Dimensions.height10 / 2),
                                        child: CustomBigText(
                                          //text: product.name!,
                                          text: "Pound".tr,
                                          fontWeight: FontWeight.w800,
                                          overflow: TextOverflow.ellipsis,
                                          size: Dimensions.font26,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: Dimensions.width15,),
                            Container(
                              // color: Colors.red,
                              height: Dimensions.height45 * 1.4,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 2,
                                separatorBuilder: (BuildContext context, int index) {return SizedBox(width: Dimensions.width10 / 2);},
                                itemBuilder: (context, index){
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = index;
                                      });
                                    },
                                    child: _selectedIndex == index ?
                                    SelectedCategoryItem(
                                      name: name[index].tr,
                                      backgroundColor: Colors.white,
                                    ) :
                                    UnSelectedCategoryItem(
                                      name: name[index].tr,
                                      backgroundColor: Colors.white,
                                    ),
                                  );
                                },
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
                        width: double.maxFinite,
                        padding: EdgeInsets.only(top: Dimensions.height10 / 10, bottom: Dimensions.height10 / 2, right: Dimensions.width15, left: Dimensions.width15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // color: Color(0xff293f6e),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius20),
                            topRight: Radius.circular(Dimensions.radius20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                automaticallyImplyLeading: false,
                toolbarHeight: Dimensions.height30,
                pinned: true,
                backgroundColor: Colors.white,
                // backgroundColor: Color(0xff293f6e),
                expandedHeight: Dimensions.height45 * 12,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: "tag",
                    child: Stack(
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
                              // alignment: Alignment.centerLeft,
                              // child: ClipRRect(
                              //   borderRadius: BorderRadius.circular(Dimensions.radius20),
                              //   child: CachedNetworkImage(
                              //     imageUrl: AppConstants.BASE_URL + AppConstants.UPLOAD_URL + superElMomtazLabsa.superElMomtazLabsaList[index].img!,
                              //     height: Dimensions.listViewImgSize,
                              //     width:Dimensions.listViewImgSize,
                              //     fit: BoxFit.fill,
                              //     placeholder: (context, url) => Container(color: Colors.black12,),
                              //     errorWidget: (context, url, error) => Container(
                              //       color: Colors.black12,
                              //       child: const Icon(Icons.error, color: Colors.red),
                              //     ),
                              //   ),
                              // ),
                              child: products.img,
                            ),
                          ),
                        ),

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
                                      children:  [
                                        ProductInfoText(
                                          text: "Tare_Weight".tr,
                                          value: products.emptyValue + "KG".tr,
                                        ),
                                        ProductInfoText(
                                          text: "Net_Weight".tr,
                                          value: products.netValue + "KG".tr,
                                        ),
                                        ProductInfoText(
                                          text: "Gross_Weight".tr,
                                          value: products.fullValue + "KG".tr,
                                        ),
                                        ProductInfoText(
                                          text: "Origin".tr,
                                          value: products.origin.tr,
                                        ),
                                        ProductInfoText(
                                          text: "Company".tr,
                                          value: products.company.tr,
                                        ),
                                        ProductInfoText(
                                          text: "Concentration".tr,
                                          value: products.concentration,
                                        ),
                                        ProductInfoText(
                                          text: "Type".tr,
                                          value: products.type.tr,
                                        ),
                                        ProductInfoText(
                                          text: "Expiration".tr,
                                          value: products.exp.tr,
                                        ),
                                        ProductInfoText(
                                          text: "Production_Date".tr,
                                          value: products.pro,
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
                ),
              ),
              SliverToBoxAdapter(
                child: FadeAnimation(
                  intervalStart: 0.04,
                  duration: const Duration(milliseconds: 1250),
                  child: SlideAnimation(
                    begin: Offset(0, Dimensions.height20 * 11),
                    intervalStart: 0.6,
                    duration: const Duration(milliseconds: 1250),
                    child:  _selectedIndex == 0 ?
                    Container(
                        padding: EdgeInsets.all(Dimensions.height10 / 1.5),
                        child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: ExpandableText(
                              // text: product.description! +
                              // text: "asfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsd",),
                              text: products.description,
                            )
                        )
                    ) :
                    Center(
                      // height: MediaQuery.of(context).size.height,
                      child: Text("Hi Again"),
                    ),
                  ),
                  // Container(
                  //                     child: const SingleChildScrollView(
                  //                       physics: BouncingScrollPhysics(),
                  //                       child: ExpandableText(
                  //                         // text: product.description! +
                  //                         // text: "asfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsdasfsfasfasdfgadsgasdgadsgadgagadgadghadgadfhadfhadhadhadhadfrhadfsdfhsdfhdfhhsd",),
                  //                     text: "تحضيرهيتولد حمض السلفونيك بعملية السلفنة. عامل السلفنة عادة هو ثلاثي أكسيد الكبريت. التطبيق الخاص الواسع الطيف لهذه الطريقة هو إنتاج حموض ألكيل البنزين المسلفنة.RC6H5 + SO3 → RC6H4SO3Hفي هذ التفاعل، ثلاثي أكسيد الكبريت هو شغوف بالإلكترون ويخضع الأرين إلى عملية استبدال عطري شغوف بالإلكترونات.يمكن أكسدة الثيولات لتتحول إلى حموض سلفونيك:RSH + 3/2 O2 → RSO3Hالتطبيقاتمع أن الحموض السلفونية الألكيلية والأريلية معروفة، إلا أن معظم التطبيقات مرتبطة بالمشتقات العطرية.المنظفات والفاعلات بالسطحالمنظفات والمواد الفاعلة بالسطح هي جزيئات تتضمن مجموعات عالية القطبية وأخرى لاقطبية. الصابون هو فاعل بالسطح معروف مشتق من الحموض الدسمة. منذ منتصف القرن العشرين، تفوق استخدام حموض السلفونيك على الصابون في المجتمعات المتطورة. فمثلا، ينتج مليوني كيلوغرام من سلفونات ألكيل البنزين سنويًا لأغراض متعددة. سلفونات الليغنين هي مكونات في سوائل الثقب ومواد مضافة لبعض أنواع الخرسانة.الأصبغةالعديد إن لم يكن معظم أصبغة الأنثراكينون تنتج أو تعالج بالسلفنة  تميل حموض السلفونيك للارتباط الوثيق مع البروتينات والكربوهيدرات. معظم الأصبغة القابلة للغسل هي حموض سلفونيك (أو تمتلك مجموعة سولفونيل) لهذا السبب. الأصبغة المباشرة في أغلبها تتضمن مجموعات السلفونيل، وهي تساعد على انحلالية الصباغ في حوض الصباغة لتسهيل انتقاله إلى الألياف النسيجية كالقطن.الأدويةأدوية سلفوناميد المضادة للبكتريا منتجة من حموض السلفونيك.",)
                  //   ),
                  //   width: double.maxFinite,
                  //   // height: MediaQuery.of(context).size.height,
                  //   // child: TabBarView(
                  //   //   controller: _tabController,
                  //   //   children: [
                  //   //     ExpandableText(
                  //   //         // text: product.description! +
                  //   //       text: products.description,
                  //   //     ),
                  //   //     const Center(
                  //   //       // height: MediaQuery.of(context).size.height,
                  //   //       child: Text("Hi Again"),
                  //   //     ),
                  //   //   ],
                  //   // ),
                  //   margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,),
                  // ),
                ),

              ),
            ],
          ),
          bottomNavigationBar: GetBuilder<PopularProductController>(
              builder: (popularProduct){
                return Padding(
                  padding: EdgeInsets.only(bottom: Dimensions.height20),
                  child: isClicked && popularProduct.checkQuantity(-1) == 0 || popularProduct.inCartItems.toString() == "0" ?
                  //Add To Cart
                  GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(true);
                        // popularProduct.addItem(product);
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: Dimensions.height45 * 1.5,
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                        ),
                        child: Center(
                          child: CustomBigText(
                            text: "Add_To_Cart".tr,
                            color: Colors.white,
                            // alignment: Alignment.center,
                            size: Dimensions.font26,
                          ),
                        ),
                      )
                  ) :
                  //Remove And Add Container
                  Container(
                    width: double.maxFinite,
                    height: Dimensions.height45 * 1.5,
                    margin: EdgeInsets.only(
                      left: Dimensions.width20 / 2,
                      right: Dimensions.width20 / 2,
                    ),
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                    ),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Add Icon
                        GestureDetector(
                          onTap: (){
                            popularProduct.setQuantity(true);
                            // popularProduct.addItem(product);
                            setState(() {
                              isClicked = !isClicked;
                            });
                          },
                          child: Container(
                            width: Dimensions.width30 * 2,
                            height: double.infinity,
                            margin: EdgeInsets.only(
                              left: Dimensions.width20 / 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.width10 / 2,),
                        //inCartItems
                        CustomBigText(
                          text: popularProduct.inCartItems.toString(), //popularProduct.inCartItems.toString(),
                          // alignment: Alignment.center,
                        ),
                        SizedBox(width: Dimensions.width10 / 2,),
                        //Remove Icon
                        GestureDetector(
                          onTap: (){
                            popularProduct.setQuantity(false);
                            // popularProduct.addItem(product);
                            setState(() {
                              isClicked = !isClicked;
                            });
                          },
                          child: Container(
                            width: Dimensions.width30 * 2,
                            height: double.infinity,
                            margin: EdgeInsets.only(
                              right: Dimensions.width20 / 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        );
      }
  )
    );
  }
}

class SelectedCategoryItem extends StatelessWidget {
  const SelectedCategoryItem(
      {Key? key,
        required this.name,
        required this.backgroundColor
      })
      : super(key: key);

  final String name;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        // alignment: Alignment.bottomCenter,
        color: backgroundColor,
        width: MediaQuery.of(context).size.width / 2.2,
        child: Padding(
          padding: EdgeInsets.only(top: Dimensions.height15 / 1.2),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: Dimensions.font20,
                    color: Colors.blue
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              Container(
                height: Dimensions.height10 / 2.5,
                width: double.maxFinite,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      );
  }
}

class UnSelectedCategoryItem extends StatelessWidget {
  const UnSelectedCategoryItem(
      {Key? key,
        required this.name,
        required this.backgroundColor})
      : super(key: key);

  final String name;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: backgroundColor,
        width: MediaQuery.of(context).size.width / 2.2,
        child: Padding(
          padding: EdgeInsets.only(top: Dimensions.height15 / 1.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: Dimensions.font20,
                    color: Colors.grey
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              Container(
                height: Dimensions.height10 / 2,
                width: double.maxFinite,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      );
  }
}































// import 'package:flutter/material.dart';
// import 'package:theblue_crown/pages/home/product_info_text.dart';
// import 'package:theblue_crown/utils/dimensions.dart';
// import '../../animations/fade_animation.dart';
// import '../../animations/scale_animation.dart';
// import '../../animations/slide_animation.dart';
// import '../../controllers/popular_product_controller.dart';
// import '../../utils/navigation.dart';
// import '../../view/widgets/custom_big_text.dart';
// import 'package:get/get.dart';
//
// import '../../view/widgets/expandable_text.dart';
// class ProductScreen extends StatefulWidget {
//
//   // final int pageId ;
//   // final String page;
//
//   const ProductScreen({
//     Key? key,
//     // required this.pageId,
//     // required this.page,
//   }) : super(key: key);
//
//   @override
//   _ProductScreenState createState() => _ProductScreenState();
// }
//
// class _ProductScreenState extends State<ProductScreen> {
//   final width = Dimensions.width30 * Dimensions.width5;
//   late double _height;
//
//   final _duration = const Duration(milliseconds: 750);
//   final _psudoDuration = const Duration(milliseconds: 150);
//
//   _navigateBack() async {
//     await _animateContainerFromBottomToTop();
//
//     Navigation.pop(context);
//   }
//
//   _animateContainerFromBottomToTop() async {
//     //Animate back to default value
//     _height = MediaQuery.of(context).padding.top + 50;
//     setState(() {});
//
//     //Wait till animation is finished
//     await Future.delayed(_duration);
//   }
//
//   _animateContainerFromTopToBottom() async {
//     //Wait
//     await Future.delayed(_psudoDuration);
//
//     //Animate from top to bottom
//     _height = MediaQuery.of(context).size.height;
//     setState(() {});
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//
//     //Default height
//
//     _height = MediaQuery.of(context).padding.top + 50;
//     setState(() {});
//
//     //Animate Container from Top to bottom
//     _animateContainerFromTopToBottom();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Theme.of(context).primaryColor,
//       backgroundColor: Colors.blue,
//       body: AnimatedContainer(
//         height: _height,
//         duration: _duration,
//         padding: EdgeInsets.only(bottom: Dimensions.height10 / 3),
//         curve: Curves.fastOutSlowIn,
//         decoration: BoxDecoration(
//           color: Theme.of(context).scaffoldBackgroundColor,
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(Dimensions.radius20 * 2),
//             bottomLeft: Radius.circular(Dimensions.radius20 * 2),
//           ),
//         ),
//
//
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               //The upper part
//               Container(
//                 height: Dimensions.height45 * 2,
//                 width: Dimensions.screenWidth - width,
//                 color: const Color(0xFFf7c72a),
//                 // color: Colors.green,
//               ),
//               SizedBox(
//                 height: Dimensions.height45 * 8,
//                 child: Stack(
//                   children: [
//                     //yellow back shape
//                     Positioned(
//                       top: 0,
//                       bottom: Dimensions.height45 * 2 - Dimensions.height15,
//                       left: 0,
//                       right: width,
//                       child: Container(
//                         alignment: Alignment.topLeft,
//                         height: double.infinity,
//                         width: double.infinity,
//                         decoration: const BoxDecoration(
//                           color: Color(0xFFf7c72a),
//                           // color: Colors.red,
//                           borderRadius: BorderRadius.only(
//                             bottomRight: Radius.circular(50),
//                           ),
//                         ),
//                       ),
//                     ),
//                     //The Image
//                     Positioned.fill(
//                       top: 0,
//                       bottom: 0,
//                       left: -Dimensions.width30 * 2.1,
//                       child: ScaleAnimation(
//                         begin: 0,
//                         duration: const Duration(milliseconds: 1000),
//                         intervalStart: 0.2,
//                         curve: Curves.easeOutBack,
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Image.asset(
//                             'assets/images/gmdana.png',
//                             // 'assets/images/labsa2.png',
//                             width: Dimensions.width30 * 13.5,
//                           ),
//                         ),
//                       ),
//                     ),
//                     //Food Info
//                     Positioned.fill(
//                       top: Dimensions.height10 / 20,
//                       bottom: 0,
//                       right: Dimensions.width30 + Dimensions.width10,
//                       child: Align(
//                         alignment: Alignment.centerRight,
//                         child: FadeAnimation(
//                           duration: const Duration(milliseconds: 1250),
//                           child: ScaleAnimation(
//                             intervalStart: 0.4,
//                             duration: const Duration(milliseconds: 1250),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const <Widget>[
//                                 ProductInfoText(
//                                   text: 'الوزن',
//                                   value: '60 KG',
//                                 ),
//                                 ProductInfoText(
//                                   text: 'المنشأ',
//                                   value: 'مصر',
//                                 ),
//                                 ProductInfoText(
//                                   text: 'التركيز',
//                                   value: '85 %',
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               //the middle part
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: FadeAnimation(
//                         intervalStart: 0.4,
//                         duration: const Duration(milliseconds: 1300),
//                         child: SlideAnimation(
//                           intervalStart: 0.4,
//                           begin: const Offset(0, 80),
//                           duration: const Duration(milliseconds: 1300),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text(
//                                 'Raspberry Donut',
//                                 style: Theme.of(context).textTheme.headline4,
//                               ),
//                               const SizedBox(height: 20),
//                               Text(
//                                 '\$12.95',
//                                 style:
//                                 Theme.of(context).textTheme.headline4!.copyWith(
//                                   color: Theme.of(context).primaryColorDark,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                               ),
//                               const SizedBox(height: 20),
//                               const ExpandableText(
//                                 text: 'lorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetorem ipsum doremet',
//                               ),
//                               // Text(
//                               //   'lorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetloremlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetorem ipsum doremet',
//                               //   style: Theme.of(context).textTheme.bodyText2,
//                               // ),
//                             ],
//                           ),
//                         ),
//                     ),
//               ),
//             ],
//           ),
//         )
//       ),
//       bottomNavigationBar: GetBuilder<PopularProductController>(
//           builder: (popularProduct){
//             return Container(
//               height: Dimensions.bottomHeightBar / 1.25,
//               padding: EdgeInsets.only(top: Dimensions.height30,
//                 bottom: Dimensions.height20,
//                 left: Dimensions.width20,
//                 right: Dimensions.width20,),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(Dimensions.radius20 * 2),
//                   topRight: Radius.circular(Dimensions.radius20 * 2),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(
//                       top: Dimensions.height10,
//                       bottom: Dimensions.height10,
//                       left: Dimensions.width15,
//                       right: Dimensions.width15,
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(
//                           Dimensions.radius20),
//                       color: Colors.white,
//                     ),
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             popularProduct.setQuantity(false);
//                           },
//                           child: Icon(
//                             Icons.remove,
//                             color: Colors.grey.shade800,
//                           ),
//                         ),
//                         SizedBox(width: Dimensions.width30,),
//                         CustomBigText(
//                           text: popularProduct.inCartItems.toString(),
//                           alignment: Alignment.center,
//                         ),
//                         SizedBox(width: Dimensions.width30,),
//                         GestureDetector(
//                           onTap: () {
//                             popularProduct.setQuantity(true);
//                           },
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.grey.shade800,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // popularProduct.addItem(product);
//                       // Get.toNamed(RouteHelper.getInitial());
//                       // setState(() {
//                       //   _cartTag = '_cartTag';
//                       // });
//                     },
//                     child: Container(
//                       padding: EdgeInsets.only(
//                         top: Dimensions.height10,
//                         bottom: Dimensions.height10,
//                         left: Dimensions.width10,
//                         right: Dimensions.width10,),
//                       child: CustomBigText(
//                         // text: "\$ ${product.price!} | أضف للسلة ",
//                         text: "1800 | أضف للسلة ",
//                         color: Colors.white,
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                             Dimensions.radius20),
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//       ),
//     );
//   }
// }