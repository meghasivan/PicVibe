import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picvibe/app/utils/dbHelper.dart';
import 'package:picvibe/app/utils/globalVariables.dart';
import 'package:picvibe/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GetStorage.init();
  GlobalVariables.instance.objectbox = await ObjectBox.create();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "picvibe",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
