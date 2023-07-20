import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:zesdro/app/utils/colors.dart';
import 'package:zesdro/app/utils/images.dart';
import 'package:zesdro/app/utils/text.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(TextData.login,
                style: TextStyle(
                    color: ProjectColors.richBlack,
                    fontSize: 30,
                    fontWeight: FontWeight.w900)),
            Lottie.asset(Images.loginLottie),
            SignInButton(
              Buttons.google,
              onPressed: controller.handleSignIn,
            ),
            Column(
              children: [
                Image.asset(
                  Images.logo,
                  height: 50,
                ),
                Text(
                  TextData.zesdro,
                  style: TextStyle(color: ProjectColors.richBlack),
                ),
              ],
            ),
            const SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}
