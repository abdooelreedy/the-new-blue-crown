import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/controllers/cart_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/category_lists/category_list_view_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/galaxy_texapon_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/grid_view_of_sections_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/malaysia_texapon_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/renotex_texapon_controller.dart';
import 'package:theblue_crown/controllers/language_controller.dart';
import 'package:theblue_crown/controllers/controller_lists/product_grids/popular_product_controller.dart';
import 'package:theblue_crown/controllers/location_controller.dart';
import 'package:theblue_crown/controllers/post_controller.dart';
import 'package:theblue_crown/controllers/replies_controller.dart';
import 'package:theblue_crown/pages/address/add_address_page.dart';
import 'package:theblue_crown/pages/auth/sign_in_page.dart';
import 'package:theblue_crown/pages/home/details_view2.dart';
import 'package:theblue_crown/pages/home/details_view3.dart';
import 'package:theblue_crown/pages/home/home_view.dart';
import 'package:theblue_crown/pages/home/wallet_view.dart';
import 'package:theblue_crown/pages/payment/checkout_page.dart';
import 'dart:async';
import 'package:theblue_crown/routes/route_helper.dart';
import 'package:theblue_crown/utils/app_constants.dart';
import 'package:theblue_crown/utils/messages.dart';
import 'package:url_strategy/url_strategy.dart';
import 'controllers/controller_lists/category_lists/category_of_texapon_list_view_controller.dart';
import 'controllers/controller_lists/category_lists/taylos_category_list_view_controller.dart';
import 'controllers/controller_lists/product_grids/el_momtaz_labsa_controller.dart';
import 'controllers/controller_lists/sub_section_grids/grid_view_of_category_controller.dart';
import 'controllers/controller_lists/sub_section_grids/viscosity_enhancers_sub_section_controller.dart';
import 'controllers/controller_lists/product_grids/super_el_momtaz_labsa_controller.dart';
import 'controllers/controller_lists/product_grids/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'package:get_storage/get_storage.dart';

// Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
//   print("onBackground: ${message.notification?.title}/${message.notification?.body}/"
//       "${message.notification?.titleLocKey}");
// }
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async{
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await dep.init();

  // int? _orderId;
  // try{
  //   if(GetPlatform.isMobile) {
  //     final RemoteMessage? remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
  //     if(remoteMessage != null) {
  //       _orderId = remoteMessage.notification?.titleLocKey != null?
  //           int.parse(remoteMessage.notification!.titleLocKey!) : null;
  //     }
  //     await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
  //     FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  //   }
  // }catch(e) {
  //   if (kDebugMode) {
  //     print(e.toString());
  //   }
  // }

  Map<String, Map<String, String>> _languages = await dep.init();

  runApp(MyApp(languages: _languages,));
}

class MyApp extends StatelessWidget {
  MyApp({required this.languages});
  final Map<String, Map<String, String>> languages;

  int _feedId = 1;
  int get feedId => _feedId;

  int _foodId = 1;
  int get foodId => _foodId;

  @override
  Widget build(BuildContext context) {

    final box = GetStorage();
    final token = box.read('token');

    Get.put(LocationController(locationRepo: Get.find()));
    Get.find<CartController>().getCartData();

    // Section Grid
    Get.find<GridViewOfSectionsController>().getGridViewOfSectionsList();

    // SubSection Grids
    Get.find<ViscosityEnhancersSubSectionController>().getViscosityEnhancersSubSectionList();
    Get.find<GridViewOfCategoryController>().getGridViewOfCategoryList();

    // Category Lists
    Get.find<CategoryListViewController>().getCategoryListViewList();
    Get.find<CategoryOfTexaponListViewController>().getCategoryOfTexaponListViewList();
    Get.find<TaylosCategoryListViewController>().getTaylosCategoryListViewList();

    // Product Grids
    Get.find<ElMomtazLabsaController>().getElMomtazLabsaList();
    Get.find<SuperElMomtazLabsaController>().getSuperElMomtazLabsaList();
    Get.find<GalaxyTexaponController>().getGalaxyTexaponList();
    Get.find<RenotexTexaponController>().getRenotexTexaponList();
    Get.find<MalaysiaTexaponController>().getMalaysiaTexaponList();
    Get.find<PostController>().getAllPosts(feedId);
    Get.find<RepliesController>().getReplies(feedId, foodId);
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetBuilder<LocalizationController>(builder: (localizationController) {
          return GetMaterialApp(
            // scrollBehavior: AppScrollBehavior(),
            debugShowCheckedModeBanner: false,
            // locale: const Locale('en', 'US'),
            // translations: Translation(),
            locale: localizationController.locale,
            translations: Messages(languages: languages),
            fallbackLocale: Locale(
              AppConstants.languages[0].languageCode,
              AppConstants.languages[0].countryCode,
            ),
            theme: ThemeData(
              primaryColor: Colors.blue,
              brightness: Brightness.light
            ),

            // home: SplashScreen(),
            // home: SignInPage(),
            // home: CheckoutPage(),
            // home: DetailsView3(),
            // home: ProductScreen(),
            // home: AddAddressPage(),
            initialRoute: RouteHelper.getSplashPage(),
            getPages: RouteHelper.routes,
            defaultTransition: Transition.topLevel,
          );
        },);
      },);
    },);
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(
                'assets/images/bluesilver (2).jpg'
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late GoogleMapController mapController;
//
//   final LatLng _center = const LatLng(45.521563, -122.677433);
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Maps Sample App'),
//           backgroundColor: Colors.green[700],
//         ),
//         body: GoogleMap(
//           onMapCreated: _onMapCreated,
//           initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 11.0,
//           ),
//         ),
//       ),
//     );
//   }
// }