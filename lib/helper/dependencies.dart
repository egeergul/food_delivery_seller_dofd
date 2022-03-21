import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular%20_product_controller.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart' ;
import '../controllers/recommended_food_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/recommended_food_repo.dart';

Future<void> init( ) async{
  Get.lazyPut( ()=> ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // repos
  Get.lazyPut(() =>  PopularProductRepo(apiClient: Get.find( )));
  Get.lazyPut(() =>   RecommendedProductRepo(apiClient: Get.find( )));
  Get.lazyPut(() => CartRepo());

  // controllers
  Get.lazyPut(() =>  PopularProductController(  popularProductRepo : Get.find( )));
  Get.lazyPut(() =>  RecommendedProductController(  recommendedProductRepo : Get.find( )));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));


}