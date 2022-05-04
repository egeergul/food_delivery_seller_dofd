import 'package:food_delivery/data/repository/all_orders_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import '../data/repository/recommended_food_repo.dart';
import '../models/products_model.dart';

class AllOrdersController extends GetxController {
  final AllOrdersRepo allOrdersRepo;



  AllOrdersController ({required this.allOrdersRepo});

  List<dynamic> _allOrdersList = [];

  List<dynamic> get allOrdersList => _allOrdersList;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  Future<void> getAllOrdersList() async {
    Response response = await allOrdersRepo.getAllOrdersList();
    if (response.statusCode == 200) {
      print("EGEEE ALL ORDERS ");
      _allOrdersList = [];
      _allOrdersList  .addAll(Order.fromJson(response.body).products);
      //_recommendedProductList  .addAll(Product.fromJson(data).products);

      _isLoaded = true;

      update();
    } else {
      print("App base url is " + AppConstants.BASE_URL );
      print("could not ge t all orders recommended ");
    }
  }
}
