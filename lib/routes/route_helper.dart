import 'package:get/get.dart';
import 'package:theblue_crown/controllers/cart_controller.dart';
import 'package:theblue_crown/controllers/language_controller.dart';
import 'package:theblue_crown/models/order_model.dart';
import 'package:theblue_crown/models/products_model.dart';
import 'package:theblue_crown/pages/address/add_address_page.dart';
import 'package:theblue_crown/pages/auth/sign_in_page.dart';
import 'package:theblue_crown/pages/cart/cart_page.dart';
import 'package:theblue_crown/pages/home/comment_page.dart';
import 'package:theblue_crown/pages/home/details/details_view.dart';
import 'package:theblue_crown/pages/home/home_view.dart';
import 'package:theblue_crown/pages/home/details/recommended_details.dart';
import 'package:theblue_crown/pages/payment/payment_page.dart';
import 'package:theblue_crown/pages/splash/splash_page.dart';
import '../pages/address/pick_address_map.dart';
import '../pages/home/company_or_factory_file/company_or_factory_view.dart';
import '../pages/home/details/details_screen.dart';
import '../pages/home/reply_page.dart';
import '../pages/home/sub_sections/company_or_factory_view2.dart';
import '../pages/home/details/elmomtaz_labsa_details.dart';
import '../pages/home/details/galaxy_texpon_details.dart';
import '../pages/home/details/malaysia_texpon_details.dart';
import '../pages/home/details/renotex_texpon_details.dart';
import '../pages/home/details/super_elmomtaz_labsa_details.dart';
import '../pages/home/details_view3.dart';
import '../pages/language/language_view.dart';
import '../pages/payment/order_success_page.dart';

class RouteHelper{
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String language = "/language";

  static const String companyOrFactoryView = "/company-or-factory-view";
  static const String companyOrFactoryView2 = "/company-or-factory-view-2";

  // Section Grid
  static const String sectionsGridViewFood = "/sections-grid-view-food";

  // SubSection Grids
  static const String viscosityEnhancersSubSectionFood = "/viscosity-enhancers-sub-section-food";
  static const String gridViewOfCategoryFood = "/grid-view-of-category-food";

  // Category Lists
  static const String categoryListViewFood = "/category-list-view-food";
  static const String categoryOfTexaponListViewFood = "/category-of-texapon-list-view-food";
  static const String taylosCategoryListView = "/taylos-category-list-view";

