import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zesdro/app/utils/colors.dart';
import 'package:zesdro/app/utils/images.dart';
import 'package:zesdro/app/utils/text.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,
            width: Get.width,
          ),
          Obx(() {
              return AnimatedContainer(
                duration: const Duration(seconds: 2),
                height: controller.containerHeight.value,  
                child: Image.asset(Images.logo,height: 150,));
            }
          ),
          SizedBox(
            width: Get.width,
            height: 100,
            child: Column(children: [
              Text(TextData.zesdro,style: TextStyle(color: ProjectColors.richBlack),),
              Text(TextData.version,style: TextStyle(color: ProjectColors.richBlack),),
            ]),
          ),
        ],
      ),
    );
  }
}
