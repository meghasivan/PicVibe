import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_editor_plus/utils.dart';
import 'package:picvibe/app/model/imageFiles.dart';
import 'package:picvibe/app/routes/app_pages.dart';
import 'package:picvibe/app/utils/globalVariables.dart';
import 'package:picvibe/app/utils/text.dart';

class ProfileScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  int selectedIndex = 2;
  navigatedBottombar(int index) {
    selectedIndex = index;
    if (selectedIndex == 0) {
      Get.back();
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

  deleteImage(int id) {
    GlobalVariables.instance.objectbox.removeImage(id);
  }

  editImage(ImageFiles imageFile) async {
    final editedImage = await Get.to(
      ImageEditor(image: imageFile.fileData),
    );

    if (editedImage != null) {
      final convertedImage = await ImageUtils.convert(
        editedImage, // <-- Uint8List/path of image
        format: 'jpg',
        quality: 80,
      );
      imageFile.fileData = convertedImage;
      GlobalVariables.instance.objectbox.updateImage(imageFile);
    }
  }

  logout() async {
    GetStorage().write(TextData.user, null);
    await GlobalVariables.instance.googleSignIn.signOut();
    Get.offNamed(Routes.LOGIN_SCREEN);
  }
}
