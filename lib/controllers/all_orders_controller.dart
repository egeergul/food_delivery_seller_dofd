import 'package:food_delivery/data/repository/all_orders_repo.dart';
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
      _allOrdersList.addAll(Order.fromJson(response.body).orders);
      _isLoaded = true;
      update();
    } else {
      print("App base url is " + AppConstants.BASE_URL );
      print("could not ge t all orders recommended ");
    }
  }

  /*Future<ResponseModel> login (String email, String password) async {

    _isLoading = true;
    update();
    Response response =  await authRepo.login(email, password);
    ResponseModel responseModel;
    if(response.statusCode == 200) {
      //print("Backend token ");

      authRepo.saveUserToken(response.body["token"]);
      print("My token is " + response.body["token"]);

      //print(response.body["token"].toString());
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      //print("BACKENDDEN RESPONSE GELMEDI");
      //print(response.statusCode);
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading= false;
    update();
    return responseModel;
  }*/

  Future<ResponseModel>  markAsDelivered (String orderId, DateTime date)  async{

    _isLoading = true;
    update();

    print("date is " + date.toString());

    Response response =  await allOrdersRepo.markAsDelivered ( orderId, date);
    ResponseModel responseModel;
    if(response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }




    _isLoading= false;
    update();
    return responseModel;
  }

}
