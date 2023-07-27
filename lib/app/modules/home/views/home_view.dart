import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:picvibe/app/model/imageFiles.dart';
import 'package:picvibe/app/utils/colors.dart';
import 'package:picvibe/app/utils/globalVariables.dart';
import 'package:picvibe/app/utils/images.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Pic Vibe'),
                ),
                Image.asset(
                  Images.logo,
                  height: 60,
                  width: 60,
                ),
              ],
            ),
          ),
          titleTextStyle: TextStyle(
              color: AppColors.shadeOrange.withOpacity(0.9),
              fontSize: 17,
              fontWeight: FontWeight.w600),
          backgroundColor: AppColors.white),
      body: StreamBuilder<List<ImageFiles>>(
          stream: GlobalVariables.instance.objectbox.getImages(),
          builder: (context, snapshot) => (snapshot.hasData &&
                  snapshot.data!.isNotEmpty)
              ? ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          child: Column(
                        children: [
                          Divider(
                            height: 2,
                            color: AppColors.silverOrange,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: (GlobalVariables
                                                  .instance.user!.photoURL !=
                                              "")
                                          ? const EdgeInsets.all(18)
                                          : const EdgeInsets.all(12),
                                      margin: const EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.platinum,
                                          image: (GlobalVariables.instance.user!
                                                      .photoURL !=
                                                  "")
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                      GlobalVariables.instance
                                                          .user!.photoURL))
                                              : null),
                                      child: (GlobalVariables
                                                  .instance.user!.photoURL !=
                                              "")
                                          ? Container()
                                          : Text(
                                              GlobalVariables.instance.user!
                                                  .displayName[0],
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.darkBlack),
                                            ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      GlobalVariables
                                          .instance.user!.displayName,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.darkBlack),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                    onTap: () {
                                      controller
                                          .downloadFile(snapshot.data![index]);
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.silverOrange
                                                .withOpacity(0.2)),
                                        child: Icon(
                                          Icons.download,
                                          size: 20,
                                          color: AppColors.shadeOrange,
                                        )))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 400,
                            child: Image.memory(snapshot.data![index].fileData),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: AppColors.shadeOrange,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      controller.shareIt(snapshot.data![index]);
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.silverOrange
                                                .withOpacity(.1)),
                                        child: Icon(
                                          Icons.share,
                                          color: AppColors.shadeOrange,
                                        ))),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                        ],
                      )

                          //  Stack(
                          //   children: [
                          //     Positioned(
                          //         child: Image.memory(
                          //             snapshot.data![index].fileData)),
                          //     Positioned(
                          //       right: 5,
                          //       top: 5,
                          //       child: GestureDetector(
                          //           onTap: () {
                          //             controller.shareIt(snapshot.data![index]);
                          //           },
                          //           child: Container(
                          //               padding: const EdgeInsets.all(3),
                          //               decoration: BoxDecoration(
                          //                   shape: BoxShape.circle,
                          //                   color: AppColors.platinum),
                          //               child: Icon(
                          //                 Icons.share,
                          //                 color: AppColors.darkBlack,
                          //               ))),
                          //     ),
                          //     Positioned(
                          //         left: 5,
                          //         top: 5,
                          //         child: GestureDetector(
                          //             onTap: () {
                          //               controller
                          //                   .downloadFile(snapshot.data![index]);
                          //             },
                          //             child: Container(
                          //                 padding: const EdgeInsets.all(3),
                          //                 decoration: BoxDecoration(
                          //                     shape: BoxShape.circle,
                          //                     color: AppColors.platinum),
                          //                 child: Icon(
                          //                   Icons.download,
                          //                   color: AppColors.darkBlack,
                          //                 ))))
                          //   ],
                          // ),

                          ),
                    );
                  })
              : Container(
                  height: Get.height,
                  child: const Center(
                    child: Text(
                      "No images posted yet,\n Post one!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                )),
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