  // Product Grids
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String elMomtazLabsaFood = "/el-momtaz-labsa-food";
  static const String superElMomtazLabsaFood = "/super-el-momtaz-labsa";
  static const String galaxyTexponFood = "/galaxy-texpon";
  static const String renotexTexponFood = "/renotex-texpon";
  static const String malaysiaTexponFood = "/malaysia-texpon";
  static const String detailsScreen = "/details-screen";
  static const String replyPage = "/reply-page";

  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";
  static const String addAddress = "/add-address";
  static const String pickAddressMap = "/pick-address";
  static const String payment = '/payment';
  static const String orderSuccess = '/order-successful';
  static const String posts = '/posts';
  static const String replies = '/replies';


  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getLanguageRoute() => '$language';
  static String getCompanyOrFactoryView(int pageId) => '$companyOrFactoryView?pageId=$pageId';
  static String getCompanyOrFactoryView2(int pageId) => '$companyOrFactoryView2?pageId=$pageId';
  static String getGridViewOfCategoryFood(int pageId, String page) => '$gridViewOfCategoryFood?pageId=$pageId&page=$page';
  static String getSectionsGridViewFood(int pageId, String page) => '$sectionsGridViewFood?pageId=$pageId&page=$page';
  static String getViscosityEnhancersSubSectionFood(int pageId, String page) => '$viscosityEnhancersSubSectionFood?pageId=$pageId&page=$page';
  static String getCategoryListViewFood(int pageId, String page) => '$categoryListViewFood?pageId=$pageId&page=$page';
  static String getCategoryOfTexaponListViewFood(int pageId, String page) => '$categoryOfTexaponListViewFood?pageId=$pageId&page=$page';
  static String getTaylosCategoryListView(int pageId, String page) => '$taylosCategoryListView?pageId=$pageId&page=$page';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getPosts() => '$posts';
  static String getReplies(var currentPost, int index) => '$replies?currentPost=$currentPost&index=$index';
  // static String getElMomtazLabsaFood(int pageId, String page, String image) => '$elMomtazLabsaFood?pageId=$pageId&page=$page&image=$image';
  // static String getSuperElMomtazLabsaFood(int pageId, String page) => '$superElMomtazLabsaFood?pageId=$pageId&page=$page';
  static String getGalaxyTexaponFood(int pageId, String page) => '$galaxyTexponFood?pageId=$pageId&page=$page';
  // static String getRenotexTexaponFood(int pageId, String page) => '$renotexTexponFood?pageId=$pageId&page=$page';
  // static String getMalaysiaTexaponFood(int pageId, String page) => '$malaysiaTexponFood?pageId=$pageId&page=$page';
  static String getCartPage () => '$cartPage';
  static String getSignInPage () => '$signIn';
  static String getAddAddressPage () => '$addAddress';
  static String getPickAddressPage () => '$pickAddressMap';
  static String getPaymentPage (String id, int userID) => '$payment?id=$id&userID=$userID';
  static String getOrderSuccessPage (String orderID, String status) => '$orderSuccess?id=$orderID&status=$status';
  static String getDetailsScreen () => '$detailsScreen';
  static String getReplyPage () => '$replyPage';
  // static String getDetailsScreen(
  //     int pageId,
  //     ProductModel product,
  //     CartController cart,
  //     LocalizationController localization,
  //     Object subController,
  //     Object subControllersList,
  //     String image,
  //     ) => '$detailsScreen?'
  //     'pageId=$pageId&'
  //     'product=$product&'
  //     'cart=$cart&'
  //     'localization=$localization&'
  //     'subController=$subController&'
  //     'subControllersList=$subControllersList&'
  //     'image=$image';

  static List<GetPage> routes = [
    GetPage(
      name: pickAddressMap,
      page: () {
        PickAddressMap _pickAddress = Get.arguments;
        print("going to a new page");
        return _pickAddress;
      },
    ),
    GetPage(
        name: splashPage,
        page: () => const SplashScreen(),
    ),
    GetPage(
      name: initial,
      page: (){
        return const HomeView();
        },
        transition: Transition.fadeIn
      ),
    GetPage(
      name: language,
      page: () => const LanguageView(),
    ),
    GetPage(
        name: posts,
        page: (){
          var pageId = Get.parameters['pageId'];
          return CommentPage(productId: 22,);
        },
        transition: Transition.fadeIn
    ),
    // GetPage(
    //     name: replies,
    //     page: (){
    //       var currentPost = Get.parameters['currentPost'];
    //       var index = Get.parameters['index'];
    //       return ReplyPage(currentPost: currentPost, index: int.parse(index!), repliesController: null,);
    //     },
    //     transition: Transition.fadeIn
    // ),
    GetPage(
        name: companyOrFactoryView,
        page: (){
          var pageId = Get.parameters['pageId'];
          return CompanyOrFactoryView(pageId : int.parse(pageId!));
        },
        transition: Transition.fadeIn
    ),
    GetPage(
        name: companyOrFactoryView2,
        page: (){
          var pageId = Get.parameters['pageId'];
          return CompanyOrFactoryView2(pageId : int.parse(pageId!));
        },
        transition: Transition.fadeIn
    ),

    GetPage(
      name: signIn,
      page: (){return const SignInPage();},
      transition: Transition.fade,
    ),

    GetPage(
        name: gridViewOfCategoryFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return CompanyOrFactoryView(pageId : int.parse(pageId!));
        },
        transition: Transition.fadeIn
    ),

    GetPage(
        name: sectionsGridViewFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedDetails(pageId : int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn
    ),

    GetPage(
        name: viscosityEnhancersSubSectionFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return CompanyOrFactoryView(pageId : int.parse(pageId!));
        },
        transition: Transition.fadeIn
    ),

