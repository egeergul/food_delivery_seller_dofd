import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/all_orders_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular%20_product_controller.dart';
import 'package:food_delivery/controllers/recommended_food_controller.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../base/custom_loader.dart';
import '../../base/show_custom_snackbar.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class OrderDetail extends StatefulWidget {
  final int pageId;
  final String page;
  const OrderDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState(pageId , page);
}
class _OrderDetailState extends State<OrderDetail> {

  final int pageId;
  final String page;
  _OrderDetailState(this.pageId, this.page);




  @override
  Widget build(BuildContext context) {

    var product = Get.find<AllOrdersController>().allOrdersList[pageId];
    //Get.find<AllOrdersController>().getOrderDetail(product.id);

    void _markAsDelivered(AllOrdersController ordersController) {
      ordersController.markAsDelivered( product.id.toString(),DateTime.now()).then((status){
        if (status.isSuccess) {
          Get.toNamed(RouteHelper.getInitial());
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }

      return  Scaffold(
        backgroundColor: AppColors.mainBackgroundColor,

        body: GetBuilder<AllOrdersController>(builder: (orderController){
          return !orderController.isLoading? Column(
        children: [
          // header
          Container(
            height: Dimensions.height20 * 5,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height15 * 3),
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15,
                  right: Dimensions.width15,
                  bottom: Dimensions.height15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (page == "cartpage") {
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: AppIcon(icon: Icons.clear)),
                  BigText(
                    size: Dimensions.font26,
                    text: product.delivered == null
                        ? "Not Delivered"
                        : "Delivered",
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),

          //body
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimensions.height20),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(size: Dimensions.font16*2,text: "Contact Details"),
                    SizedBox(height: Dimensions.height15),

                    BigText(
                        text:
                        product.deliveryAddress!.contactPersonName == null
                            ? "Name unknown"
                            : product.deliveryAddress!.contactPersonName
                            .toString()),
                    SizedBox(height: Dimensions.height10),
                    BigText(text: product.deliveryAddress!.contactPersonNumber == null
                        ? "Phone unknown"
                        : product.deliveryAddress!.contactPersonNumber
                        .toString(),),
                    SizedBox(height: Dimensions.height10),
                    BigText(text:
                    product.deliveryAddress!.address!
                        .toString(),),


                    SizedBox(height: Dimensions.height30),

                    BigText(size: Dimensions.font16*2,text: "Order Details"),
                    SizedBox(height: Dimensions.height15),

                    BigText(text: formatDate(product.createdAt!.toString()),),
                    SizedBox(height: Dimensions.height10),
                    BigText(text: "\$" + product.orderAmount!.toString() ),
                    SizedBox(height: Dimensions.height10),

                    Container(
                      height: Dimensions.screenHeight/3.4,
                      child: Text("todo"),

















                      color: Colors.red,
                    ),

                    SizedBox(height: Dimensions.height20),
                    GestureDetector(
                      onTap: () {
                        product.delivered == null ?
                        _markAsDelivered(orderController):
                        showCustomSnackBar("This order is already delivered!");

                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            right: Dimensions.width20,
                            left: Dimensions.width20),
                        child: Center(
                          child: BigText(
                            text: product.delivered == null ?"Mark as delivered": "Already delivered",
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),
          )
        ],
      ): CustomLoader();
        })
    );

  }

  String formatDate(String date) {
    String formattedDate = "";
    if (date != null){
      formattedDate = DateFormat( 'kk:mm - dd/MM/yyyy').format(DateTime.parse(date));
    }
    return formattedDate;
  }
}
