import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular%20_product_controller.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/pages/signup/signup.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import "package:get/get.dart";
import 'controllers/recommended_food_controller.dart';
import 'helper/dependencies.dart' as dep;

// ege branch için bir şey deniyor
void main() async   {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',

          initialRoute:   RouteHelper.getSplashPage(),  //SIGNUP() ÇEVİR
          //initialRoute: RouteHelper.getInitial() ,
          getPages: RouteHelper.routes ,
        );

      });
    });
  }
}
