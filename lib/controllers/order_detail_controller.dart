import 'dart:convert';

import 'package:food_delivery/data/repository/all_orders_repo.dart';
import 'package:food_delivery/models/order_detail_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
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
      _isDetailsLoaded = true;
      update();

    }
    else {
      print("get order detail else");
      print(response.body.toString());
    }


  }


}
