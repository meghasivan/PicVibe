import 'dart:io';
import 'package:get/get.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_editor_plus/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
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

  downloadFile(ImageFiles imageFiles) async {
    final Directory directory = Platform.isAndroid ? Directory('/storage/emulated/0/Download') : await getApplicationDocumentsDirectory();

      final File file = File('${directory.path}/image-${imageFiles.id}.jpg');
      await file.writeAsBytes(imageFiles.fileData);
       Get.snackbar(
                      "Downloaded on '${directory.path}/image-${imageFiles.id}.jpg'",
                      "",
                      snackPosition: SnackPosition.BOTTOM
                  );
    
  }

  shareIt(ImageFiles imageFiles)async{
    final Directory? directory = Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();
    if(directory!= null){
      final File file = File('${directory.path}/image-${imageFiles.id}.jpg');
      await file.writeAsBytes(imageFiles.fileData);
      Share.shareFiles(['${directory.path}/image-${imageFiles.id}.jpg'], text: 'Picture from zesdro');
      file.delete();
    }
    
  }
}
