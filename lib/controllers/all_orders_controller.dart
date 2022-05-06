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

  List<dynamic> _orderDetailsList = [];
  List<dynamic> get orderDetailsList => _orderDetailsList;
  bool _isDetailsLoaded = false;
  bool get isDetailsLoaded => _isDetailsLoaded;

  Future<void> getAllOrdersList() async {
    Response response = await allOrdersRepo.getAllOrdersList();
    if (response.statusCode == 200) {
      print( "got all the orders");
      _allOrdersList = [];
      _allOrdersList.addAll(Order.fromJson(response.body).orders);
      _isLoaded = true;
      update();
    } else {
      print("App base url is " + AppConstants.BASE_URL );
      print("could not ge t all orders recommended ");
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

  Future<void> getOrderDetail (int orderId) async{

    print("getOrderDetail e geldi: " + orderId.toString());


    Response response =  await allOrdersRepo.getOrderDetail (orderId);
    if(response.statusCode == 200) {
      _orderDetailsList = [];
      _orderDetailsList.addAll(OrderDetail.fromJson(response.body).orderDetails);
      _isDetailsLoaded = true;
      update();
    }
    else {
      print("get order detail else");
      print(response.body.toString());
    }


  }


}
