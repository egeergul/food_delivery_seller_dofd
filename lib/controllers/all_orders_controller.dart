import 'dart:convert';
import 'package:food_delivery/data/repository/all_orders_repo.dart';
import 'package:food_delivery/models/order_detail_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import '../data/repository/recommended_food_repo.dart';
import '../models/order_model.dart';
import '../models/products_model.dart';
import '../models/response_model.dart';

class AllOrdersController extends GetxController {
  final AllOrdersRepo allOrdersRepo;

  AllOrdersController ({required this.allOrdersRepo});

  List<dynamic> _allOrdersList = [];
  List<dynamic> get allOrdersList => _allOrdersList;

  bool _isLoaded = false;
  bool _isLoading = false;

  bool get isLoaded => _isLoaded;
  bool  get isLoading => _isLoading;

  Future<void> getAllOrdersList() async {
    Response response = await allOrdersRepo.getAllOrdersList();
    if (response.statusCode == 200) {
      print( "got all the orders");
      _allOrdersList = [];
      //_allOrdersList.addAll(OrderModel.fromJson(response.body));
      //Map ourJson = jsonDecode(response.body.toString());
      //print("ORDER LIST = " + response.body.toString());

      response.body.forEach((order) {
        //_allOrdersList.add(OrderModel.fromJson(order));
        //OrderModel orderModel = OrderModel.fromJson(order);
        //print("printing order model: " + order.toString());
        _allOrdersList.add(order);
      });


      List<dynamic> _reversedAllOrdersList = [];
      _reversedAllOrdersList = _allOrdersList.reversed.toList();
      _allOrdersList = _reversedAllOrdersList;

      _isLoaded = true;
      update();
    } else {
      print("App base url is " + AppConstants.BASE_URL );
      print("could not ge t all orders recommended " + response.statusCode.toString());
    }
  }


  Future<ResponseModel>  markAsDelivered (String orderId, DateTime date)  async{

    _isLoading = true;
    update();

    Response response =  await allOrdersRepo.markAsDelivered ( date, orderId);
    ResponseModel responseModel;
    if(response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body.toString());
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoading= false;
    update();
    return responseModel;
  }

}
