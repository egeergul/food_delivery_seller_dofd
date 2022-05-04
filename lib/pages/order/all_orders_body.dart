import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/all_orders_controller.dart';
import 'package:food_delivery/controllers/popular%20_product_controller.dart';
import 'package:food_delivery/controllers/recommended_food_controller.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AllOrdersBody extends StatefulWidget {
  const AllOrdersBody({Key? key}) : super(key: key);

  @override
  _AllOrdersBodyState createState() => _AllOrdersBodyState();
}

class _AllOrdersBodyState extends State<AllOrdersBody> {
  var _curPageValue = 0.0;
  var _height = Dimensions.pageViewController;
  PageController pageController = PageController(viewportFraction: 0.85);
  double _scaleFactor = 0.8;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _curPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        //Get.toNamed(RouteHelper.getRecommendedFood(index , "home"));
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
    );
  }


  String formatDate(String date) {
    String formattedDate = "";
    if (date != null){
      formattedDate = DateFormat( 'kk:mm dd/MM/yyyy').format(DateTime.parse(date));
    }
    return formattedDate;
  }
}
