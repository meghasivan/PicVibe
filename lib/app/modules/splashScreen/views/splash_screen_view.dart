import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:picvibe/app/utils/colors.dart';
import 'package:picvibe/app/utils/images.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            return AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.bounceOut,
                height: controller.containerHeight.value,
                child: Center(
                  child: Image.asset(
                    Images.logo,
                  ),
                ));
          }),
        ],
      ),
    );
  }
}
