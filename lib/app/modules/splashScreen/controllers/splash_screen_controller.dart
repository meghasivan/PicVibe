import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zesdro/app/model/userModel.dart';
import 'package:zesdro/app/routes/app_pages.dart';
import 'package:zesdro/app/utils/globalVariables.dart';
import 'package:zesdro/app/utils/text.dart';

class SplashScreenController extends GetxController {
  
  /// To handle Container Height
  RxDouble containerHeight = (0.0).obs;

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 1),(){
      containerHeight(150);
    });
    Timer(const Duration(seconds: 5),(){
      try{
        var data = GetStorage().read(TextData.user);
        GlobalVariables.instance.user = UserModel.fromMap(data);
      }catch(e){
        log("Error on Fetching User Data");
      }
      
      if(GlobalVariables.instance.user != null){
        Get.offNamed(Routes.HOME);
      }else{
        Get.offNamed(Routes.LOGIN_SCREEN);
      }
    });
  }

  
}
