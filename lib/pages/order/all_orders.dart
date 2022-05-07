import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/order_detail_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../controllers/all_orders_controller.dart';
import '../../controllers/popular _product_controller.dart';
import '../../controllers/recommended_food_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';
import '../home/food_page_body.dart';


class AllOrders extends StatefulWidget {
  const AllOrders({Key? key}) : super(key: key);

  @override
  _AllOrdersState createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  Future<void> _loadResources() async {
    await Get.find<AllOrdersController>().getAllOrdersList();
  }

  Future <void> _loadDetails(int orderId, int index) async {
    await Get.find<OrderDetailController>().getOrderDetail(orderId);
    Get.toNamed(RouteHelper.getOrder(index , "home"));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Column(
          children: [
            Container(
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigText(
                          text: "ALL ORDERS PAGE",
                          color: AppColors.mainColor,
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                  child:  Column(
                    children: [
                      // recommended food
                      GetBuilder<AllOrdersController>(builder: (allOrders) {
                        return allOrders.isLoaded
                            ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: allOrders.allOrdersList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  _loadDetails(allOrders
                                      .allOrdersList[index]
                                      .id, index);

                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.width20,
                                      right: Dimensions.width20,
                                      bottom: Dimensions.width10),

                                  child: Container(
                                      height: Dimensions.listViewTextContSize2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(Dimensions.radius20),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 7), // changes position of shadow
                                          ),
                                        ],


                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: Dimensions.width10 * 2,
                                            right: Dimensions.width10),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                BigText(
                                                    text: allOrders
                                                        .allOrdersList[index]
                                                        .delivered ==
                                                        null
                                                        ? "Not delivered"
                                                        : "Delivered"),
                                                SizedBox(
                                                  width: Dimensions.width10,
                                                ),
                                                BigText(
                                                    overflow: TextOverflow.ellipsis,
                                                    size: Dimensions.font16,
                                                    text: formatDate(allOrders
                                                        .allOrdersList[index]
                                                        .createdAt
                                                        .toString())),
                                              ],
                                            ),

                                            SizedBox(
                                              height: Dimensions.height10,
                                            ),

                                            // Contact name
                                            SmallText(
                                                text: allOrders
                                                    .allOrdersList[index]
                                                    .deliveryAddress!
                                                    .contactPersonName!
                                                    .toString()),
                                            //contact address
                                            SmallText(
                                                text: allOrders
                                                    .allOrdersList[index]
                                                    .deliveryAddress!
                                                    .contactPersonNumber!
                                                    .toString()),
                                            //address
                                            SmallText(
                                                text: allOrders.allOrdersList[index]
                                                    .deliveryAddress!.address!
                                                    .toString()),
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            })
                            : CircularProgressIndicator(
                          color: AppColors.mainColor,
                        );
                      }),
                    ],
                  ),
            ))
          ],
        ),
        onRefresh: _loadResources);
  }

  String formatDate(String date) {
    String formattedDate = "";
    if (date != null){
      formattedDate = DateFormat( 'kk:mm dd/MM/yyyy').format(DateTime.parse(date));
    }
    return formattedDate;
  }
}
