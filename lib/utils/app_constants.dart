import 'package:theblue_crown/models/language_model.dart';

class AppConstants{
  static const String APP_NAME = "التاج الأزرق";
  static const int APP_VERSION = 1;

  // servers Locally for ios
  // static const String BASE_URL = "http://localhost:8000";
  // static const String BASE_URL = "http://127.0.0.1:8000";

  // servers Locally for android
  // static const String BASE_URL = "http://10.0.2.2:8000"; // For Emulator
  static const String BASE_URL = "http://192.168.1.6:8000"; // For Real Device

  // servers for host
  // static const String BASE_URL = "http://mvs.bslmeiyu.com";

  // Section Grids
  static const String SECTIONSGRIDVIEW_URI = "/api/v1/products/sections-grid-view";

  // SubSection Grids
  static const String VISCOSITYENHANCERSSUBSECTION_URI = "/api/v1/products/viscosity-enhancers-sub-section";
  static const String GRIDVIEWOFGATEGORY_URI = "/api/v1/products/grid-view-of-category";

  // Category Lists
  static const String CATEGORYListVIEW_URI = "/api/v1/products/category-list-view";
  static const String TAYLOSCATEGORYListVIEW_URI = "/api/v1/products/taylos-category-list-view";
  static const String CATEGORYOFTEXAPONListVIEW_URI = "/api/v1/products/category-of-texapon-list-view";

  // Product Grids
  static const String POPULAR_PRODUCT_URI = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URI = "/api/v1/products/recommended";
  static const String EL_MOMTAZ_LABSA_URI = "/api/v1/products/el-momtaz-labsa";
  static const String SUPER_EL_MOMTAZ_LABSA_URI = "/api/v1/products/super-el-momtaz-labsa";
  static const String GALAXY_TEXAPON_URI = "/api/v1/products/galaxy-texpon";
  static const String RENOTEX_TEXAPON_URI = "/api/v1/products/renotex-texpon";
  static const String MALAYSIA_TEXAPON_URI = "/api/v1/products/malaysia-texpon";


  static const String UPLOAD_URL = "/uploads/";

  // user and auth end points
  static const String REGISTRATION_URI = "/api/v1/auth/register";
  static const String LOGIN_URI = "/api/v1/auth/login";
  static const String USER_INFO_URI = "/api/v1/customer/info";

  // new
  static const String USER_ADDRESS = "user_address";
  static const String ADD_USER_ADDRESS = "/api/v1/customer/address/add";
  static const String ADDRESS_LIST_URI = "/api/v1/customer/address/list";

  // config
  static const String GEOCODE_URI = '/api/v1/config/geocode-api';
  static const String ZONE_URI = '/api/v1/config/get-zone-id';
  static const String SEARCH_LOCATION_URI = '/api/v1/config/place-api-autocomplete';
  static const String PLACE_DETAILIS_URI = '/api/v1/config/place-api-details';

  // orders
  static const String PLACE_ORDER_URI = '/api/v1/customer/order/place';
  static const String ORDER_LIST_URI =  '/api/v1/customer/order/list';

  // comments
  static const String GET_ALL_COMMENTS_URI =  '/api/v1/post/comment/get-all-comments/';
  static const String PLACE_COMMENT_URI =  '/api/v1/post/comment/post-comment';
  static const String PLACE_LIKE_URI =  '/api/v1/post/comment/like';
  static const String REPLIES_URI =  '/api/v1/post/comment/comments/';

  static const String TOKEN = "";
  static const String PHONE = "";
  static const String PASSWORD = "";
  static const String CART_LIST = "cart-list";
  static const String CART_HISTORY_LIST = "cart-history-list";

  // static const String TOKEN_URI = '/api/v1/customer/cm-firebase-token';

  // Localization Data
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: "en.png", languageName: 'English',
        countryCode: 'US', languageCode: 'en'
    ),
    LanguageModel(
        imageUrl: "ar.png", languageName: 'Arabic',
        countryCode: 'Eg', languageCode: 'ar'
    ),
  ];

}