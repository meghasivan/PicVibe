import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picvibe/app/model/userModel.dart';
import 'package:picvibe/app/routes/app_pages.dart';
import 'package:picvibe/app/utils/globalVariables.dart';
import 'package:picvibe/app/utils/text.dart';

class SplashScreenController extends GetxController {
  RxDouble containerHeight = (0.0).obs;

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 1), () {
      containerHeight(150);
    });
    Timer(const Duration(seconds: 5), () {
      try {
        var data = GetStorage().read(TextData.user);
        GlobalVariables.instance.user = UserModel.fromMap(data);
      } catch (e) {
        log("Error on Fetching User Data");
      }

      if (GlobalVariables.instance.user != null) {
        GlobalVariables.instance.googleSignIn.signInSilently();
        Get.offNamed(Routes.HOME);
      } else {
        Get.offNamed(Routes.LOGIN_SCREEN);
      }
    });
  }
}
