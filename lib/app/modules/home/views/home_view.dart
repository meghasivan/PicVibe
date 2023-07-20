import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zesdro/app/utils/colors.dart';
import 'package:zesdro/app/utils/globalVariables.dart';
import 'package:zesdro/app/utils/images.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Image.asset(Images.logo),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: controller.gotoProfilePage,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ProjectColors.platinum),
                child: (GlobalVariables.instance.user!.photoURL != "")
                    ? Image.network(GlobalVariables.instance.user!.photoURL)
                    : Text(
                        GlobalVariables.instance.user!.displayName[0],
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: ProjectColors.richBlack),
                      ),
              ),
            )
          ],
          backgroundColor: ProjectColors.white),
      body: ListView.builder(
          itemCount: controller.images.length,
          itemBuilder: (context, index) {
            return Container();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.gotoEditorPage,
        backgroundColor: ProjectColors.platinum,
        child: Icon(
          Icons.add,
          size: 50,
          color: ProjectColors.richBlack,
        ),
      ),
    );
  }
}
