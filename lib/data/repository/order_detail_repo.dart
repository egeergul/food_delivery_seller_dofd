import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class OrderDetailRepo extends GetxService {
  final ApiClient apiClient ;

  OrderDetailRepo({required this.apiClient });


  Future<Response> getOrderDetail( int orderId) async {
    Response r =  await  apiClient.getData('${AppConstants.ORDER_DETAIL}/${orderId}' );
    return r;
  }


}