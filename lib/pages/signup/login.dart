import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/pages/signup/signup.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left:Dimensions.width20*2, right: Dimensions.width20*2),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [



                  Container(
                    margin: EdgeInsets.only(top:Dimensions.height30),
                    height: 220,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [


                        Image.asset("assets/image/logo.jpg",
                          height: 150,),

                        Text(
                          "Login",
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 400,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.password),
                            hintText: "Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(
                                Icons.visibility,
                                color: AppColors.mainColor,
                              ),
                            ),
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),


                        Container(
                            height: 45,
                            width: double.infinity,
                            color: Colors.black,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const MainFoodPage()),
                                );
                              },
                              child: Text("Login"),
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      AppColors.mainColor)),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap:(){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  SignUp()),
                                );
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}