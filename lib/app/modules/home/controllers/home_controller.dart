import 'package:get/get.dart';
import 'package:zesdro/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var images = [].obs;
  @override
  void onInit() {
    super.onInit();
  }

  gotoProfilePage() {
    Get.toNamed(Routes.PROFILE_SCREEN);
  }

  gotoEditorPage() {
    Get.toNamed(Routes.EDITING_SCREEN);
  }
}
