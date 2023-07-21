import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_editor_plus/utils.dart';
import 'package:zesdro/app/model/imageFiles.dart';
import 'package:zesdro/app/routes/app_pages.dart';
import 'package:zesdro/app/utils/globalVariables.dart';
import 'package:zesdro/app/utils/text.dart';

class ProfileScreenController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  deleteImage(int id){
    GlobalVariables.instance.objectbox.removeImage(id);
  }

  editImage(ImageFiles imageFile) async {
    final editedImage = await Get.to(
        ImageEditor(
          image:imageFile.fileData
        ),
    );

    if(editedImage != null){
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
