import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'all_orders_body.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({Key? key}) : super(key: key);

  @override
  _AllOrdersState createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  Future<void> _loadResources() async {
    await Get.find<AllOrdersController>().getAllOrdersList();
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
                  child: AllOrdersBody(),
            ))
          ],
        ),
        onRefresh: _loadResources);
  }


}