    GetPage(
        name: categoryListViewFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedDetails(pageId : int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn
    ),
    GetPage(
        name: categoryOfTexaponListViewFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedDetails(pageId : int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn
    ),

    GetPage(
        name: taylosCategoryListView,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedDetails(pageId : int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn
    ),

    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return DetailsView(pageId : int.parse(pageId!), page: page!);
        // return ProductScreen(pageId : int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn
    ),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedDetails(pageId : int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn
    ),
    GetPage(
        name: replyPage,
        page: () {
          ReplyPage _replyPage = Get.arguments;
          print("going to a new page");
          return _replyPage;
        },
        transition: Transition.fadeIn
    ),

    // GetPage(
    //   name: pickAddressMap,
    //   page: () {
    //     PickAddressMap _pickAddress = Get.arguments;
    //     print("going to a new page");
    //     return _pickAddress;
    //   },
    // ),
    GetPage(
      name: detailsScreen,
      page: () {
        DetailsScreen _detailsScreen = Get.arguments;
        print("going to a new page");
        return _detailsScreen;
      },
    ),
    // GetPage(
    //     name: detailsScreen,
    //     page: () {
    //       var pageId = Get.parameters['pageId'];
    //       var product = Get.parameters['product'];
    //       var cart = Get.parameters['cart'];
    //       var localization = Get.parameters['localization'];
    //       var subController = Get.parameters['subController'];
    //       var subControllersList = Get.parameters['subControllersList'];
    //       var image = Get.parameters['image'];
    //       return DetailsScreen(
    //         pageId : int.parse(pageId!),
    //         product: product,
    //         cart: cart,
    //         localization: localization,
    //         subController: subController,
    //         subControllersList: subControllersList,
    //         image: image!,
    //       );
    //     },
    //     transition: Transition.fadeIn
    // ),

    // GetPage(
    //     name: elMomtazLabsaFood,
    //     page: () {
    //       var pageId = Get.parameters['pageId'];
    //       var page = Get.parameters['page'];
    //       var image = Get.parameters['image'];
    //       return ElMomtazLabsaDetails(pageId : int.parse(pageId!), page: page!, image: image!,);
    //       // return ProductScreen(pageId : int.parse(pageId!), page: page!);
    //     },
    //     transition: Transition.fadeIn
    // ),
    // GetPage(
    //     name: superElMomtazLabsaFood,
    //     page: () {
    //       var pageId = Get.parameters['pageId'];
    //       var page = Get.parameters['page'];
    //       return SuperElMomtazLabsaDetails(pageId : int.parse(pageId!), page: page!);
    //       // return ProductScreen(pageId : int.parse(pageId!), page: page!);
    //     },
    //     transition: Transition.fadeIn
    // ),
    GetPage(
        name: galaxyTexponFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return GalaxyTexponDetails(pageId : int.parse(pageId!), page: page!);
          // return ProductScreen(pageId : int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn
    ),
    // GetPage(
    //     name: renotexTexponFood,
    //     page: () {
    //       var pageId = Get.parameters['pageId'];
    //       var page = Get.parameters['page'];
    //       return RenotexTexponDetails(pageId : int.parse(pageId!), page: page!);
    //       // return ProductScreen(pageId : int.parse(pageId!), page: page!);
    //     },
    //     transition: Transition.fadeIn
    // ),
    // GetPage(
    //     name: malaysiaTexponFood,
    //     page: () {
    //       var pageId = Get.parameters['pageId'];
    //       var page = Get.parameters['page'];
    //       return MalaysiaTexponDetails(pageId : int.parse(pageId!), page: page!);
    //       // return ProductScreen(pageId : int.parse(pageId!), page: page!);
    //     },
    //     transition: Transition.fadeIn
    // ),

    GetPage(
        name: cartPage,
        page: () {return const CartPage();},
        transition: Transition.fadeIn
    ),

    GetPage(name: addAddress, page: () {
      return AddAddressPage();
      },
    ),

    GetPage(
        name: payment,
        page: () => PaymentPage(
          orderModel: OrderModel(
              id: int.parse(Get.parameters['id']!),
              userId: int.parse(Get.parameters['userID']!),
          ),
        ),
    ),

    GetPage(
        name: orderSuccess,
        page: () => OrderSuccessPage(
          orderID: Get.parameters['id']!,
          status: Get.parameters["status"].toString().contains("success") ? 1 : 0,
        ),
    ),
  ];
}