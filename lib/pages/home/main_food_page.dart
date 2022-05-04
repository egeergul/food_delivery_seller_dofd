import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/all_orders_controller.dart';
import '../../controllers/popular _product_controller.dart';
import '../../controllers/recommended_food_controller.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {

  Future <void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
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
                  children: [
                    BigText(text: "U.S.A", color: AppColors.mainColor, size: 30, ),
                    Row(
                      children: [
                        SmallText(text: "Virginia", color: Colors.black54,),
                        Icon(Icons.arrow_drop_down_rounded),
                      ],
                    ),

                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24, ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: SingleChildScrollView(
          child: FoodPageBody( ),
        ))
      ],
    ),

        onRefresh: _loadResources);
  }
}
