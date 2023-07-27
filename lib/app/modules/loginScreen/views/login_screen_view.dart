import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:picvibe/app/utils/colors.dart';
import 'package:picvibe/app/utils/images.dart';
import 'package:picvibe/app/utils/text.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Image.asset(
                  Images.logo,
                  height: 90,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(TextData.getIn,
                    style: TextStyle(
                        color: AppColors.shadeOrange,
                        fontSize: 24,
                        fontWeight: FontWeight.w800)),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/login_animation.gif",
                  height: 260.0,
                  width: 260.0,
                ),
                // SizedBox(
                //   height: 260,
                //   child: Lottie.asset(Images.loginLottie),
                // ),
                const SizedBox(
                  height: 30,
                ),
                SignInButton(
                  Buttons.google,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  // shape: ,
                  onPressed: controller.handleSignIn,
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                // _nameField(),
                // const SizedBox(
                //   height: 16,
                // ),
                // _passwordField(),
                // const SizedBox(
                //   height: 26,
                // ),
                // RoundedButton(
                //     rad: 30,
                //     text: 'Login',
                //     textColor: AppColors.white,
                //     bgColor: AppColors.shadeOrange,
                //     press: () {
                //       // controller.goToHomePage();
                //     }),

                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _nameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SizedBox(
        height: 42,
        child: TextField(
          controller: controller.userName,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 25),
            hintText: 'Email',
            hintStyle: TextStyle(
                color: AppColors.silverOrange,
                fontSize: 15.2,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400),
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.shadeOrange,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.shadeOrange,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.shadeOrange,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          keyboardType: TextInputType.text,
          style: TextStyle(
              color: AppColors.darkBlack.withOpacity(.7),
              fontSize: 16.2,
              fontWeight: FontWeight.w400),
          onChanged: (value) {},
        ),
      ),
    );
  }

  _passwordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SizedBox(
        height: 42,
        child: TextField(
          obscureText: true,
          controller: controller.password,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 25),
            hintText: 'Password',
            hintStyle: TextStyle(
                color: AppColors.silverOrange,
                fontSize: 15.2,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400),
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.shadeOrange,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.shadeOrange,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.shadeOrange,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          keyboardType: TextInputType.text,
          style: TextStyle(
              color: AppColors.darkBlack.withOpacity(.7),
              fontSize: 16.2,
              fontWeight: FontWeight.w500),
          onChanged: (value) {},
        ),
      ),
    );
  }
}

class RoundedButton extends GetView {
  final String text;
  final Color? color, textColor, bgColor;
  final void Function() press;
  final double rad;
  const RoundedButton(
      {Key? key,
      required this.text,
      this.textColor,
      this.color,
      required this.press,
      this.rad = 10,
      this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: size.width * 0.4,
        height: height * 0.065,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(rad),
            border: Border.all(color: AppColors.shadeOrange, width: 1.8)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: color),
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
