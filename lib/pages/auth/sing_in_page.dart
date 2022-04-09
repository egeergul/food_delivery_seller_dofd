import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // app logo
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: AppColors.mainBackgroundColor,
                  radius: Dimensions.height20 * 4,
                  backgroundImage: AssetImage("assets/image/logo_pink.jpg"),
                ),
              ),
            ),

            //welcome
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              child: Column(
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                        fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // email
            AppTextField(
                textController: emailController,
                hintText: "Email",
                icon: Icons.email),
            SizedBox(
              height: Dimensions.height20,
            ),

            // password
            AppTextField(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.lock),
            SizedBox(
              height: Dimensions.height20,
            ),

            RichText(
                text: TextSpan(
                    text: "Sign into your account",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Dimensions.font20))),
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),

            // Sign up button
            Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  color: Colors.white,
                  text: "Sign In",
                  size: Dimensions.font20 + Dimensions.font20 / 2,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),


            // sign up options
            RichText(
                text: TextSpan(
                    text: "Don\'t have an account? ",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                        color: Colors.grey[500]),
                    children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap =()=>Get.to(()=>SignUpPage()),
                    text: "Sign up",
                    style: TextStyle(

                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                        ),
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
