import 'package:dofd_driver_panel/pages/address/add_address_page.dart';
import 'package:dofd_driver_panel/pages/address/pick_address_map.dart';
import 'package:dofd_driver_panel/pages/auth/sing_in_page.dart';
import 'package:dofd_driver_panel/pages/food/popular_food_detail.dart';
import 'package:dofd_driver_panel/pages/home/main_food_page.dart';
import 'package:dofd_driver_panel/pages/food/recommended_food_detail.dart';
import 'package:dofd_driver_panel/pages/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../pages/cart/cart_page.dart';
import '../pages/home/home_page.dart';
import '../pages/order/order_detail.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splashPage = "/splash-page";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String orderPage = "/order-page";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";
  static const String addAddress ="/add-address";
  static const String pickAddressMap ="/pick-address";


  static String getInitial() => "$initial";
  static String getSplashPage() => "$splashPage";
  static String getPopularFood(int pageId, String  page ) => "$popularFood?pageId=$pageId&page=$page";
  static String getCartPage() => "$cartPage";
  static String getSignInPage() => "$signIn";
  static String getAddressPage() => "$addAddress";
  static String getPickAddressPage() => "$pickAddressMap";
  static String getRecommendedFood(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";
  static String getOrder(int pageId, String page) =>
      "$orderPage?pageId=$pageId&page=$page";

  static List<GetPage> routes = [
    GetPage(name: pickAddressMap, page: (){
      PickAddressMap _pickAddress =  Get.arguments;
      return _pickAddress;
    }),
    GetPage(name: splashPage, page: ()=>SplashScreen()),
    GetPage(name: initial, page: (){
      return HomePage();
    }, transition: Transition.fade),
    GetPage(name: signIn, page: () => SignInPage(), transition: Transition.fade),

    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters["pageId"];
        var page = Get.parameters["page"];
        return PopularFoodDetail(pageId: int.parse(pageId!), page:page!);
      },
      //transition: Transition.fadeIn
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters["pageId"];
        var page = Get.parameters["page"];
        return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
    ),
    GetPage(
      name: orderPage,
      page: () {
        var pageId = Get.parameters["pageId"];
        var page = Get.parameters["page"];
        return OrderDetail(pageId: int.parse(pageId!), page: page!);
      },
    ),

    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        //transition: Trasition.fadeIn,
        ),
    GetPage(name: addAddress, page: (){
      return AddAddressPage();
    })
  ];
}

class Trasition {}
