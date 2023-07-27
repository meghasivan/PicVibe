import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_editor_plus/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:picvibe/app/utils/colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:picvibe/app/model/imageFiles.dart';
import 'package:picvibe/app/routes/app_pages.dart';
import 'package:picvibe/app/utils/globalVariables.dart';

class HomeController extends GetxController {
  var images = [].obs;
  int selectedIndex = 0;
  RxBool liked = false.obs;
  @override
  void onInit() {
    selectedIndex = 0;
    super.onInit();
  }

  likedPic() {
    liked.value = !liked.value;
  }

  navigatedBottombar(int index) {
    selectedIndex = index;
    if (selectedIndex == 0) {
      Get.toNamed(Routes.HOME);
    }
    if (selectedIndex == 1) {
      gotoEditorPage()?.then((value) => () {
            selectedIndex = 0;
          });
    }
    if (selectedIndex == 2) {
      Get.toNamed(Routes.PROFILE_SCREEN)?.then((value) => () {
            selectedIndex = 0;
          });
    }
  }

  gotoProfilePage() {
    Get.toNamed(Routes.PROFILE_SCREEN);
  }

  gotoEditorPage() async {
    final editedImage = await Get.to(
      const ImageEditor(),
    );

    if (editedImage != null) {
      // can post
      final convertedImage = await ImageUtils.convert(
        editedImage, // <-- Uint8List/path of image
        format: 'jpg',
        quality: 80,
      );
      GlobalVariables.instance.objectbox.addImage(ImageFiles(
          fileData: convertedImage, uid: GlobalVariables.instance.user!.uid));
    }
  }

  downloadFile(ImageFiles imageFiles) async {
    final Directory directory = Platform.isAndroid
        ? Directory('/storage/emulated/0/Download')
        : await getApplicationDocumentsDirectory();

    final File file = File('${directory.path}/image-${imageFiles.id}.jpg');
    await file.writeAsBytes(imageFiles.fileData);
    Get.snackbar("Success!",
        "Downloaded on '${directory.path}/image-${imageFiles.id}.jpg'",
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppColors.white.withOpacity(0.9),
        backgroundColor: AppColors.shadeOrange.withOpacity(0.9));
  }

  shareIt(ImageFiles imageFiles) async {
    final Directory? directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    if (directory != null) {
      final File file = File('${directory.path}/image-${imageFiles.id}.jpg');
      await file.writeAsBytes(imageFiles.fileData);
      Share.shareFiles(['${directory.path}/image-${imageFiles.id}.jpg'],
          text: 'Picture from picvibe');
      file.delete();
    }
  }
}
