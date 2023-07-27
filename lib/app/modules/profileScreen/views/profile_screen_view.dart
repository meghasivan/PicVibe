import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:picvibe/app/model/imageFiles.dart';
import 'package:picvibe/app/utils/colors.dart';
import 'package:picvibe/app/utils/globalVariables.dart';

import '../controllers/profile_screen_controller.dart';

// ignore: must_be_immutable
class ProfileScreenView extends GetView<ProfileScreenController> {
  ProfileScreenView({Key? key}) : super(key: key);

  double continerSize = Get.width - 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    width: Get.width,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            CupertinoIcons.back,
                            color: AppColors.darkBlack,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextButton(
                            onPressed: controller.logout,
                            child: Text(
                              "Sign Out",
                              style: TextStyle(
                                  color: AppColors.darkBlack,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          padding:
                              (GlobalVariables.instance.user!.photoURL != "")
                                  ? const EdgeInsets.all(50)
                                  : const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.platinum,
                              image: (GlobalVariables.instance.user!.photoURL !=
                                      "")
                                  ? DecorationImage(
                                      image: NetworkImage(GlobalVariables
                                          .instance.user!.photoURL))
                                  : null),
                          child: (GlobalVariables.instance.user!.photoURL != "")
                              ? Container()
                              : Text(
                                  GlobalVariables.instance.user!.displayName[0],
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.darkBlack),
                                ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              GlobalVariables.instance.user!.displayName,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkBlack),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              GlobalVariables.instance.user!.email,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.darkBlack),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: 3,
                      color: AppColors.darkBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  StreamBuilder<List<ImageFiles>>(
                      stream: GlobalVariables.instance.objectbox.getImages(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          return Column(
                              children: List.generate(
                                  (snapshot.data!.length / 3).ceil(), (index) {
                            List<Widget> children = [];

                            for (int i = 0; i < 3; i++) {
                              if (snapshot.data!.length > index + i) {
                                children.add(Container(
                                  width: continerSize / 3,
                                  height: continerSize / 3,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: AppColors.platinum,
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          image: MemoryImage(snapshot
                                              .data![index + i].fileData),
                                          fit: BoxFit.cover),
                                      border:
                                          Border.all(color: AppColors.white)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            controller.deleteImage(
                                                snapshot.data![index + i].id);
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.white
                                                      .withOpacity(.6)),
                                              child: Icon(
                                                Icons.delete,
                                                size: 15,
                                                color: AppColors.shadeOrange,
                                              ))),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            controller.editImage(
                                                snapshot.data![index + i]);
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.white
                                                      .withOpacity(.6)),
                                              child: Icon(
                                                Icons.edit,
                                                size: 15,
                                                color: AppColors.shadeOrange,
                                              )))
                                    ],
                                  ),
                                ));
                              }
                            }

                            return Row(
                              children: children,
                            );
                          }));
                        } else {
                          return Container(
                            height: Get.height * 0.5,
                            child: const Center(
                              child: Text(
                                "No uploaded images!",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        }
                      }),
                ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          fixedColor: AppColors.silverOrange,
          onTap: controller.navigatedBottombar,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.add_circled), label: 'Post Image'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), label: 'Acount'),
          ]),
    );
  }
}
