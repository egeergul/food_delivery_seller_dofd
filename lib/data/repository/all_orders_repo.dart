import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class AllOrdersRepo extends GetxService {
  final ApiClient apiClient ;

  AllOrdersRepo({required this.apiClient });

  Future<Response> getAllOrdersList()  async{
    return await  apiClient.getData( AppConstants.ALL_ORDERS_URI);
  }


  Future<Response> markAsDelivered( String orderId,DateTime date) async {
    //TODO
    return await  apiClient.patchData(AppConstants.ALL_ORDERS_UPDATE + "/${orderId}", {"delivered": date});
  }
}