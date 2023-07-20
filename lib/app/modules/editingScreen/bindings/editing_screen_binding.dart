import 'package:get/get.dart';

import '../controllers/editing_screen_controller.dart';

class EditingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditingScreenController>(
      () => EditingScreenController(),
    );
  }
}
