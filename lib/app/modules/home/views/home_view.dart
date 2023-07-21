import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zesdro/app/model/imageFiles.dart';
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
                padding: (GlobalVariables.instance.user!.photoURL != "")
                    ? const EdgeInsets.all(25)
                    : const EdgeInsets.all(15),
                margin: const EdgeInsets.only(right:8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ProjectColors.platinum,
                    image: (GlobalVariables.instance.user!.photoURL != "")
                        ? DecorationImage(
                            image: NetworkImage(
                                GlobalVariables.instance.user!.photoURL))
                        : null),
                child: (GlobalVariables.instance.user!.photoURL != "")
                    ? Container()
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
      body: StreamBuilder<List<ImageFiles>>(
                  stream: GlobalVariables.instance.objectbox.getImages(),
                  builder: (context, snapshot) => ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          itemCount: snapshot.hasData ? snapshot.data!.length : 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.memory(snapshot.data![index].fileData),
            );
          })),
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
