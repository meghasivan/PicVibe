import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_editor_plus/utils.dart';
import 'package:zesdro/app/model/imageFiles.dart';
import 'package:zesdro/app/routes/app_pages.dart';
import 'package:zesdro/app/utils/globalVariables.dart';

class HomeController extends GetxController {
  var images = [].obs;
  @override
  void onInit() {
    super.onInit();
  }

  gotoProfilePage() {
    Get.toNamed(Routes.PROFILE_SCREEN);
  }

  gotoEditorPage() async {
    final editedImage = await Get.to(
        const ImageEditor(),
    );

    if(editedImage != null){
      // can post
      final convertedImage = await ImageUtils.convert(
          editedImage, // <-- Uint8List/path of image
          format: 'jpg',
          quality: 80,
      );
      GlobalVariables.instance.objectbox.addImage(
      ImageFiles(fileData: convertedImage,uid: GlobalVariables.instance.user!.uid));
    }
  }
}
