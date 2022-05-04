import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/account/account_page.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/pages/cart/cart_history.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/pages/order/all_orders.dart';
import 'package:food_delivery/utils/colors.dart';

import '../auth/sing_in_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages =[
    AllOrders(),
    MainFoodPage(),

    //SignInPage(),
    CartHistory(),
    AccountPage( ),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.mainColorTransparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        onTap: onTapNav,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: "all orders",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive,),
              label: "archinve",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,),
            label: "cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,),
            label: "me",
          ),
        ],
      ),
    );
  }
}
