import 'dart:convert';

import 'package:dofd_driver_panel/data/repository/all_orders_repo.dart';
import 'package:dofd_driver_panel/models/order_detail_model.dart';
import 'package:dofd_driver_panel/utils/app_constants.dart';
import 'package:get/get.dart';
import '../data/repository/recommended_food_repo.dart';
import '../models/order_model.dart';
import '../models/products_model.dart';
import '../models/response_model.dart';

class OrderDetailController extends GetxController {
  final AllOrdersRepo orderDetailRepo;

  OrderDetailController ({required this.orderDetailRepo});

  List<dynamic> _orderDetailsList = [];
  List<dynamic> get orderDetailsList => _orderDetailsList;
  bool _isDetailsLoaded = false;
  bool get isDetailsLoaded => _isDetailsLoaded;

  Future<void> getOrderDetail (int orderId) async{
    Response response =  await orderDetailRepo.getOrderDetail (orderId);
    if(response.statusCode == 200) {
      _orderDetailsList = [];
      _orderDetailsList.addAll(OrderDetail.fromJson(response.body).orderDetails);
      print("printing the list");
      _isDetailsLoaded = true;
      update();

      for(int i = 0; i < _orderDetailsList.length; i++){
        print(i.toString()+"th index ="+_orderDetailsList[i].foodDetails!.toString());
      }

    }
    else {
      print("get order detail else");
      print(response.body.toString());
    }


  }


  Future<void> getProductDetail (int productId) async{
    Response response =  await orderDetailRepo.getProductDetail (productId);
    if(response.statusCode == 200) {
      _orderDetailsList = [];
      _orderDetailsList.addAll(OrderDetail.fromJson(response.body).orderDetails);
      print("printing the list");
      _isDetailsLoaded = true;
      update();

    }
    else {
      print("get order detail else");
      print(response.body.toString());
    }


  }


}
