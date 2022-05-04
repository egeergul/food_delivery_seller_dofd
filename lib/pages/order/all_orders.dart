import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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

  Future <void> _loadResources() async {
    await Get.find<AllOrdersController>().getAllOrdersList();
  }


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Column(
          children: [
            Container(
              child: Container(
                margin: EdgeInsets.only(top:Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigText(text: "ALL ORDERS PAGE", color: AppColors.mainColor, size: 30, ),


                      ],
                    ),

                  ],
                ),
              ),
            ),
            Expanded(child: SingleChildScrollView(
              child: Column(
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
                              child: Row(
                                children: [
                                  // image
                                  Container(
                                    height: Dimensions.listViewImgSize,
                                    width: Dimensions.listViewImgSize,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(Dimensions.radius20),
                                      color: Colors.white38,
                                    ),
                                  ),

                                  // text
                                  Expanded(
                                    child: Container(
                                        height: Dimensions.listViewTextContSize,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight:
                                            Radius.circular(Dimensions.radius20),
                                            bottomRight:
                                            Radius.circular(Dimensions.radius20),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: Dimensions.width10,
                                              right: Dimensions.width10),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              BigText(
                                                text: allOrders
                                                    .allOrdersList[index]
                                                    .orderAmount!.toString(),
                                              ),
                                              SizedBox(
                                                height: Dimensions.height10,
                                              ),
                                              SmallText(
                                                  text:
                                                  "With Chinese charatceristics"),
                                              SizedBox(
                                                height: Dimensions.height10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  IconAndTextWidget(
                                                      icon: Icons.circle_sharp,
                                                      text: "Normal",
                                                      iconColor:
                                                      AppColors.iconColor1),
                                                  IconAndTextWidget(
                                                      icon: Icons.location_on,
                                                      text: "1.7 km",
                                                      iconColor: AppColors.mainColor),
                                                  IconAndTextWidget(
                                                      icon: Icons.access_time_rounded,
                                                      text: "32 min",
                                                      iconColor:
                                                      AppColors.iconColor2),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  )
                                ],
                              ),
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
}
